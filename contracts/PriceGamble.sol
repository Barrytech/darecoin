git pragma solidity ^0.4.24;

contract PriceGamble{

  address owner;
  uint round;
  uint constant price = 1 ether;
mapping (address => uint) public players;


 //constructor
 function Constructor(){
owner = msg.sender;




 }

 /* fallback function
 allow users to money from wallet to the address directly
 */

function () payable{
BetEther(1);




}



function BetEther (uint amount) payable {


  if (msg.value != price  || players != 2){
    throw;
  }
  players[msg.sender] += players;
  players -= players;

  if (players  == 0){
    selfdestruct(owner);
  }

}
}
