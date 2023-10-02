//SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract cryptoMonster is ERC20("CryptoMonster", "CMON") {
    enum phase {
        Seed,
        Private,
        Public
    }

    enum roles {
        Owner,
        privateProvider,
        publicProvider,
        User
    }
    
    struct User {
        address wallet;
        string login;
        roles role;
        uint256 balance;
        bool whitelistRequested;
        bool isInWhitelist;
    }

    struct Request {
        string login;
        address wallet; 
    }

    phase currentPhase = phase.Seed;

    Request[] whitelistRequests; // Запросы на попадание в белый список адресов, которые могут покупать Private токены

    uint256 public Time_start = block.timestamp; // Время старта системы
    uint256 Time_now = Time_start; // Текущее время
    uint256 public Time_system = Time_now; // Текущее время + время, которое увеличили пользователи
    uint256 Time_dif = 0; // Время, которое увеличили пользователи
    uint256 tokenCost; // Стоимость токена
    uint256 transactionLimit; // Ограничение на количество токенов за одну покупку

    address owner;
    address privateProvider;
    address publicProvider;

    mapping (address => User) addressToUser;
    mapping (string => uint256) loginToPassword;
    mapping (address => mapping(phase => uint256)) addressToTokens; // Количество токенов из разных групп у пользователей
    mapping(address account => mapping(address spender => mapping(phase => uint256))) allowances;

    modifier registered(address _wallet) {
        if (_wallet == address(0)) {
            revert InvalidAddress(_wallet);
        }
        if (addressToUser[_wallet].wallet == address(0)) {
            revert InvalidAddress(_wallet);
        }
        _;
    }
    
    modifier onlyPhase(phase _phase) {
        _updatePhase();
        if (currentPhase != _phase) {
            revert PermissionDenied();
        }
        _;
    }

    modifier onlyRole(roles _role) {
        if (addressToUser[msg.sender].role != _role) {
            revert PermissionDenied();
        }
        _;
    }

    error ERC20InsufficientBalance(address from, uint256 fromBalance, uint256 value);
    error PermissionDenied();
    error InvalidAddress(address wallet);
    error InsufficientFunds(uint256 required, uint256 provided);

    constructor (
        address provider1, 
        address provider2, 
        address investor1, 
        address investor2, 
        address bestFriend
    ) {
        _mint(msg.sender, 10000000 * 10 ** decimals());
        currentPhase = phase.Seed;
        owner = msg.sender;
        privateProvider = provider1;
        publicProvider = provider2;

        addressToUser[msg.sender] = User(msg.sender, "owner", roles.Owner, 10000000 * 10 ** decimals(), false, false);
        addressToTokens[msg.sender][phase.Seed] = 1000000 * 10 ** decimals();
        addressToTokens[msg.sender][phase.Private] = 3000000 * 10 ** decimals();
        addressToTokens[msg.sender][phase.Public] = 6000000 * 10 ** decimals();

        addressToUser[provider1] = User(provider1, "provider1", roles.privateProvider, 0, false, false);
        addressToUser[provider2] = User(provider2, "provider2", roles.publicProvider, 0, false, false);
        addressToUser[investor1] = User(investor1, "investor1", roles.User, 0, false, false);
        addressToUser[investor2] = User(investor2, "investor2", roles.User, 0, false, false);
        addressToUser[bestFriend] = User(bestFriend, "bestFriend", roles.User, 0, false, false);

        transferToken(investor1, 300000, phase.Seed);
        transferToken(investor2, 400000, phase.Seed);
        transferToken(bestFriend, 200000, phase.Seed);
    }

    function balanceOf(address account) public view override returns (uint256) {
        return addressToUser[account].balance;
    }

    function tokensOf(address account, phase tokenGroup) public view returns(uint256) {
        return addressToTokens[account][tokenGroup];
    }

    function decimals() public pure override returns (uint8) {
        return 12;
    }

    function IncSysLifeTime1Min() public registered(msg.sender) {
        Time_dif += 60;
        _updatePhase();
    }

    function transferToken(address to, uint256 value, phase tokenGroup) public registered(msg.sender) registered(to) {
        value *= 10 ** decimals();
        uint256 tokens = tokensOf(msg.sender, tokenGroup);
        if(tokens < value) {
            revert ERC20InsufficientBalance(msg.sender, tokens, value);
        }
        transfer(to, value);
        addressToTokens[msg.sender][tokenGroup] -= value;
        addressToTokens[to][tokenGroup] += value;
        addressToUser[msg.sender].balance -= value;
        addressToUser[to].balance += value;
    }

    function transferTokenFrom(address from, address to, uint256 value, phase tokenGroup) public registered(msg.sender) registered(from) registered(to) {
        value *= 10 ** decimals();
        if(balanceOf(from) < value) {
            revert ERC20InsufficientBalance(from, balanceOf(from), value);
        }
        transferFrom(from, to, value);
        addressToTokens[from][tokenGroup] -= value;
        addressToTokens[to][tokenGroup] += value;
        addressToUser[from].balance -= value;
        addressToUser[to].balance += value;
    }

    function approveTokens(address spender, uint256 value, phase tokenGroup) public registered(msg.sender) {
        _approveTokens(msg.sender, spender, value, tokenGroup);
    }

    function whitelistRequest() public registered(msg.sender) {
        _updatePhase();
        if (currentPhase != phase.Public) {
            User memory user = addressToUser[msg.sender];
            if (!user.whitelistRequested) {
                whitelistRequests.push(Request(user.login, msg.sender));
            }
        }
    }

    function processRequest(uint256 requestId, bool confirm) public onlyRole(roles.privateProvider) {
        _updatePhase();
        if (currentPhase != phase.Public) {
            if (confirm) {
                addressToUser[whitelistRequests[requestId].wallet].isInWhitelist = true;
            }

            delete whitelistRequests[requestId];
            for (uint256 i = requestId; i < whitelistRequests.length - 1; i++) {
                whitelistRequests[i] = whitelistRequests[i + 1];
            }
            whitelistRequests.pop();
        }
    }

    function changeTokenCost(uint256 cost_Wei) public onlyRole(roles.publicProvider) onlyPhase(phase.Public) {
        tokenCost = cost_Wei;
    }

    function signUp(string calldata login, uint256 password) public {
        require(addressToUser[msg.sender].wallet == address(0), "You are already registered");
        require(loginToPassword[login] == 0, "This login is already registered");
        addressToUser[msg.sender] = User(msg.sender, login, roles.User, 0, false, false);
        loginToPassword[login] = password;
    }

    function buyToken(uint256 amount) public payable registered(msg.sender) {
        _updatePhase();
        uint256 value = amount * 10 ** decimals();
        if (currentPhase == phase.Public) {
            uint256 allowedTokens = allowances[owner][publicProvider][phase.Public];
            if (allowedTokens < value) {
                revert ERC20InsufficientBalance(publicProvider, allowedTokens, value);
            }
            if (msg.value < amount * tokenCost) {
                revert InsufficientFunds(amount * tokenCost, msg.value);
            }
            payable(owner).transfer(msg.value);
            allowances[owner][publicProvider][phase.Public] -= value;
            addressToTokens[msg.sender][phase.Public] += value;
            addressToUser[msg.sender].balance += value;
        } else if (currentPhase == phase.Private) {
            require(addressToUser[msg.sender].isInWhitelist, "Free sale not started");
            uint256 allowedTokens = allowances[owner][privateProvider][phase.Private];
            if (allowedTokens < value) {
                revert ERC20InsufficientBalance(privateProvider, allowedTokens, value);
            }
            if (msg.value < amount * tokenCost) {
                revert InsufficientFunds(amount * tokenCost, msg.value);
            }
            payable(owner).transfer(msg.value);
            allowances[owner][privateProvider][phase.Private] -= value;
            addressToTokens[msg.sender][phase.Private] += value;
            addressToUser[msg.sender].balance += value;
        } else {
            revert ("Sale not started");
        }
    }

    function _updatePhase() private {
        if (currentPhase != phase.Public) {
            Time_now = block.timestamp;
            Time_system = Time_now + Time_dif;
            uint256 minutesFromStart = (Time_system - Time_start) / 60;
            if (currentPhase == phase.Seed) {
                if (minutesFromStart >= 5) {
                    currentPhase = phase.Private;
                    tokenCost = 0.00075 ether;
                    transactionLimit = 100000;
                    _approveTokens(owner, privateProvider, 3000000, phase.Private);
                }
            } else if (currentPhase == phase.Private) {
                if (minutesFromStart >= 15) {
                    currentPhase = phase.Public;
                    _approveTokens(owner, privateProvider, 0, phase.Private);
                    _approveTokens(owner, publicProvider, 6000000, phase.Public);
                }
            }
        }
    }

    function _approveTokens(address from, address to, uint256 value, phase tokenGroup) private {
        value *= 10 ** decimals();
        if (addressToTokens[from][tokenGroup] < value) {
            revert ERC20InsufficientBalance(from, addressToTokens[from][tokenGroup], value);
        }
        _approve(from, to, value);
        uint256 allowedTokens = allowances[from][to][tokenGroup];
        addressToTokens[from][tokenGroup] += allowedTokens;
        _transfer(to, from, allowedTokens);

        addressToTokens[from][tokenGroup] -= value;
        allowances[from][to][tokenGroup] = value;
        _transfer(from, to, value);
    }

    // Test functions
    function showTime() public returns(uint256 startTime, uint256 systemTime) {
        _updatePhase();
        return (Time_start, Time_system);
    }

    function showPhase() public returns(phase) {
        _updatePhase();
        return (currentPhase);
    }

    function showWhitelistRequests() onlyRole(roles.privateProvider) public view returns(Request[] memory) {
        return whitelistRequests;
    }

    function showTokens(phase tokenGroup) public view registered(msg.sender) returns (uint256) {
        return addressToTokens[msg.sender][tokenGroup];
    }
}