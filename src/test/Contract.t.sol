pragma solidity ^0.8.0;

import "ds-test/test.sol";
import "../Contract.sol";
import {CheatCodes} from "./utils/CheatCodes.sol";

contract ContractTest is DSTest {
    Contract public c; 
    CheatCodes cheats = CheatCodes(HEVM_ADDRESS);


    function setUp() public {
        c = new Contract();
    }

    function testCanSetMessage() public {
        c.setMessage("testing message");
        assertEq(c.message(), "testing message");
    }

    function testFailNonOwnerSet() public {
        cheats.prank(address(0));
        c.setMessage("testing message");
        assertEq(c.message(), "testing message");
    }

}