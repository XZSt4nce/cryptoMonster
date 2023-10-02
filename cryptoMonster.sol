//SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract cryptoMonster is ERC20("CryptoMonster", "CMON") {
    enum phase {
        Seed,
        Private,
        Public
    }
    
    struct User {
        address wallet;
        string login;
        uint256 balance;
    }

    struct Request {
        string login;
        address wallet; 
    }

    phase currentPhase = phase.Seed;

    Request[] whitelistRequests; // Запросы на попадание в белый список адресов, которые могут покупать Private токены

    uint256 Time_start = block.timestamp; // Время старта системы
    uint256 Time_now = Time_start; // Текущее время
    uint256 Time_system = Time_now; // Текущее время + время, которое увеличили пользователи
    uint256 Time_dif = 0; // Время, которое увеличили пользователи
    uint256 tokenCost; // Стоимость токена
    uint256 transactionLimit; // Ограничение на количество токенов за одну покупку

    address privateProvider;
    address publicProvider;

    mapping (address => User) addressToUser;
    mapping (string => uint256) loginToPassword;
    mapping (address => bool) whitelist; // Белый список адресов, которые могут покупать Private токены

    modifier onlyPhase(phase _phase) {
        _updatePhase();
        if (currentPhase != _phase) {
            revert PermissionDenied();
        }
        _;
    }

    error Overflow(address wallet, uint256 balance, uint256 value);
    error ERC20InsufficientBalance(address from, uint256 fromBalance, uint256 value);
    error PermissionDenied();

    constructor (
        address provider1, 
        address provider2, 
        address investor1, 
        address investor2, 
        address bestFriend
    ) {
        _mint(msg.sender, 10000000 * 10 ** decimals());
        currentPhase = phase.Seed;
        privateProvider = provider1;
        publicProvider = provider2;

        addressToUser[msg.sender] = User(msg.sender, "owner", 10000000 * 10 ** decimals());
        addressToUser[provider1] = User(provider1, "provider1", 0);
        addressToUser[provider2] = User(provider2, "provider2", 0);
        addressToUser[investor1] = User(investor1, "investor1", 0);
        addressToUser[investor2] = User(investor2, "investor2", 0);
        addressToUser[bestFriend] = User(bestFriend, "bestFriend", 0);

        transfer(investor1, 300000 * 10 ** decimals());
        transfer(investor2, 400000 * 10 ** decimals());
        transfer(bestFriend, 200000 * 10 ** decimals());
    }

    function totalSupply() public view override returns (uint256) {
        return addressToUser[msg.sender].balance;
    }

    function balanceOf(address account) public view override  returns (uint256) {
        return addressToUser[account].balance;
    }

    function decimals() public pure override returns (uint8) {
        return 12;
    }

    function IncSysLifeTime1Min() public {
        Time_dif += 60;
    }

    function transferToken(address to, uint256 value) public {
        transfer(to, value);
        if(totalSupply() < value) {
            revert ERC20InsufficientBalance(msg.sender, totalSupply(), value);
        }
        if(balanceOf(to) + value < balanceOf(to)) {
            revert Overflow(to, addressToUser[to].balance, value);
        }
        addressToUser[msg.sender].balance -= value;
        addressToUser[to].balance += value;
    }

    function transferTokenFrom(address from, address to, uint256 value) public {
        transferFrom(from, to, value);
        if(balanceOf(from) < value) {
            revert ERC20InsufficientBalance(from, balanceOf(from), value);
        }
        if(balanceOf(to) + value < balanceOf(to)) {
            revert Overflow(to, addressToUser[to].balance, value);
        }
        addressToUser[from].balance -= value;
        addressToUser[to].balance += value;
    }

    function whitelistRequest(string calldata login, address wallet) public onlyPhase(phase.Private) {
        whitelistRequests.push(Request(login, wallet));
    }

    function processRequest() public onlyPhase(phase.Private) {
        if (msg.sender != privateProvider) {
            revert PermissionDenied();
        }
    }

    function buyToken() public {
        
    }

    function _updatePhase() private {
        if (currentPhase != phase.Public) {
            Time_now = block.timestamp;
            Time_system = Time_now + Time_dif;
            uint256 minutesFromStart = (Time_system - Time_start) / 60;
            if (currentPhase == phase.Seed) {
                if (minutesFromStart < 15) {
                    currentPhase = phase.Private;
                    tokenCost = 0.00075 ether;
                    transactionLimit = 100000;
                    approve(privateProvider, 3000000 * 10 ** decimals());
                }
            } else if (currentPhase == phase.Private) {
                if (minutesFromStart >= 15) {
                    currentPhase = phase.Public;
                    approve(privateProvider, 0);
                    approve(publicProvider, 6000000 * 10 ** decimals());
                }
            }
        }
    }
}