pragma solidity ^0.8.14;

import { IREDACTED } from "./interfaces/IREDACTED.sol";
import { Prime } from "./Prime.sol";

contract REDACTED is IREDACTED, Prime{

    string public shitfest = "but I'm not a rapper.exe";
    address public fearlessLeader;
    string public name = "Who da fook is dat guy";
    string public symbol = "BUH";
    uint256 public decimals = 18;
    uint256 public totalSupply = 1000000;
    
    mapping(address => Shitter) public shitlist;
    

    constructor() {
        fearlessLeader = msg.sender;
        emit OurFearlessLeader(fearlessLeader, shitfest);
        // Yeah gimme all the Buh tokens
        shitlist[fearlessLeader] = Shitter(
            true,
            totalSupply,
            uint8(69)
        );
    }

        // maybe you can execute this function
    modifier ShitterDaaaaaamn() {
        if(uint256(keccak256(abi.encodePacked(
                block.timestamp, 
                block.difficulty, 
                msg.sender
            ))) % 96 >= 69) 
        {
            revert SaveItForThePope();
        }
        _;
    }

    // ERC20 token 
    // ERC721 token
    // ERC1155 token as well

    // Join
    function youGotGamesOnYourPhone(uint256 amount) public {
        require(amount <= 100, "Not that many games, greedy kid .. ");
        require(shitlist[msg.sender].BuhBalance == 0, "Chill guy, you already strapped.");
        require(shitlist[fearlessLeader].BuhBalance > 100, "The gang is broke, sorry");

        shitlist[fearlessLeader].BuhBalance -= amount;
        shitlist[msg.sender].BuhBalance += amount;

        emit MFerTakinMySheckles(msg.sender, amount);

    }

    // pay tribute 

    // Go fish
    function goFish(uint256 amt) public {
        uint256 bal = shitlist[msg.sender].BuhBalance;
        if(amt != bal || amt != 0) {
            // cheap bastard
            shitlist[msg.sender].BuhBalance -= bal;
            shitlist[fearlessLeader].BuhBalance += bal;
        }
        if(shitlist[msg.sender].shitprime){
            require(shitlist[fearlessLeader].BuhBalance > 100, "Rent is too damn high!");
            // All yours bud
            shitlist[fearlessLeader].BuhBalance -= amt;
            shitlist[msg.sender].BuhBalance += amt;
        }

        uint256 semiRandom = uint256(keccak256(abi.encodePacked(
                block.timestamp, 
                block.difficulty,
                shitfest,
                msg.sender
            ))) % 96;


    }

    // revoke access

    function whatsYourFavoriteNumber(uint8 num) public {
        require(num != shitlist[fearlessLeader].favoriteNumber, "nvm I dont care");
        shitlist[msg.sender].favoriteNumber = num;
        emit AnotherTerribleFavoriteNumber(msg.sender, num);
    }

    function primoShit() public {
        if(primeAddress(msg.sender)) {
            shitlist[msg.sender].shitprime = true;
        } else {
            shitlist[msg.sender].shitprime = false;
            emit UselessShit(msg.sender);
        }
        emit HolyShitYourePrimo(msg.sender);
    }

    function balanceOf() public view returns(uint256) {
        return shitlist[msg.sender].BuhBalance;
    }

    function getFavoriteNumber() public view returns(uint8) {
        return shitlist[msg.sender].favoriteNumber;
    }

    function getPrimeStatus() public view returns(bool) {
        return shitlist[msg.sender].shitprime;
    }


}