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

enum playState { Up, Dowm, Static}
address user1Address = "TBD";
address user2Address = "TBD";

playState user1;
playState user2;

uint cost = 10000000000000;

function reward(address winner) private{
  winner.send(cost*2);
}

function NoWinner(address user1, address user2) private {
  user1.send(cost);
  user2.send(cost);
}




 function checkGuess(string guess) private {
   uint guessAsInt = stringToUint(guess);
   require(guessAsInt == 0 || guessAsInt == 1);
   require(msg.send == cost);
if (user1 == playState.Up){
  OnUser1Wins();
}else if(user2 == playState.Up){
  OnUser2Wins();
}else{
  NoWinner();
}
 }

 function findWinners() private {

   //uint256 price = makerDAO.peek(...);
   checkGuess();
 }



function OnUser1Wins(){
  reward(user1);
}
function OnUser2Wins(){
  reward(user2);
}








 //here start the contract to mise your ether
 /* contract EtherBet{
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
   } */

}
