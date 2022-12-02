// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "./strings.sol";

contract Day2 {
    using strings for *;  

    function str_cmp(string memory str_1, string memory str_2) public pure returns (bool) {
        if (keccak256(abi.encodePacked(str_1)) == keccak256(abi.encodePacked(str_2))) {
            return true;
        } else {
            return false;
        }
    }

    function first_split(string memory in_str) public pure returns (string[] memory) {                                               
        strings.slice memory s = in_str.toSlice();                
        strings.slice memory delim = "\n".toSlice();                            
        string[] memory parts = new string[](s.count(delim)+1);                  
        for (uint i = 0; i < parts.length; i++) {                              
           parts[i] = s.split(delim).toString();                               
        }
        return parts;                                                                  
    }

    function calculate_score(string memory in_str) public pure returns (uint256) {
        if (str_cmp(in_str,  "A X")) {
            return 3 + 1;
        } else if (str_cmp(in_str, "A Y")) {
            return  6 + 2;
        } else if (str_cmp(in_str, "A Z")) {
            return 0 + 3;
        } else if (str_cmp(in_str, "B X")) {
            return 0 + 1;
        } else if (str_cmp(in_str, "B Y")) {
            return 3 + 2;
        } else if (str_cmp(in_str, "B Z")) {
            return 6 + 3;
        } else if (str_cmp(in_str, "C X")) {
            return 6 + 1;
        } else if (str_cmp(in_str, "C Y")) {
            return 0 + 2;
        } else if (str_cmp(in_str, "C Z")) {
            return 3 + 3;
        } else {
            return 0;
        }
    }

    function calculate_score_p2(string memory in_str) public pure returns (uint256) {
        if (str_cmp(in_str,  "A X")) {
            return 3 + 0;
        } else if (str_cmp(in_str, "A Y")) {
            return 1 + 3;
        } else if (str_cmp(in_str, "A Z")) {
            return 2 + 6;
        } else if (str_cmp(in_str, "B X")) {
            return 1 + 0;
        } else if (str_cmp(in_str, "B Y")) {
            return 2 + 3;
        } else if (str_cmp(in_str, "B Z")) {
            return 3 + 6;
        } else if (str_cmp(in_str, "C X")) {
            return 2 + 0;
        } else if (str_cmp(in_str, "C Y")) {
            return 3 + 3;
        } else if (str_cmp(in_str, "C Z")) {
            return 1 + 6;
        } else {
            return 0;
        }
    }

    function p1(string memory input) private pure returns (uint256) {
        string[] memory array = first_split(input);
        uint256 score = 0;

        for (uint i = 0; i < array.length; i++) {                              
           score += calculate_score(array[i]);                           
        }

        return score;
    }

    function p2(string memory input) private pure returns (uint256) {
        string[] memory array = first_split(input);
        uint256 score = 0;

        for (uint i = 0; i < array.length; i++) {                              
           score += calculate_score_p2(array[i]);                           
        }

        return score;
    }

    function main(string memory input) external pure returns (uint256, uint256) {
        if (bytes(input).length == 0) {
            input = "A Y\nB X\nC Z\n";
        }

        return (p1(input), p2(input));
    }       
}