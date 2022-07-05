// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.7;

import "forge-std/Script.sol";
import "../src/Contract.sol";

contract DeployContract is Script {
    function run() external {

        vm.startBroadcast();

        Contract c = new Contract();
        c.setMessage("Hello World");

        vm.stopBroadcast();
    }
}
