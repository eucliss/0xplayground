pragma solidity ^0.8.14;

import {Proxy} from "@oz/proxy/Proxy.sol";
import {Storage} from "./Storage.sol";

contract DumbProxy is Proxy {
    uint256 public value;

    Storage public s;
    address public implementation;

    constructor() {
        s = new Storage();
        implementation = address(s);
    }

    function changeImplementation(address newImplementation) public {
        implementation = newImplementation;
    }

    function _implementation() internal view override returns (address) {
        return implementation;
    }
}
