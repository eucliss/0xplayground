pragma solidity ^0.8.14;

import "ds-test/test.sol";
import "@std/console.sol";
import "../proxy/DumbProxy.sol";
import "../proxy/Storage.sol";
import "../proxy/StorageV2.sol";
import {CheatCodes} from "./utils/CheatCodes.sol";

contract ProxyTest is DSTest {
    DumbProxy public dumb;
    CheatCodes cheats = CheatCodes(HEVM_ADDRESS);
    address public owner;

    function setUp() public {
        owner = msg.sender;
        dumb = new DumbProxy();
    }

    function testStorage() public {
        bytes memory payload = abi.encodeWithSignature(
            "addValue(uint256)",
            uint256(100)
        );
        (bool success, ) = address(dumb).call(payload);
        assertTrue(success);
        bytes memory valuePayload = abi.encodeWithSignature("value()");
        // require(success, "Transaction call using encodeWithSignature is successful");
        bytes memory value;
        (success, value) = address(dumb.implementation()).call(valuePayload);
        assertTrue(success);

        // Storage contract has 0 as value, proxy has 100
        assertEq(bytes32(value), 0x0);
        assertEq(dumb.value(), 100);
    }

    function testStorageSingle() public {
        bytes memory payload = abi.encodeWithSignature("singleValue()");
        (bool success, ) = address(dumb).call(payload);
        assertTrue(success);
        assertEq(dumb.value(), 1);
    }

    function testStorageV2() public {
        // Set proxy value to 100
        bytes memory payload = abi.encodeWithSignature(
            "addValue(uint256)",
            uint256(100)
        );
        (bool success, ) = address(dumb).call(payload);
        assertTrue(success);
        assertEq(dumb.value(), 100);

        StorageV2 stor = new StorageV2();
        assertEq(stor.value(), 0);
        dumb.changeImplementation(address(stor));
        assertEq(dumb.implementation(), address(stor));

        bytes memory valuePayload = abi.encodeWithSignature(
            "newAddValue(uint256)",
            uint256(10)
        );
        bytes memory value;
        (success, value) = address(dumb).call(valuePayload);
        assertTrue(success);
        assertEq(bytes32(value), 0x0);

        assertEq(dumb.value(), 110);
    }
}
