// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.8.0;

/**
 * @title Election
 * @dev voting smart contract
 */

contract Election {

    // Model Candidate
    struct Candidate {
        uint id;
        string name;
        uint voteCount;
    }

    string public candidate;

    constructor() public {
        candidate = "First Candidate";
    }


    // Store candidate
    // Read candidate
}