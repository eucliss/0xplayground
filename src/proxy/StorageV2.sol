pragma solidity ^0.8.14;

contract StorageV2 {
    uint256 public value;

    constructor() {
        value = 0;
    }

    function newAddValue(uint256 _add) public {
        value = value + _add;
    }
}
