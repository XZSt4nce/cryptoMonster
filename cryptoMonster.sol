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
        uint256 balanceSeed;
        uint256 balancePrivate;
        uint256 balancePublic;
        bool isInWhitelist;
    }

    struct Request {
        string login;
        address wallet;
        bool isConfirmed;
    }

    phase currentPhase = phase.Seed;

    Request[] whitelistRequests; // Запросы на попадание в белый список адресов, которые могут покупать Private токены

    uint256 public Time_start = block.timestamp; // Время старта системы
    uint256 Time_dif = 0; // Время, которое увеличили пользователи
    uint256 token = 10 ** decimals(); // Один целый токен
    uint256 ownerAvailable = 900_000*token; // Количество токенов, доступных владельцу для использования
    uint256 tokenCost; // Стоимость токена
    uint256 transactionLimit; // Ограничение на количество токенов за одну покупку

    address owner = 0xBE682A39f17D93753EAd1bAD15DB0A597ba35cE2;
    address privateProvider = 0x771015557Ed9aa53a8095b392c95D86113BAeD0E;
    address publicProvider = 0x27695988A13Ca5bD98EE0A22E2208753eA920486;

    mapping(address => User) addressToUser;
    mapping(string => address) loginToAddress;
    mapping(string => bytes32) loginToPassword;
    mapping(address account => mapping(address spender => mapping(phase => uint256))) allowances;
    
    modifier onlyPhase(phase _phase) {
        _updatePhase();
        require(currentPhase == _phase, unicode"Доступ запрещён");
        _;
    }

    modifier onlyRole(roles _role) {
        require(addressToUser[msg.sender].role == _role, unicode"Доступ запрещён");
        _;
    }

    constructor () {
        require(msg.sender == owner, unicode"Вы не владелец");
        address investor1 = 0x47d12316fd3Cc738BAEC9B83f1983c7273fB8476;
        address investor2 = 0x0308Ef127c1016496127Eeb6BBe7fA1b440E4c59;
        address bestFriend = 0xAA432dAe9A51fE5E2871C13523f17cfb37AF9a09;

        _mint(owner, 10_000_000*token);
        currentPhase = phase.Seed;

        addressToUser[owner] = User(msg.sender, "owner", roles.Owner, 1_000_000*token, 3_000_000*token, 6_000_000*token, false);
        addressToUser[privateProvider] = User(privateProvider, "privateProvider", roles.privateProvider, 0, 0, 0, false);
        addressToUser[publicProvider] = User(publicProvider, "publicProvider", roles.publicProvider, 0, 0, 0, false);
        addressToUser[investor1] = User(investor1, "investor1", roles.User, 0, 0, 0, false);
        addressToUser[investor2] = User(investor2, "investor2", roles.User, 0, 0, 0, false);
        addressToUser[bestFriend] = User(bestFriend, "bestFriend", roles.User, 0, 0, 0, false);

        transferToken(investor1, 300_000*token, phase.Seed);
        transferToken(investor2, 400_000*token, phase.Seed);
        transferToken(bestFriend, 200_000*token, phase.Seed);
    }

    function getBalance(address wallet) public view returns(uint256 _balanceETH, uint256 _balanceSeed, uint256 _balancePrivate, uint256 _balancePublic) {
        User memory _user = addressToUser[wallet];
        return (msg.sender.balance, _user.balanceSeed, _user.balancePrivate, _user.balancePublic);
    }

    function getWhitelistRequests() public view onlyRole(roles.privateProvider) returns (Request[] memory) {
        return whitelistRequests;
    }

    function decimals() public pure override returns (uint8) {
        return 12;
    }

    function IncSysLifeTime1Min() public {
        Time_dif += 60;
    }

    function transferToken(address to, uint256 value, phase tokenGroup) public {
        if (msg.sender == owner) {
            require(ownerAvailable >= value, unicode"Недостаточно токено");
            ownerAvailable -= value;
        }

        if (tokenGroup == phase.Seed) {
            require(addressToUser[msg.sender].balanceSeed >= value, unicode"Недостаточно токенов");
            addressToUser[msg.sender].balanceSeed -= value;
            addressToUser[to].balanceSeed += value;
            
        } else if (tokenGroup == phase.Private) {
            require(addressToUser[msg.sender].balancePrivate >= value, unicode"Недостаточно токенов");
            addressToUser[msg.sender].balancePrivate -= value;
            addressToUser[to].balancePrivate += value;
        } else {
            require(addressToUser[msg.sender].balancePublic >= value, unicode"Недостаточно токенов");
            addressToUser[msg.sender].balancePublic -= value;
            addressToUser[to].balancePublic += value;
        }

        if (to == owner) {
            ownerAvailable += value;
        }
        transfer(to, value);
    }

    function transferTokenFrom(address from, address to, uint256 value, phase tokenGroup) public {
        require(allowances[from][msg.sender][tokenGroup] >= value, unicode"Недостаточно токенов");
        allowances[from][msg.sender][tokenGroup] -= value;
        if (tokenGroup == phase.Seed) {
            addressToUser[to].balanceSeed += value;
        } else if (tokenGroup == phase.Private) {
            addressToUser[to].balancePrivate += value;
        } else {
            addressToUser[to].balancePublic += value;
        }

        if (to == owner) {
            ownerAvailable += value;
        }
    }

    function whitelistRequest() public onlyPhase(phase.Seed) {
        User memory user = addressToUser[msg.sender];
        bool notRequested = true;
        for (uint256 i = 0; i < whitelistRequests.length; i++) {
            if (whitelistRequests[i].wallet == msg.sender) {
                notRequested = false;
                break;
            }
        }
        require(notRequested, unicode"Вы уже отправили заявку");
        whitelistRequests.push(Request(user.login, msg.sender, false));
    }

    function processRequest(uint256 requestId, bool confirm) public onlyRole(roles.privateProvider) {
        require(whitelistRequests[requestId].wallet != address(0), unicode"Заявка не существует");
        require(!whitelistRequests[requestId].isConfirmed, unicode"Заявка уже обработана");
        if (confirm) {
            whitelistRequests[requestId].isConfirmed = true;
            addressToUser[whitelistRequests[requestId].wallet].isInWhitelist = true;
        } else {
            delete whitelistRequests[requestId];
        }
    }

    function changeTokenCost(uint256 cost_Wei) public onlyRole(roles.publicProvider) onlyPhase(phase.Public) {
        require(cost_Wei >= token, unicode"Цена слишком маленькая");
        tokenCost = cost_Wei / token;
    }

    function signUp(string calldata login, string calldata password) public {
        require(addressToUser[msg.sender].wallet == address(0), unicode"Вы уже зарегистрированы");
        require(loginToAddress[login] == address(0), unicode"Пользователь с таким логином уже зарегистрирован");
        addressToUser[msg.sender] = User(msg.sender, login, roles.User, 0, 0, 0, false);
        loginToPassword[login] = keccak256(abi.encodePacked(password));
    }

    function signIn(string calldata _login, string calldata _password) public view returns(User memory) {
        require(loginToPassword[_login] == keccak256(abi.encodePacked(_password)), unicode"Пароль не верный");
        return (addressToUser[loginToAddress[_login]]);
    }

    function getTime() public view returns(uint256){
        return block.timestamp + Time_dif - Time_start;
    }

    function buyToken(uint256 amount) public payable {
        _updatePhase();
        address provider;
        require(msg.value >= amount / 10**12 * tokenCost, unicode"Недостаточно средств");
        require(currentPhase != phase.Seed, unicode"Продажа не началась");
        require(amount <= transactionLimit, unicode"Вы вышли за лимит покупки токенов за транзакцию");
        if (currentPhase == phase.Public) {
            provider = publicProvider;
            payable(owner).transfer(msg.value);
            addressToUser[msg.sender].balancePublic += amount;
        } else {
            require(addressToUser[msg.sender].isInWhitelist, unicode"Свободная продажа не началась");
            provider = privateProvider;
            payable(owner).transfer(msg.value);
            addressToUser[msg.sender].balancePrivate += amount;
        }
        uint256 allowedTokens = allowances[owner][provider][currentPhase];
        require(allowedTokens >= amount, unicode"Недостаточно токенов");
        allowances[owner][provider][currentPhase] -= amount;
    }

    function approveTokens(address spender, uint256 value, phase tokenGroup) public {
        if (msg.sender == owner) {
            require(ownerAvailable >= value, unicode"Недостаточно токенов");
            require(spender != publicProvider, unicode"Владелец не может вызывать этот метод по отношению к Public provider");
            if (spender == privateProvider) {
                require(currentPhase != phase.Private, unicode"Владелец не может вызывать этот метод по отношению к Private provider во время Private фазы");
            }
        }
        _approveTokens(msg.sender, spender, value, tokenGroup);
    }

    function _updatePhase() private {
        if (currentPhase != phase.Public) {
            uint256 secondsFromStart = getTime();
            if (secondsFromStart > 5 minutes) {
                if (secondsFromStart > 15 minutes) {
                    tokenCost = 0.001 ether / token;
                    transactionLimit = 5_000*token;
                    ownerAvailable += allowances[owner][privateProvider][phase.Private];
                    _approveTokens(owner, privateProvider, 0, phase.Private);
                    _approveTokens(owner, publicProvider, 6_000_000*token, phase.Public);
                    currentPhase = phase.Public;
                } else if (currentPhase == phase.Seed) {
                    tokenCost = 0.00075 ether / token;
                    transactionLimit = 100_000*token;
                    ownerAvailable += 100_000*token;
                    _approveTokens(owner, privateProvider, 3_000_000*token, phase.Private);
                    currentPhase = phase.Private;
                }
            }
        }
    }

    function _approveTokens(address from, address to, uint256 value, phase tokenGroup) private {
        uint256 allowedTokens = allowances[from][to][tokenGroup];
        allowances[from][to][tokenGroup] = value;

        if (tokenGroup == phase.Seed) {
            require(addressToUser[from].balanceSeed >= value, unicode"Недостаточно токенов");
            addressToUser[from].balanceSeed += allowedTokens;
            addressToUser[from].balanceSeed -= value;
        } else if (tokenGroup == phase.Private) {
            require(addressToUser[from].balancePrivate >= value, unicode"Недостаточно токенов");
            addressToUser[from].balancePrivate += allowedTokens;
            addressToUser[from].balancePrivate -= value;
        } else {
            require(addressToUser[from].balancePublic >= value, unicode"Недостаточно токенов");
            addressToUser[from].balancePublic += allowedTokens;
            addressToUser[from].balancePublic -= value;
        }
    }
}