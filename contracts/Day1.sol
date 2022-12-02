// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;


import "./strings.sol";


contract Day1 {                                                            
    using strings for *;          

    function st2num(string memory numString) public pure returns(uint256) {
        uint256 val=0;
        bytes memory stringBytes = bytes(numString);
        for (uint  i =  0; i<stringBytes.length; i++) {
            uint256 exp = stringBytes.length - i;
            bytes1 ival = stringBytes[i];
            uint8 uval = uint8(ival);
            uint256 jval = uval - uint(0x30);
   
            val +=  (uint(jval) * (10**(exp-1))); 
        }
        return val;
    }

    function smt(string memory in_str) public pure returns (uint256[] memory) {                                               
        strings.slice memory s = in_str.toSlice();                
        strings.slice memory delim = "\n".toSlice();                            
        uint256[] memory parts = new uint256[](s.count(delim)+1);                  
        for (uint i = 0; i < parts.length; i++) {                              
           parts[i] = st2num(s.split(delim).toString());                               
        }
        return parts;                                                                  
    }

    function first_split(string memory in_str) public pure returns (string[] memory) {                                               
        strings.slice memory s = in_str.toSlice();                
        strings.slice memory delim = "\n\n".toSlice();                            
        string[] memory parts = new string[](s.count(delim)+1);                  
        for (uint i = 0; i < parts.length; i++) {                              
           parts[i] = s.split(delim).toString();                               
        }
        return parts;                                                                  
    }

    function sum(uint256[] memory num_group) public pure returns (uint256) {
        uint256 total_calories = 0;
        for (uint256 i = 0; i < num_group.length; i++) {
            total_calories += num_group[i];
        }
        return total_calories;
    }

    function p1(string memory input) private pure returns (uint256) {
        uint256 highest_cals=0;
        uint256 cals;

        if (bytes(input).length == 0) {
            input = "1000\n2000\n3000\n\n4000\n\n5000\n6000\n\n7000\n8000\n9000\n\n10000\n";
        }
        string[] memory array = first_split(input);

        for (uint i = 0; i < array.length; i++) { 
            cals = sum(smt(array[i]));
            if (cals > highest_cals) {
                highest_cals = cals;
            }                      
        }
        return highest_cals;
    }

    function p2(string memory input) private pure returns (uint256) {
        uint256 highest_cals=0;
        uint256 second_highest_cals=0;
        uint256 third_highest_cals=0;
        uint256 cals;

        if (bytes(input).length == 0) {
            input = "1000\n2000\n3000\n\n4000\n\n5000\n6000\n\n7000\n8000\n9000\n\n10000\n";
        }
        string[] memory array = first_split(input);

        for (uint i = 0; i < array.length; i++) { 
            cals = sum(smt(array[i]));
            if (cals > highest_cals) {
                third_highest_cals = second_highest_cals;
                second_highest_cals = highest_cals;
                highest_cals = cals;
            } else if (cals > second_highest_cals) {
                third_highest_cals = second_highest_cals;
                second_highest_cals = cals;
            } else if (cals > third_highest_cals)  {
                third_highest_cals = cals;
            }              
        }
        return highest_cals+second_highest_cals+third_highest_cals;
    }

    function main(string memory input) external pure returns (uint256, uint256) {
        return (p1(input), p2(input));
    }                                                   
}  