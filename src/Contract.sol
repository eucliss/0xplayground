pragma solidity ^0.8.0;

contract Contract {

    address public owner;
    string public message;

    constructor() {
        owner = msg.sender;
    }

    function setMessage(string memory newMessage) public {
        require(msg.sender == owner, "Not the owner guyo");
        message = newMessage;
    }

}