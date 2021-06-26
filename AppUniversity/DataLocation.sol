// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

/**
 * @title Solidity for blockchain
 * @dev Store & retrieve value in a variable
 */
contract DataLocation {
    struct Professor {
        uint age;
        string name;
    }
    
    string constant course_name = "Painting";
    // creating global variable with Professor data struct type
    Professor public module_leader;
    
    constructor() {
        module_leader.age = 138;
        module_leader.name = "Pablo Picasso";
    }
    
    // The modifyModuleLeader() function writes to the state and overwrite the contract’s storage.
    // Assigning the Struct type to a local variable, mention the data location: storage, memory or calldata.
    function modifyModuleLeaderStorage(uint _age, string memory _name) public {
        // storage will only stores a reference or direct pointer (It will not copy the struct)
        // It modifies the contract’s storage module_leader
        Professor storage new_module_leader = module_leader; // assigns the reference
        // This will override the struct in storage (global variable)
        new_module_leader.age = _age;
        new_module_leader.name = _name;
        // storage will do like this
        // module_leader.age = _age;
        // module_leader.name = _name;
    }
    
    function modifyModuleLeaderMemory(uint _age, string memory _name) public view returns(Professor memory) {      
        // memory will let the local state variable module_leader not overwritten
        Professor memory new_module_leader = module_leader; // assigns a copy of the struct in memory
        // This will override the copy of the struct in memory (local variable)
        new_module_leader.age = _age;
        new_module_leader.name = _name;
        return(new_module_leader);
    }
}