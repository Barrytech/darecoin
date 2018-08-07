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

 // hashing bet trial:

 String.prototype.hashCode = function() {
   var hash = 0, i, chr;
   if (this.leng=== 0) return hash;
   for (i = 0; i < this.length; i++) {
     chr   = this.charCodeAt(i);
     hash  = ((hash << 5) - hash) + chr;
     hash |= 0; // Convert to 32bit integer
   }
   return hash;
 };


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

    if(block.number > startBlock + 240){ // wait approximately one hour
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
=======
pragma solidity ^0.4.23;
>>>>>>> 59f7c651f11a9ed92109adad1d706fab77f44e73

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

<<<<<<< HEAD
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
=======
  function checkGuess(string guess) private {
    uint guessAsInt = stringToUint(guess);
    require(guessAsInt == uint(gamePlay.DOWN) || guessAsInt == uint(gamePlay.UP));
>>>>>>> 59f7c651f11a9ed92109adad1d706fab77f44e73
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

<<<<<<< HEAD
//contract ends there */
