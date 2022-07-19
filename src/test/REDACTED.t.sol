pragma solidity ^0.8.14;

import "ds-test/test.sol";
import "../REDACTED.sol";
import {CheatCodes} from "./utils/CheatCodes.sol";
import {IREDACTED} from "../interfaces/IREDACTED.sol";

contract ShitFestTest is DSTest, IREDACTED {
    REDACTED public shit;
    CheatCodes cheats = CheatCodes(HEVM_ADDRESS);
    address public fearlessLeader = address(0xdead);

    function setUp() public {
        fearlessLeader = msg.sender;
        cheats.prank(fearlessLeader);

        cheats.expectEmit(true, true, true, true);
        emit OurFearlessLeader(fearlessLeader, "but I'm not a rapper.exe");
        shit = new REDACTED();
    }

    function testOwner() public {
        address l = shit.fearlessLeader();
        assertEq(l, fearlessLeader);
    }

    function testInitOwner() public {
        cheats.startPrank(fearlessLeader);
        assertEq(shit.balanceOf(), shit.totalSupply());
        assertEq(shit.getFavoriteNumber(), uint8(69));
        assertTrue(shit.getPrimeStatus());
        cheats.stopPrank();
    }

    function testGames() public {
        uint256 amt = 12;
        cheats.startPrank(address(0x69));
        cheats.expectEmit(true, true, true, true);
        emit MFerTakinMySheckles(address(0x69), 12);
        shit.youGotGamesOnYourPhone(amt);
        assertEq(shit.balanceOf(), amt);
        cheats.stopPrank();

        cheats.prank(fearlessLeader);
        assertEq(shit.balanceOf(), shit.totalSupply() - amt);
    }

    function testFailGames() public {
        uint256 amt = 100;
        cheats.startPrank(address(0x69));
        cheats.expectRevert(bytes("Chill guy, you already strapped."));
        shit.youGotGamesOnYourPhone(amt);

        cheats.expectRevert(bytes("Not that many games, greedy kid .. "));
        shit.youGotGamesOnYourPhone(amt + 100);
        cheats.stopPrank();
    }

    function testPrime() public {
        assertTrue(shit.isPrime(2));
        assertTrue(shit.isPrime(3));
        assertTrue(shit.isPrime(7));
        assertTrue(shit.isPrime(11));
        assertTrue(shit.isPrime(547));

        // Assert these are false, using !
        assertTrue(!shit.isPrime(4));
        assertTrue(!shit.isPrime(6));
        assertTrue(!shit.isPrime(111));
        assertTrue(!shit.isPrime(200));
    }

    function testPrimeWallets() public {
        cheats.prank(address(0x02));
        cheats.expectEmit(true, true, true, true);
        emit HolyShitYourePrimo(address(0x02));
        shit.primoShit();

        cheats.prank(address(0x011));
        cheats.expectEmit(true, true, true, true);
        emit HolyShitYourePrimo(address(0x011));
        shit.primoShit();

        cheats.prank(address(0x017));
        cheats.expectEmit(true, true, true, true);
        emit HolyShitYourePrimo(address(0x017));
        shit.primoShit();
    }
}
