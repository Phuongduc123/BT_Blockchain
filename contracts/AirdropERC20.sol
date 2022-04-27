//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract Airdrop {
    IERC20 tokenAirdrop;
    address owner;
    mapping(address => bool) _adminMapping;
    mapping(address => bool) _blackMapping;

    constructor(address _tokenAirdrop) {
      tokenAirdrop = IERC20(_tokenAirdrop);
      _adminMapping[msg.sender] = true;
      owner = msg.sender;
    }

    function setAdminList(address _admin) public {
      require(msg.sender == owner, "CollectionERC721: only owner can do it");
      _adminMapping[_admin] = true;
    }

    function setBlackList(address _blackAdmin) public {
      require(msg.sender == owner, "CollectionERC721: only owner can do it");
      _blackMapping[_blackAdmin] = true;
    }
    
    function triggerAirdrop(address[] calldata _to, uint256[] calldata _value) public {
      require(_adminMapping[msg.sender] == true && _blackMapping[msg.sender] != true, "you don't have permission to mint");
      require(_to.length == _value.length, "Receivers and amounts aren't equal");
      for(uint256 i=0;i<_to.length;i++) {
        tokenAirdrop.transferFrom(msg.sender, _to[i], _value[i]);
      }
    }
}
