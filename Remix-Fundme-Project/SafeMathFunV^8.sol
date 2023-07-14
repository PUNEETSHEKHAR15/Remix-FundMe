//SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;

contract SafeMathNew {
    uint8 public bignumber = 255;

    function Add() public {
        unchecked {
            bignumber += 1;
        }
    }
}
