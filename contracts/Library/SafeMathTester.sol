// SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;

// library SafeMathTester {

// }

contract SafeMathTester {
    uint8 public bigNumber = 255; //checked version lower than version 7

    function add()public{
        bigNumber = bigNumber + 1;
        // unchecked{bigNumber = bigNumber + 1;}
    }
}