// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";

contract YunusStablecoin is ERC20 {
  constructor() ERC20("YunusStableCoin", "TJCoin") {}

  function getStablecoin() public payable {
    _mint(msg.sender, msg.value);
  }

  function exchangeForEther(uint256 _amount) public {
    _burn(msg.sender, _amount);
    (bool success,) = payable(msg.sender).call{value: _amount}("");
    require(success);
  } 
}
