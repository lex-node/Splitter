pragma solidity ^0.4.24;

contract Splitter {
   //declare variables
   address alice;
   address bob;
   address carol;
   mapping (address => uint) allocatedWithdrawals;
   uint unallocatedWithdrawals;

  constructor(address _bob, address _carol) public payable {
    //set the owner
    alice = msg.sender;
    //set Bob and Carol (established at time of deployment--would be nice if there was a mechanism to update them)
    bob = _bob;
    carol = _carol;
    require(_bob != address(0));
    require(_carol !=address(0));
  }


  //accept amounts from Alice and allocate the even parts of them to bob and carol, allocating the odd parts of them to a pool
    function splitValue() public payable {
       require((msg.value > 0) && (msg.sender == alice));
       unallocatedWithdrawals += msg.value - ((msg.value/2) * 2);
       uint halfShare;
       if(unallocatedWithdrawals % 2 == 0) {
       	halfShare = (msg.value/2) + (unallocatedWithdrawals/2);
       } else {
       	halfShare = msg.value/2; 
       }
       allocatedWithdrawals[bob] += halfShare;
       allocatedWithdrawals[carol] += halfShare;        
    }

//allow bob or carol to withdraw their current allocations
    function withdraw() public {
        uint amount = allocatedWithdrawals[msg.sender];
        allocatedWithdrawals[msg.sender] = 0;
        msg.sender.transfer(amount);
    }
}
