// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "./SimpleStorage.sol";

contract ExtraStorage is SimpleStorage {
    //override
    /*virtual override overriding a function you need to specify override and the function you
     want to oveeride needs to have virtual keyword */
    function store(uint256 _favoriteNumber)public override{
        favoriteNumber = _favoriteNumber +5;
    }
}