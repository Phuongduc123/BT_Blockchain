//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract Airdrop {
    IERC20 tokenAirdrop;
    constructor(address _tokenAirdrop) {
      tokenAirdrop = IERC20(_tokenAirdrop);
    }
    function triggerAirdrop(address[] calldata _to, uint256[] calldata _value) public {
      require(_to.length == _value.length, "Receivers and amounts aren't equal");
      for(uint256 i=0;i<_to.length;i++) {
        tokenAirdrop.transferFrom(msg.sender, _to[i], _value[i]);
      }
    }
}
