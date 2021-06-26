// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

/**
 * @title Solidity for blockchain
 * @dev Math library
 */

// import external libraries 
// import "./Math.sol";
import "./SafeMath.sol";

// // Libraries can be a inside of file but use external file instead
// library Math {
//     function divide(uint256 a, uint256 b) internal pure returns (uint256) {
//         require(b > 0);
//         uint256 c = a / b;
//         return c;
//     }
// }

contract Library {
    // Call SafeMath directly on uint256
    using SafeMath for uint256;
    uint256 public value;
    
    function calculate(uint _value1, uint _value2) public {
        //value = _value1 / _value2; // DRY use libraries instead
        // value = Math.divide(_value1, _value2); // 
        // Using SafeMath Library
        // value = SafeMath.div(_value1, _value2);
        // Using SafeMath unsigned integer
        value = _value1.div(_value2);
    }
}