// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <0.7.0;

contract Coin {
    address public minter;
    mapping (address => uint) public balances;

    event Sent(address from, address to, uint amount);

    constructor() public {
        minter = msg.sender;
    }
    
    // Solidity uses state-reverting exceptions to handle errors
    // There are three convenience functions available: assert, require, and revert
    
    
    // Create two new public functions
    // one called mint (that creates new coins in the creators accounts)
    // Give both functions two parameters: an address called receiver, and a uint called amount.
    function mint(address receiver, uint amount) public {
        // Add two require functions to the mint function
        // One that checks if the caller of the function is the same as the creator
        require(msg.sender == minter, "Caller should be the same as the creator");
        // one that checks if amount is less than 1* (10 ^ 60)
        require(amount <  (1 *(10 ** 60)), "Amount should be less than  1 * (10 ^ 60)");
        // then add amount to the balance of the receiver address.
        balances[receiver] += amount;
    }
    
    // one called send (that sends coins to someone else)
    function send(address receiver, uint amount) public {
        // Add one require function to the send function that checks 
        // if the caller of the function has enough coins to send the amount passed
        require(balances[msg.sender] > 0, "Not enough balance");
        
        // reduce the senders balance by the amount
        balances[msg.sender] -= amount;
        // and send it to the recipient
        balances[receiver] += amount;
        
        //  Finally emit the Sent event created earlier.
        emit Sent(msg.sender, receiver, amount);
    }
    
}