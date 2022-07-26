pragma solidity ^0.8.14;

contract A {

    string public a_s = "A Okay";
    address public aAddr;

    constructor() {
        aAddr = address(this);
        
    }

}


contract B is A{

    uint256 public what = 1;

    constructor() {

    }

    receive() external payable {
        what++;
    }

}