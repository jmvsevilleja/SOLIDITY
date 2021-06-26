// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

/**
 * @title Solidity for blockchain
 * @dev ERC20 Contract and Inheritance
 */
 
// pseudo ERC20 token smart contract
contract ERC20Token {
    string public name;
    mapping(address => uint256) public balances;
    
    constructor(string memory _name) {
        name = _name;
    }
    // increase the balance
    function mint() virtual public {
        balances[tx.origin] ++; // msg.sender is the address who instantiated this contract
    }
}

// Inherit ERC20Token
contract MyToken is ERC20Token {
    // string public name = "My Token" // overrides name from parent
    string public symbol;
    address[] public owners;
    uint256 ownerCount;
    
    // overrides parent constructor
    // overrides by ERC20Token modifier? and with added symbol
    constructor(string memory _name,  string memory _symbol ) ERC20Token (_name)  { 
         symbol = _symbol;
    }
        
    // overrides mint function
    function mint() override public {
        // update balance of the parent contract
        super.mint();
        ownerCount ++; // update owner count who own the token
        owners.push(msg.sender); // add them to the array of owners
    }
}