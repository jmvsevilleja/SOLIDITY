pragma solidity >=0.4.0 <0.7.0;

contract SimpleStorage {
    // put the state variable here
    uint256 storedData = 3;
    
    function get() public view returns (uint256) {
        return storedData;
    }
}