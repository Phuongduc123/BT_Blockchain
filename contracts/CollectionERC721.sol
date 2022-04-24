//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract CollectionERC721 is ERC721URIStorage {
  using Counters for Counters.Counter;
  Counters.Counter private _tokenIds;
  address owner;
  mapping(address => bool) _adminMapping;
  mapping(address => bool) _blackMapping;

  constructor(string memory _name, string memory _symbol) ERC721(_name, _symbol) {
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

  function mint(string memory _tokenURI, address _address) public returns (uint256) {
    require(_adminMapping[msg.sender] == true && _blackMapping[msg.sender] != true, "you don't have permission to mint");
    _tokenIds.increment();
    uint256 newItemId = _tokenIds.current();
    _mint(_address, newItemId);
    _setTokenURI(newItemId, _tokenURI);

    return newItemId;
  }
}
