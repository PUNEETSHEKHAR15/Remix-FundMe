//SPDX-License-Identifier:MIT
pragma solidity ^0.6.0;

contract SafeMath {
    uint8 public bignumber = 255;

    function Add() public {
        bignumber += 1;
    }
    // this contract having a version of 0.6.0
    //== holds bignumber value as 255 which is it maximum capacity of uint8;
    //== when ever someonne clicks to  ADD( ) function the value of bignumber resets to the lowest
    // value it can hold (0); but this feature was available in version 6
}
