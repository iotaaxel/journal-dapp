// SPDX-License-Identifier: MIT
pragma solidity 0.8.11;


contract Migrations {
    address public owner = msg.sender;
    uint public lastCompletedMigration;

    modifier restricted() {
        // Restrict to contract owner
        require(msg.sender == owner);
        _;
    }

    function setCompleted(uint completed) public restricted {
        lastCompletedMigration = completed;
    }
}
