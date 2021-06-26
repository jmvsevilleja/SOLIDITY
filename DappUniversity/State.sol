// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

/**
 * @title Solidity for blockchain
 * @dev Enumerations
 */
contract States {
    enum State { Waiting, Ready, Active }
    State public state;
    
    constructor() {
        state = State.Waiting;
    }
    
    function ready() public {
        state = State.Ready;
    }
 
    function activate() public {
        state = State.Active;
    }
    
    function isActive() public view returns(bool){
        return state == State.Active;
    }
    
    
}