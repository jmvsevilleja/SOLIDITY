// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

/**
 * @title Solidity for blockchain
 * @dev Functions modifier
 */
contract Functions {
    // total person added and tracked by this counter
    uint256 public peopleCount = 0;
    // key value list of Person data struct using people variable
    mapping(uint => Person) public people;
    // address variable
    address owner;
    // time declaration epoch https://www.epochconverter.com
    uint256 openingTime = 1624610591;
    
    // MODIFIERS
    // checks who can modify using require
    modifier onlyOwner() {
        // logic that checks the caller(msg.sender) equals owner who created this contract
        require(msg.sender == owner); // throws an error if false
        _; // special symbol that tells function to execute if condition is satisfied otherwise exception is thrown.
    }
    
    // checks time restrictions
    modifier onlyWhileOpen() {
        // logic that checks block.timestamp (current time) greater than specified time 
        require(block.timestamp >= openingTime);
        _; 
    }
    
    // create a struct data type named Person
    struct Person {
        uint _id;
        string _firstName;
        string _lastName;
    }

    constructor() {
        // store the contract account to a variable owner
        owner = msg.sender;
    }
    // public modified function that adds passed arguments to the list and increment count
    function addPerson(
        string memory _firstName,
        string memory _lastName
    )
        public
        onlyOwner // modifier only owner can call this function
        onlyWhileOpen // When specified time has passed
    {
        people[peopleCount] = Person(peopleCount, _firstName, _lastName); // inserting an array list using global count variable
        incrementCount(); // calling internal functions
    }
    // Internal fucntion not exposed outside the contract but can be accessed by other function
    function incrementCount() internal {
        peopleCount ++; // increment count
    }
}