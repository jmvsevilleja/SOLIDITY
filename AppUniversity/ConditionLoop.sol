// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

/**
 * @title Solidity for blockchain
 * @dev Conditionals and Loops
 */
contract ConditionLoop {
    // declare numbers
    uint[] public numbers = [1,2,3,4,5,6,7,8,9,10];
    
    address public owner;
    constructor() {
        owner = msg.sender;
    }
    
    function countEvenNumbers() public view returns (uint) {
        uint count = 0;
        // loop trough those numbers
        for(uint i = 0; i < numbers.length; i++) {
            if(isEvenNumber(numbers[i])){
                count ++;
            }
        }
        return count;
    }
    
    // Conditions if else
    function isEvenNumber(uint _number) public pure returns(bool) {
        // 4 % 2 == 0 
        if((_number % 2) == 0) {
            return true;
        } else {
            return false;
        }
    }
    
    // Returns directly the result
    function isOwner() public view returns(bool) {
        return(msg.sender == owner);
    }
}   