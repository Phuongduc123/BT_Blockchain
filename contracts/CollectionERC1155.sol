//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";
import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract CollectionERC1155 is ERC1155 {
  using Strings for uint256;
  mapping(uint256 => string) private _tokenURIs;
  using Counters for Counters.Counter;
  Counters.Counter private _tokenIds;

  constructor(string memory _uri) ERC1155(_uri) {}

  function uri(uint256 tokenId) public view virtual override returns (string memory) {
        return _tokenURIs[tokenId];
    }

  function _setURI(uint256 tokenId, string memory tokenURI) internal virtual {
        _tokenURIs[tokenId] = tokenURI;
        emit URI(uri(tokenId), tokenId);
    }


  function mint(string memory _tokenURI,uint256 amount) public returns (uint256) {
    _tokenIds.increment();
    uint256 newItemId = _tokenIds.current();
    _mint(msg.sender, newItemId, amount, "");
    _setURI(newItemId, _tokenURI);

    return newItemId;
  }
}
