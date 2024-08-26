// SPDX-License-Identifier: MIT
pragma solidity >=0.6.12 <0.9.0;

contract Carbon {
  struct Memo {
    string name;
    string message;
    uint timestamp;
    address from ;
  }
  Memo[] memos;
  // person who will receive money
  address payable owner;

  // smart contract deployer will become owner of this application
  // the person who is deploying the contract is the one asking for payment
  constructor(){
    owner = payable(msg.sender) ;
  }

  function buyCredits(string memory name, string memory message) public payable {
    require(msg.value>0,"Please pay greater than 0 ether");
    owner.transfer(msg.value);
    memos.push(Memo(name,message,block.timestamp,msg.sender));
    

  }

function getMemo() public view returns (Memo[] memory) {
    return memos;
}





}



