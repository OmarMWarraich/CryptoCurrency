// SPDX-License-Identifier: MIT
pragma solidity ^0.5.0;

contract DappToken {
    // Constructor
    // Set the total no. of tokens
    // Read the total no. of tokens
    uint256 public totalSupply;

    constructor() public {
        totalSupply = 1000000;
    }
}