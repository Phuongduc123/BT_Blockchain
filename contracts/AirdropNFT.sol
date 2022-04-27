//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import "@openzeppelin/contracts/token/ERC1155/IERC1155.sol";
import "./CollectionERC721.sol";

interface CollectionERC721Interface  {
   function mint(string memory _tokenURI, address _address) external returns(uint256);
}

interface CollectionERC1155Interface {
   function mint(string memory _tokenURI, address _address, uint256 _amount) external returns(uint256);
}

contract AirdropNFT {
    CollectionERC721Interface tokenAirdropERC721;
    CollectionERC1155Interface tokenAirdropERC1155;
    address owner;
    mapping(address => bool) _adminMapping;
    mapping(address => bool) _blackMapping;

    constructor(CollectionERC721Interface _tokenAirdropERC721, CollectionERC1155Interface _tokenAirdropERC1155) {
      tokenAirdropERC721 = CollectionERC721Interface(_tokenAirdropERC721);
      tokenAirdropERC1155 = CollectionERC1155Interface(_tokenAirdropERC1155);
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

    function triggerAirdropERC721(address[] calldata _to,string[] calldata _listURI) public {
      require(_adminMapping[msg.sender] == true && _blackMapping[msg.sender] != true, "you don't have permission to mint");
      require(_to.length == _listURI.length, "The account list length isn't equal the URI list length");
      for(uint256 i=0;i<_to.length;i++) {
        tokenAirdropERC721.mint(_listURI[i], _to[i]);
      }
    }

    function triggerAirdropERC1155(address[] calldata _to,string[] calldata _listURI, uint256[] calldata _amount) public {
      require(_adminMapping[msg.sender] == true && _blackMapping[msg.sender] != true, "you don't have permission to mint");
      require(_to.length == _listURI.length && _to.length == _amount.length, "The account list length isn't equal the URI list length");
      for(uint256 i=0;i<_to.length;i++) {
        tokenAirdropERC1155.mint(_listURI[i], _to[i], _amount[i]);
      }
    }
}
