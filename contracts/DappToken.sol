// SPDX-License-Identifier: MIT
pragma solidity ^0.5.0;

contract DappToken {
    
    string public name = "DApp Token";
    string public symbol = "DAPP";
    string public standard = "DApp Token v1.0";
    uint256 public totalSupply;

    event Transfer(
        address indexed _from,
        address indexed _to,
        uint256 _value
    );

    // approve
    event Approval(
        address indexed _owner,
        address indexed _spender,
        uint256 _value
    );

    mapping(address => uint256) public balanceOf;
    // allowance
    mapping(address => mapping(address => uint256)) public allowance;

    constructor (uint256 _initialSupply) public {
       balanceOf[msg.sender] = _initialSupply;
       totalSupply = _initialSupply;
    }


// Transfer Function
function transfer(address _to, uint256 _value) public returns (bool success) {
    // Exception if account doesnt have enough
    require(balanceOf[msg.sender] >= _value);
    // Transfer the balance
    balanceOf[msg.sender] -= _value;
    balanceOf[_to] += _value;
    
    // Transfer Event
    emit Transfer(msg.sender, _to, _value);

    // Return a boolean
    return true;
}
    // Delegated Transfer

    // approve
    function approve(address _spender, uint256 _value)public returns (bool success) {
        // handle allowance
    allowance[msg.sender][_spender] = _value;
        // Approve event
        emit Approval(msg.sender, _spender, _value);
        
        return true;
    }
    // Transfer from

    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        // Require _from has enough tokens
        require(_value <= balanceOf[_from]);
        // Require allowance is big enough
        require(_value <= allowance[_from][msg.sender]);
        // Change the balance
        //Update the allowance
        // Transfer event
        emit Transfer(_from, _to, _value);
        // return boolean
        return true;
    }
}