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

 }
}


// here start the contract to mise your ether
contract EtherBet {
   address player;
   uint NumberofPlayers;
   uint constant betval = 100000;

   mapping (address => uint) public players;
   function BetEther(){
     player = msg.sender;
     NumberofPlayers = 2;
   }

   function Paybet(uint amount) payable  {
     if (msg.value != 1000000){
       throw;
     }
     
     // player[msg.sender] = amount; // this doesn't make sense to me
     NumberofPlayers = amount; // neither does this, but it at least compiles
    
     if (NumberofPlayers != 2 ){
       selfdestruct(player);
     }
   }
}

// here start the contract to payWinner
contract EtherTransferTo {
  function() public payable {

  }

  function getBalance() public returns(uint){
    // return address.(this).balance; // it is unclear what you want this to do
    return 0;
  }
}

contract EtherTransferFrom {
  EtherTransferTo private _instance;

  function ETherTransferFrom() public {
    _instance = new EtherTransferTo();
    //_instance = EtherTransferTo(addresss.(this));
  }
 
  function getBalance() public returns (uint){
    return address(this).balance;
  }
 
  // you can't have functions with two identical names
  //function getBalance () public returns (uint){
  //  return address(_instance).balance;
  //}
}
