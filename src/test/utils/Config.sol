// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;
import "ds-test/test.sol";

contract Configs is DSTest{

  address constant public DEPLOYER = 0xb4c79daB8f259C7Aee6E5b2Aa729821864227e84;
  address public player1 = address(1);
  address public player2 = address(2);
 

    uint public oneEth = 1 ether;
    uint public oneFiveEth = 1.5 ether;
    uint public twoEth = 2 ether;
    uint public oneGwei = 1 gwei;


  function etherUnits() public pure {
    assert(1 wei == 1);
    assert(1 gwei == 1e9);
    assert(1 ether == 1e18);

    assert(1 == 1 seconds);
    assert(1 minutes == 60 seconds);
    assert(1 hours == 60 minutes);
    assert(1 days == 24 hours);
    assert(1 weeks == 7 days);
  }

}