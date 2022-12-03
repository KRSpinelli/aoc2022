// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "./strings.sol";

contract Day3 {
    using strings for *;

    function calculate_priority(bytes1 char) public pure returns (uint) {
        if (char >= 0x61) {
            return uint(uint8(char))-96;
        } else if (char >= 0x41) {
            return uint(uint8(char))-38;
        } else {
        	return 0;
        }
    }

	function find_dup(string memory input) public pure returns (bytes1) {
        // Split input in half
        // create mapping and store first half
        uint half_len = bytes(input).length/2;
        bytes1[] memory seen_items = new bytes1[](half_len);
		for (uint i = 0; i < (bytes(input).length/2); i++) {
			seen_items[i] = bytes(input)[i];
		}

        // loop through second half until dup is found
        for (uint i = (half_len); i < bytes(input).length; i++) {
            for (uint j = 0; j < seen_items.length; j++) {
                if (seen_items[j] == bytes(input)[i]) {
                    return seen_items[j];
                }
            }
		}
        return 0;
	}

    function split_lines(string memory in_str) public pure returns (string[] memory) {                                               
        strings.slice memory s = in_str.toSlice();                
        strings.slice memory delim = "\n".toSlice();                            
        string[] memory parts = new string[](s.count(delim)+1);                  
        for (uint i = 0; i < parts.length; i++) {                              
           parts[i] = s.split(delim).toString();                               
        }
        return parts;                                                                  
    }

    function find_badge(string memory elf1, string memory elf2, string memory elf3) public pure returns (bytes1) {
        for (uint i = 0; i < bytes(elf1).length; i++) {
            for (uint j = 0; j < bytes(elf2).length; j++) {
                if (bytes(elf1)[i] == bytes(elf2)[j]) {
                    for (uint k = 0; k < bytes(elf3).length; k++) {
                        if (bytes(elf1)[i] == bytes(elf3)[k]) {
                            return bytes(elf1)[i];
                        } 
                    }
                }
            }
        }
        return 0;
    }

    function p1(string memory input) public pure returns (uint) {
        uint total_priority = 0;
        string[] memory lines = split_lines(input);
        bytes1 dup;

        for (uint i = 0; i < lines.length; i++) {  
            dup = find_dup(lines[i]);
            total_priority += calculate_priority(dup);                           
        }

        return total_priority;
    }

    function p2(string memory input) public pure returns (uint) {
        uint total_priority = 0;
        string[] memory lines = split_lines(input);
        bytes1 badge;

        for (uint i = 0; i < lines.length-2; i=i+3) {  
            badge = find_badge(lines[i], lines[i+1], lines[i+2]);
            total_priority += calculate_priority(badge);                           
        }

        return total_priority;
    }


	function main(string memory input) external pure returns (uint, uint) {
        if (bytes(input).length == 0) {
            input = "vJrwpWtwJgWrhcsFMMfFFhFp\njqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL\nPmmdzqPrVvPwwTWBwg\nwMqvLMZHhHMvwLHjbvcjnnSBnvTQFn\nttgJtRGJQctTZtZT\nCrZsJsPPZsGzwwsLwLmpwMDw";
        }

        return (p1(input), p2(input));
	}
}