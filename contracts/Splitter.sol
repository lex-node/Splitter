pragma solidity ^0.4.24;

contract Splitter {
   //declare variables
   address alice;
   address bob;
   address carol;

  constructor(address _bob, address _carol) public payable {
    //set the owner
    alice = msg.sender;
    //set Bob and Carol (established at time of deployment--would be nice if there was a mechanism to update them)
    bob = _bob;
    carol = _carol;
    require(_bob != address(0));
    require(_carol !=address(0));
  }


  //accept amounts from Alice and split them between Bob and Carol
  function splitValue() public payable  {
   require((msg.value > 0) && (msg.sender == alice));
   uint halfMsgValue = msg.value/2;
   bob.transfer(halfMsgValue);
   carol.transfer(halfMsgValue);
  }
}
