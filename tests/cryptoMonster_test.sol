// SPDX-License-Identifier: GPL-3.0
        
pragma solidity ^0.8.18;

// This import is automatically injected by Remix
import "remix_tests.sol"; 

// This import is required to use custom transaction context
// Although it may fail compilation in 'Solidity Compiler' plugin
// But it will work fine in 'Solidity Unit Testing' plugin
import "remix_accounts.sol";
// <import file to test>
import "../cryptoMonster.sol";

// File name has to end with '_test.sol', this file can contain more than one testSuite contracts
contract testSuite {

    cryptoMonster cmon;
    /// #sender: account-0
    function beforeAll() public {
        address[] memory addresses = new address[](5);
        for (uint256 i = 1; i < 6; i++) {
            addresses[i - 1] = TestsAccounts.getAccount(i);
        }
        cmon = new cryptoMonster(addresses);
    }

    function checkTimeSuccess() public {
        cmon.IncSysLifeTime1Min();
        uint256 time = cmon.getTime();
        Assert.lesserThan(time, uint(60), "time should be lesser than 60s");
    }

    /// #sender: account-1
    /// #value: 100
    // function checkSenderAndValue() public payable {
    //     // account index varies 0-9, value is in wei
    //     Assert.equal(msg.sender, TestsAccounts.getAccount(1), "Invalid sender");
    //     Assert.equal(msg.value, 100, "Invalid value");
    // }
}
    