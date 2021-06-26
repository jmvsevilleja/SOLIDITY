// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

/**
 * @title Solidity for blockchain
 * @dev Store & retrieve value in a variable
 */
contract DataStruct {
    // Array - sorted list of items
    // Array of unsigned integers
    uint[] public uintArray = [1,2,3];
    // String of Array
    string[] public stringArray = ["apple","orange","raspberry"];
    // Array without values
    string[] public myArray;
    // Array of struct
    Book[] public arrayBooks;
    uint[][] public array2D = [[1,2,3],[4,5,6]];
    
    // Mapping - like array, key => value store
    mapping(uint => string) public names;
    // mapping of struct data
    mapping(uint => Book) public mappingBooks;
    // Nested mapping
    mapping(address => mapping(uint => Book)) public senderBooks;
    // Data type struct - collection of Variables of different types
    struct Book {
        string title;
        string author;
    }
    constructor() {
        names[1] = "Jess";
    }
    
    // adding book in the database
    function addBook(uint _id, string memory _title, string memory _author) public {
        // adding associative mapping list
        mappingBooks[_id] = Book(_title, _author);
        // we can also push struct to array list
        arrayBooks.push(Book(_title, _author));
    }
    // adding nested mapping
    function addSenderBook(uint _id, string memory _title, string memory _author) public {
        senderBooks[msg.sender][_id] = Book(_title, _author);
    }
    // add value to myArray using push method
    function addValue(string memory _value) public {
        myArray.push(_value);
    }
    
    // count items in an Array using length properties
    function valueCount() public view returns (uint) {
        return myArray.length;
    }
    
}