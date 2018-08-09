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

    require(block.number > startBlock + 20); // wait approximately 5 min
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
