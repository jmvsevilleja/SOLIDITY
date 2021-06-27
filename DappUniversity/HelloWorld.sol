// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

/**
 * @title Storage
 * @dev Store & retrieve value in a variable
 */
contract HelloWorld {
    string private message = "Hello World!!!";
    string public name = "Jess"; // public variable has view function by default

    // initial message passed using constructor
    constructor(string memory _msg) {
        message = _msg;
    }

    // getter function
    function getMessage() public view returns (string memory) {
        return message;
    }

    // setter function
    function setMessage(string memory _message) public {
        message = _message;
    }
}
