//SPDX-License-Identifier:MIT
pragma solidity ^0.8.8;

contract ExternalPAYFunction {
    uint public result;

    ///Executes when msg.data is not empty and Receive() is not present
    fallback() external payable {
        result = 1;
    }

    //Executes when msg.data is empty and money is sentto contract without using function
    receive() external payable {
        result = 2;
    }
}
