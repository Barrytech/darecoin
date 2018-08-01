pragma solidity ^0.4.23;

import "./Game.sol";

contract Darecoin is Game {

  enum gamePlay {DOWN, UP} // DOWN = 0, UP = 1

  address makerDAO = 0x0;

  constructor(
        address _feeAddress,
        uint256 _gameFeePercent,
        uint256 _stakeSize,
        uint256 _maxp,
        uint256 _gameStageLength,
        address _nptAddress,
        address _makerDAOAddress // <-- the address to our makerDAO contract
        )
          public Game(_feeAddress, _gameFeePercent, _stakeSize, _maxp, _gameStageLength, _nptAddress) {
    makerDAO = _makerDAOAddress;
  }

  function checkGuess(string guess) private {
    uint guessAsInt = stringToUint(guess);
    require(guessAsInt == 0 || guessAsInt == 1);
  }

  function findWinners() private {

    address[] memory winners = new address[](config.MAX_PLAYERS);

    uint rightResult = 1; // assume UP is the right answer

    for(uint256 i = 0; i < state.currNumberReveals; i++){
      uint numWinners = 0;
      uint256 playForPlayer = stringToUint(gameData[gameDataKeys[i]]);

      if(playForPlayer == rightResult){
        numWinners++;
        winners[numWinners] = gameDataKeys[i];
      }
    }

    uint256 prize = address(this).balance.div(numWinners);
    performPayout(winners, numWinners, prize);

  }
}

//here start the contract to mise your ether
contract EtherBet{
  address player;
  uint NumberofPlayers;
  uint constant betval = 10000000000000;

  mapping (address => uint) public players;
  
  function BetEther () public {
    player = msg.sender;
    NumberofPlayers = 2;
  }

  function Paybet(uint amount) public payable {
    require(msg.value == betval);

    NumberofPlayers = amount;

    if (NumberofPlayers != 2 ){
      selfdestruct(player);
    }
  }
}

