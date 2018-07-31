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

   //uint256 price = makerDAO.peek(...);
player1
 }
}
 //here start the contract to mise your ether
 contract EtherBet{
   address player;
   uint NumberofPlayers;
   uint constant betval = 10^(-5);

   mapping (address => uint) public players;
   function BetEther(){
     player = msg.sender;
     NumberofPlayers = 2;
   }

   function Paybet(uint amount) payable  {
     if (msg.value != 10^-5){
     throw;
   }


     NumberofPlayers = amount;

    if (NumberofPlayers != 2 ){
      selfdestruct(player);
    }
   }
 }

 //here start the contract to payWinner
contract EtherTansferTo {
  function() public payable {

  }

function getBalance  (uint){
  return address.this.balance;
}
}

contract EtherTransferFrom {
  EdtherTransferTo private _instance;

 function ETherTransferFrom() public {
   _instance = new EtherTransferTo();
   //_instance = EtherTransferTo(addresss.(this));
 }
 function getBalance() public rturns (uint){
   return address.this.balance;
 }
 function getBalance () public {
   return address_instance.balance;
 }
}


//























/*
contract DareCoin is Game{

  function OnWin(){
 sendeth


  }


  function OnLose(){
  throw;
  }


  function CheckIfWon(){

  }


  function CheckIfLost(){


  }


  function OnCorrectBet(){
  if(CheckIfWon() == true){
  OnWin();
}

  }


  function OnWrongBet(){


  if(CheckIfLost == true){
  OnLose();
}

  }


  function JudgeGuess(){
  if (userbet == price){
  OnCorrectBet();
  } else if(userbet != price){
  OnWrongBet();
}


  }


  function OnSelectBet(){
  JudgeGuess();

  }

  function CountPlayers(){


  }
  }
 */
