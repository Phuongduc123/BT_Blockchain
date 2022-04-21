//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract CollectionERC721 is ERC721URIStorage {
  using Counters for Counters.Counter;
  Counters.Counter private _tokenIds;

  constructor(string memory name, string memory symbol) ERC721(name, symbol) {}

  function mint(string memory _tokenURI, address _address) public returns (uint256) {
    _tokenIds.increment();

    uint256 newItemId = _tokenIds.current();
    _mint(_address, newItemId);
    _setTokenURI(newItemId, _tokenURI);

    return newItemId;
  }
}
