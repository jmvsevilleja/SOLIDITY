// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

/**
 * @title Solidity for blockchain
 * @dev Buy Token and ERC20 Contract
 */
 
// pseudo ERC20 token smart contract
contract ERC20Token {
    string name;
    mapping(address => uint256) public balances;

    function mint() public {
        balances[tx.origin] ++; // msg.sender is the address who instantiated this contract
        // use tx.origin to reference the account that originated the transaction
    }
}

// mint tokens from this contract using the ERC20Token
contract MultipleContract {
    
    // send funds to this wallet
    address payable wallet; // wallet that accepts ether 
    // address public token; // refactor this to ERC20Token data type
    ERC20Token public token; // we can store the token in a state varaible
    
    
    // accepts ether address on deployment
    constructor(address payable _wallet, ERC20Token _token) { 
        wallet = _wallet; // wallet that accepts ether
        token = _token; // ERC token address we are buying
    }
    
    // issue a token and recieve ether
    function buyToken() public payable { // payable - accepts ether
        // instantiate ERC20Token contract to mint token
        // ERC20Token _token = ERC20Token(address(token)); // get the address reference of the ERC20Token
        // _token.mint(); // call mint 
        // ERC20Token(address(token)).mint(); // shorthand
        token.mint(); // refactor ERC20Token as data type
        // deduct ether from current account and send it to wallet defined
        wallet.transfer(msg.value);
    }
}