pragma solidity ^0.8.14;

contract Storage {
    uint256 public value;

    constructor() {
        value = 0;
    }

    function addValue(uint256 v) public {
        value = v;
    }

    function singleValue() public {
        value = 1;
    }
}
