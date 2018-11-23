pragma solidity ^0.4.24;

contract Splitter {
   //declare variables
   address Alice;
   address Bob;
   address Carol;
   uint balance;
   uint halfBalance;
   uint remainderBalance;
   uint gas;

  constructor(address _Bob, address _Carol) public payable {
    //set the owner
    Alice = msg.sender;
    //set Bob and Carol (established at time of deployment--would be nice if there was a mechanism to update them)
    Bob = _Bob;
    Carol = _Carol;
  }


  //accept amounts from Alice and split them between Bob and Carol (but Carol gets slightly less if msg.value is not event)
  function splitBalance() public payable  {
   gas = gasleft();
   balance = msg.value - gas;
   halfBalance = balance/2;
   remainderBalance = balance - halfBalance;
   if (msg.sender == Alice) {
     Bob.transfer(halfBalance);
     Carol.transfer(remainderBalance);
   } else {
    revert();
   }
  }
}