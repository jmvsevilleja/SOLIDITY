// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

/**
 * @title Solidity for blockchain
 * @dev Buy Token and Events
 */
contract BuyToken {
    // track person balance
    mapping(address => uint256) public balances;
    // send funds to this wallet
    address payable wallet; // wallet that accepts ether 
    
    // events
    event Purchase(
        address indexed _buyer, // filter events, subscribe for specific address
        uint256 _amount
    );
    
    // accepts ether address on deployment
    constructor(address payable _wallet) { // wallet that accepts ether
        wallet = _wallet;
    }
    
    // fallback - function called anytime an account sends Ether to a smart contract
    // The fallback function always receives data but to also receive Ether, you should mark it as payable
    //  when no other function matches (not even the receive function). Optionally payable.
    fallback() external payable  {
        // buyToken();
    }
    // receive -  function called for plain Ether transfers
    // for empty calldata (and any value)
    receive() external payable {
        // nothing here
        buyToken();
    }
    
    // issue a token and recieve ether
    function buyToken() public payable { // payable - accepts ether
        // get Token
        balances[msg.sender] += 1; //logic here for how many token you'll recieve after sending ether
        // deduct ether from current account and send it to wallet defined
        wallet.transfer(msg.value);
        emit Purchase(msg.sender, 1); // clients can subscribe to this event to get passed arguments
        // other usecase: you can get the entire event stream from a smart contract
    }
}