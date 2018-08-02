pragma solidity ^0.4.24;

import "./Game.sol";

contract Darecoin is Game {

  enum playState { Up, Dowm, Static} // DOWN = 0, UP = 1

  address makerDAO = 0x0;
  address user1Address;
  address user2Address ;


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


function SetUsers() private{

  user1Address =0x00;  //TBD
  user2Address = 0x00;  //TBD
}

 int User1Guess = user1Address.playState;
 int User2Guess = user2Address.playState;
 uint cost = 10000000000000;


function reward(address winner) private{
  winner.transfer(cost*2);
}

function NoWinner(address user1, address user2) private {
  user1Address.transfer(cost);
  user2Address.transfer(cost);
}


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





//contract ends there
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
