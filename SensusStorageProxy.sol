pragma solidity ^0.4.18;

import '../../contracts/Sensus-storage/SensusStorageProxy.sol';

contract SensusStorageProxyMock is SensusStorageProxy {

  function SensusStorageProxyMock(
    address _proxyStorage,
    address _implementationAddress
  ) SensusStorageProxy(
    _proxyStorage,
    _implementationAddress
  ) public {
  }

  function setProxyStorage(address _proxyStorage) public {
    addressStorage[keccak256("proxyStorage")] = _proxyStorage;
  }

}
