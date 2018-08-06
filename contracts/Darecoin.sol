pragma solidity ^0.4.24;

import "./Game.sol";

contract Darecoin is Game {

  enum playState { Up, Dowm  } // DOWN = 0, UP = 1

  address makerDAO = 0x0;
  address player1Address = 0x00;  //TBD
  address player2Address = 0x00;  //TBD

  playState User1;
  playState User2;

  uint cost = 10000000000000;


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



function reward(address winner) private{
        winner.transfer(cost*2);
}



function NoWinner(address user1, address user2) private {
        player1Address.transfer(cost);
        player2Address.transfer(cost);
}


 // inspired from solidity sample, testing logic:


    function setPlayers() private {
        if(player1Address == 0x0) {
            player1Address = msg.sender;
        } else {
            player2Address = msg.sender;
        }
    }




 function playPriceUp() public {
      require(msg.value >= cost);
      setPlayers();
      if(msg.sender == player1Address){
          player1 = playState.Up;
      }
      if(msg.sender == player2Address){
          player2 = playState.Up;
      }
  }

  function
  () public {
      require(msg.value >= cost);
      setPlayers();
      if(msg.sender == player1Address){
          player1 = playState.Down;
      }
      if(msg.sender == player2Address){
          player2 = playState.Down;
      }
  }

  function determineGameAndReward() public {
       if(player1 == playState.Up && player2 == playState.Down){
           reward(player1Address);
       }
       if(player1 == playState.Down && player2 == playState.Up){
           reward(player2Address);
       }
       if(player1 == playState.Up && player2 == playState.Up){
           NoWinner(player1Address, player2Address);
       }


  // logic test ends here





}













/*
function checkGuess(string guess) private {
        uint guessAsInt = stringToUint(guess);
        require(guessAsInt == 0 || guessAsInt == 1);
        require(msg.value == cost);
      if ( User1Guess.guessAsInt == 0){
          OnUser1Wins();
      }else if( User2Guess.guessAsInt == 0){
          OnUser2Wins();
      }else{

      }
}



function findWinners() private {

   //uint256 price = makerDAO.peek(...);
      checkGuess();
 }



function OnUser1Wins(){
      reward(user1Address);
}

function OnUser2Wins(){
      reward(user1Address);
}
 */




//contract ends there
