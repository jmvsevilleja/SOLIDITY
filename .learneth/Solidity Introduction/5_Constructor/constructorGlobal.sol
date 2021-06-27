pragma solidity >=0.5.0 <0.7.0;


contract Coin {
    address public minter;

    // The constructor is a special function run during the 
    // creation of the contract and you cannot call it afterwards.
    constructor() public {
        // Code    
        minter = msg.sender;
    }
    
}