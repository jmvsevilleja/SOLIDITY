// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

/**
 * @title Solidity for blockchain
 * @dev Smart contract that handles a secret
 * Inheritance - is
 * Factories
 * Smart contract interactions
 */
 
contract Ownable {
    address public owner;

    constructor() {
        owner = msg.sender;
    }
    
    modifier onlyOwner(){
        require(msg.sender == owner, "must be owner");
        _;
    }
}

// Parent contract 
contract SecretVault {
    string secret;
    
    constructor(string memory _secret) {
        secret = _secret;
    }
    
    // restrict who is calling this function
    function getSecret() public view returns(string memory){
        return secret;
    }    
}

// Inherit Ownable contract
contract Secret is Ownable {
    address vaultAdress;
    
    constructor(string memory _secret) {
        // instantiate parent contract, Factory pattern, created another contract
        SecretVault _secretVault = new SecretVault(_secret);
        // get and store the address of the newly created contract
        vaultAdress = address(_secretVault);
        super; // call Ownable constructor
    }
    
    function getSecret() public view onlyOwner returns(string memory) {
        // Fetch the contract interface by vaultAdress
        SecretVault _secretVault = SecretVault(vaultAdress);
        // call parent smart contracts functions
        return _secretVault.getSecret();
    }
}