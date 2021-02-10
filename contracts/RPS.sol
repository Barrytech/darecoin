pragma solidity ^0.8.1;

import "./Game.sol";

contract RPS is Game {
    
  enum playState {ROCK, PAPER, SCISSOR} // ROCK = 0, PAPER = 1, SCISSOR = 2
    
  constructor(
        address _feeAddress,
        uint256 _gameFeePercent,
        uint256 _stakeSize,
        uint256 _maxp,
        uint256 _gameStageLength,
        address _nptAddress // 0x805cdcf68cc12220f89425be89daa44dbc83ff30
        )
        public Game(_feeAddress, _gameFeePercent, _stakeSize, _maxp, _gameStageLength, _nptAddress) {
  } 
  
  // function commit(bytes32 hashedCommit)
  // function reveal(string, string)
  
  function checkGuess(string guess) private {
    uint n = stringToUint(guess);
    require(n == uint(playState.ROCK) || n == uint(playState.PAPER) || n == uint(playState.SCISSOR));
  }
  
  function findWinners() private {
      
      address[] memory winners = new address[](config.MAX_PLAYERS);
      uint numWinners = 0;
      
      
      if(state.currNumberReveals == config.MAX_PLAYERS && config.MAX_PLAYERS == 2){
          
          uint play0 = stringToUint(gameData[gameDataKeys[0]]);
          uint play1 = stringToUint(gameData[gameDataKeys[1]]);
          
          if(play0 == play1){
              // we have a tie, regardless of what the individual players played
              winners[0] = gameDataKeys[0]; winners[1] = gameDataKeys[1];
              numWinners = 2;
          }
          
          if(play0 == uint(playState.ROCK) && play1 == uint(playState.PAPER)){
              winners[0] = gameDataKeys[1];
              numWinners = 1;
          }
          
          if(play0 == uint(playState.ROCK) && play1 == uint(playState.SCISSOR)){
              winners[0] = gameDataKeys[0];
              numWinners = 1;
          }
          
          if(play0 == uint(playState.PAPER) && play1 == uint(playState.ROCK)){
              winners[0] = gameDataKeys[0];
              numWinners = 1;
          }
          
          if(play0 == uint(playState.PAPER) && play1 == uint(playState.SCISSOR)){
              winners[0] = gameDataKeys[1];
              numWinners = 1;
          }
          
          if(play0 == uint(playState.SCISSOR) && play1 == uint(playState.ROCK)){
              winners[0] = gameDataKeys[1];
              numWinners = 1;
          }
          
          if(play0 == uint(playState.SCISSOR) && play1 == uint(playState.PAPER)){
              winners[0] = gameDataKeys[0];
              numWinners = 1;
          }
          
      }
      
      if(numWinners > 0){
        uint reward = address(this).balance.div(numWinners);
        performPayout(winners, numWinners, reward);
      }
      
  }
    
}