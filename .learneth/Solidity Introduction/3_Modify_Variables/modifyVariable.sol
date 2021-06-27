pragma solidity >=0.4.0 <0.7.0;

contract SimpleStorage {
    uint storedData;

    // a public function named set that returns a uint goes here
    // Because they don't modify the state, view and pure functions do not have a gas cost
    function get() public view returns (uint) {
        return storedData;
    }


    function set(uint _amount) public returns (uint) {
        storedData = _amount;
    }

}
