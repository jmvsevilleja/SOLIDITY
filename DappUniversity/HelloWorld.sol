// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

/**
 * @title Storage
 * @dev Store & retrieve value in a variable
 */
contract HelloWorld {
    string private message = "Hello World!!!";
    string public name;
    
    constructor(string memory _msg)  {
        message = _msg;
    }
    
    function getMessage() public view returns(string memory){
        return message; 
    }
    
    function setMessage(string memory _message) public {
        message = _message;
    }
}