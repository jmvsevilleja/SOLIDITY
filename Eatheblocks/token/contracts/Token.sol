// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.6;

contract Token {
    // balances of every token owner
    mapping(address => uint) public balances;
    mapping(address => mapping(address => uint)) public allowance;
    // 0x3452342owner
    //   -> 0x4934spender => 10000 // spender allowance on behalf of the owner
    
    // Initial value that will never change
    uint public totalSupply = 10000 * 10 ** 18;
    string public name = "Godsend Token";
    string public symbol = "GODSEND";
    uint public decimals = 18;
    
    event Transfer(address indexed from, address indexed to, uint value);
    event Approval(address indexed owner, address indexed spender, uint value);
    
    constructor() {
        // the creator owns the whole supply
        balances[msg.sender] = totalSupply;
    }
        
    // basic read the balance of an owner address
    function balanceOf(address owner) public view returns(uint) {
        return balances[owner];
    }
    
    // basic transfer token to another address
    function transfer(address to, uint value) public returns(bool) {
        // sender require enough token
        require(balanceOf(msg.sender) > value);
        // add and remove token from respective balances
        balances[to] += value;
        balances[msg.sender] -= value;
        
        emit Transfer(msg.sender, to, value);
        return true; // BEP20 specification
    }
    
    // create the delegated transfer - another address to spend token on behalf of another address 
    function transferFrom(address from, address to, uint value) public returns(bool){
        // check if the owner has enough token
        require(balanceOf(from) >= value, "Balance too low");
        // check if the sender is approved spender and allowed transfer amount
        require(allowance[from][msg.sender] >= value, "Allowance too low");
        
        balances[to] += value;
        balances[from] -= value;
        
        emit Transfer(from, to, value);
        return true;
    }
    
    // approval of delegated transfer - allow smart contract to spend/manipulate token
    function approve(address spender, uint value) public returns(bool) {
        allowance[msg.sender][spender] = value;
        
        emit Transfer(msg.sender, spender, value);
        return true;
    }
}