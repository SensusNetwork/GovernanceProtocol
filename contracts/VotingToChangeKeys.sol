pragma solidity ^0.4.18;

import '../../contracts/VotingToChangeKeys.sol';
import '../../contracts/KeysManager.sol';
import '../../contracts/BallotsStorage.sol';

contract VotingToChangeKeysMock is VotingToChangeKeys {
  uint256 public time;
  function VotingToChangeKeysMock(address _proxyStorage)
    VotingToChangeKeys(_proxyStorage)
  {
  
}

  function setTime(uint256 _newTime) public {
    time = _newTime;
  }

  function getTime() public view returns(uint256) {
    if(time == 0) {
      return now;
    } else {
      return time;
    }
  }
}
