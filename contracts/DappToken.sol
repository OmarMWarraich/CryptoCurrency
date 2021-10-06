// SPDX-License-Identifier: MIT
pragma solidity ^0.5.0;

contract DappToken {
    // Name
    string public name = "DApp Token";
    string public symbol = "DAPP";
    string public standard = "DApp Token v1.0";
    // Symbol

    uint256 public totalSupply;

    mapping(address => uint256) public balanceOf;

    constructor(uint256 _initialSupply) public {
       balanceOf[msg.sender] = _initialSupply;
       totalSupply = _initialSupply;
    }
}