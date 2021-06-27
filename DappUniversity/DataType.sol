// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

/**
 * @title Solidity for blockchain
 * @dev Store & retrieve value in a variable
 */
contract DataType {
    // State Variables  - stored in database/blockchain
    
    // int public = -1 // can be signed
    int public myInt = 1;
    
    // unsigned int = 1 // cant have negative
    uint public myUint = 1;
	uint256 public myUint256 = 1; // the default uint
	uint8 public myUint8 = 1; // how big the number can be 8 bit
    
    // Strings - collection of characters
    string public myString = "Hello, World!";
    bytes32 public myBytes32 = "Hello, World";
    
    // Address = where it comes from
    address public myAddress = 0x58b5Eb101d2b42CC5EA8024E0A99F787C186E5f5;
    
    // Data Structures
    // Struct = Model a data
    struct MyStruct {
    	uint myInt;
    	string myString;
    }
    
    MyStruct public myStruct = MyStruct(1, "Hello, World!");	
	
    // Local Variables - reuse inside the function
    // Because they don't modify the state, view and pure functions do not have a gas cost 
    function getValue() public pure returns(uint) {
        uint value = 1;
        return value;
        
    }

    function getMyUint() public view returns(uint) {
        return myUint;
    }

}