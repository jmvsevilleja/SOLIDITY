// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

/**
 * @title HotelRoom
 * @dev Code Cryptocurrency Payments
 * Ether- pay smart contracts
 * Modifiers
 * Visibility
 * Events
 * Enums
 */

// Smart contract for a hotel room, pay to book the hotel room
contract HotelRoom {
    // Vacant or Occupied
    enum Statuses { Vacant, Occupied }
    Statuses currentStatus;
    // store the owner, who deployed the contract
    address payable public owner;
    // events
    event Occupy(address _occupant, uint _value);
    
    // dynamically assign an owner upon deployment
    constructor() {
        owner = payable(msg.sender);
        // Set the currentStatus to Vacant
        currentStatus = Statuses.Vacant;
    }
    // modifiers
    modifier onlyWhileVacant {
        require(currentStatus == Statuses.Vacant, "Hotel room not vacant");
        _;
    }
    modifier costs (uint _amount){
        require(msg.value >= _amount, "Payment not enough");
        _;
    }
    
    
    // use special function receive that is called when payment is received.
    receive() external payable onlyWhileVacant costs(2 ether) {
    // function book() public payable onlyWhileVacant costs(2 ether) {
        // Check the status of the room and amount
        // cleaner code use modifier instead
        // require(currentStatus == Statuses.Vacant, "Hotel room not vacant");
        // require(msg.value >= 2 ether, "Payment not enough");
        
        // Set the currentStatus to Occupied
        currentStatus = Statuses.Occupied;
        // the amount of ether to be transfered to the owner
        owner.transfer(msg.value);
        
        // emit event
        emit Occupy(msg.sender, msg.value);
    }
}