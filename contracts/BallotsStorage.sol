
pragma solidity ^0.4.18;

import '../../contracts/BallotsStorage.sol';

contract SensusBallotsStorageMock is BallotsStorage {
  function SensusBallotsStorage(address _proxyStorage) BallotsStorage(_proxyStorage) {
  }
