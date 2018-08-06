
pragma solidity ^0.4.23;

import "./Game.sol";


contract MakerDAO {
  function peek() external view returns(bytes32, bool);
  function read() external view returns(bytes32);
}

contract Darecoin is Game {

  enum gamePlay {DOWN, UP} // DOWN = 0, UP = 1

  bytes32 private startPrice;
  uint startBlock;
  MakerDAO makerDAO = MakerDAO(0xE39451e34f8FB108a8F6d4cA6C68dd38f37d26E3); // rinkeby

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

  function commit(bytes32 hashedCommit) public payable whenNotPaused {

    // if the first player is playing
    if (state.currNumberCommits == 0) {
        startPrice = makerDAO.read();
        startBlock = block.number;
    }
    super.commit(hashedCommit);
  }

  function checkGuess(string guess) private {
    uint guessAsInt = stringToUint(guess);
    require(guessAsInt == uint(gamePlay.DOWN) || guessAsInt == uint(gamePlay.UP));
  }

  function findWinners() private {

    address[] memory winners = new address[](config.MAX_PLAYERS);

    bytes32 newPrice = makerDAO.read();

    if(block.number > startBlock + 240) // wait approximately one hour

        uint rightResult = newPrice > startPrice ? uint(gamePlay.UP) : uint(gamePlay.DOWN);

        for(uint256 i = 0; i < state.currNumberReveals; i++){
          uint numWinners = 0;
          uint256 playForPlayer = stringToUint(gameData[gameDataKeys[i]]);

          if(playForPlayer == rightResult){
            winners[numWinners] = gameDataKeys[i];
            numWinners++;
          }
        }

        uint256 prize = address(this).balance.div(numWinners);
        performPayout(winners, numWinners, prize);

    }
}


























































































/* pragma solidity ^0.4.24;

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




//contract ends there */
