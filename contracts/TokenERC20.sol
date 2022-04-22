//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyToken is ERC20 {
    constructor(string memory _name, string memory _symbol ) ERC20(_name, _symbol) {}

    function mint(uint256 _amount) public {
        _mint(_msgSender(), _amount);
    }

    function burn(uint256 amount) public virtual {
        _burn(_msgSender(), amount);
    }
}
