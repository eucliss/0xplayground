pragma solidity ^0.8.0;

import "ds-test/test.sol";
import "../Inheritance.sol";
import {CheatCodes} from "./utils/CheatCodes.sol";

contract InheritanceTest is DSTest {
    B public b;
    CheatCodes cheats = CheatCodes(HEVM_ADDRESS);

    function setUp() public {
        b = new B();
    }

    function testMessageAvailable() public {
        assertEq(b.what(), 1);
        assertEq(b.a_s(), "A Okay");
    }

    function testPay() public {
        address testAddr = address(0x1111);
        address bAddr = address(b);
        cheats.deal(testAddr, 10 ether);

        cheats.prank(testAddr);
        payable(bAddr).call{value: 1 ether}("");
        assertEq(address(bAddr).balance, 1 ether);
        assertEq(address(b.aAddr()).balance, 1 ether);

        cheats.prank(b.aAddr());
        payable(testAddr).call{value: 1 ether}("");
        assertEq(address(testAddr).balance, 10 ether);
        assertEq(address(bAddr).balance, 0 ether);
    }
}
