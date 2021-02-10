pragma solidity ^0.8.1;

import "./Ownable.sol";

contract GameRegistry is Ownable{

	address[] public gameAddresses;

    /**
     * Inserts a new game into the registry.
     */
    function insert(address newGame) public onlyOwner {
    	gameAddresses.push(newGame);
    }

    function getGameAdresses() public view returns (address[]){
    	return gameAddresses;
    }


}