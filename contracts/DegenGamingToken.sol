// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "hardhat/console.sol";

contract DegenToken is ERC20, Ownable {
    constructor(address initialOwner) ERC20("Degen Gaming Token", "DGT") Ownable(initialOwner) {}

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function burnTokens(uint256 amount) public {
        _burn(msg.sender, amount);
    }

    function decimals() public pure override returns (uint8) {
        return 0;
    }

    function getBalance() external view returns (uint256) {
        return balanceOf(msg.sender);
    }

    string public constant STORE_ITEMS = "The following items are available to be redeemed for tokens: 1. Gaming tokens NFT (100 DGT) 2. Alpha (200 DGT) 3. Beta (300 DGT) 4. Gama (400 DGT)";

    function redeemTokens(uint8 num) external returns (string memory) {
        uint256 cost;
        string memory item;

        if (num == 1) {
            cost = 100;
            item = "Gaming tokens NFT";
        } else if (num == 2) {
            cost = 200;
            item = "Alpha";
        } else if (num == 3) {
            cost = 300;
            item = "Beta";
        } else if (num == 4) {
            cost = 400;
            item = "Gama";
        } else {
            revert("Invalid item number");
        }

        uint256 callerBalance = balanceOf(msg.sender);

        if (callerBalance < cost) {
            uint256 neededTokens = cost - callerBalance;
            // Optionally mint tokens to the caller if the caller is the owner
            if (msg.sender == owner()) {
                mint(msg.sender, neededTokens);
            } else {
                revert("Insufficient Degen Tokens and not the owner to mint");
            }
        }

        require(balanceOf(msg.sender) >= cost, "Insufficient Degen Tokens");
        _transfer(msg.sender, owner(), cost);
        return string(abi.encodePacked("You are now the proud owner of ", item, "!"));
    }
}
