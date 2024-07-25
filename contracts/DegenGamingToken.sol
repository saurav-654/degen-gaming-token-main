// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DegenToken is ERC20, Ownable {
    constructor() ERC20("Degen Gaming Token", "DGT") Ownable(msg.sender) {
        
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function burnTokens(uint256 amount) public {
        require(balanceOf(msg.sender) >= amount, "Insufficient balance to burn");
        _burn(msg.sender, amount);
    }

    function transferTokens(address to, uint256 amount) public returns (bool) {
        require(to != address(0), "Invalid recipient address");
        require(balanceOf(msg.sender) >= amount, "Insufficient balance to transfer");
        _transfer(msg.sender, to, amount);
        return true;
    }

    function decimals() public pure override returns (uint8) {
        return 0;
    }

    function getBalance() external view returns (uint256) {
        return balanceOf(msg.sender);
    }

    string public constant STORE_ITEMS = "The following items are available to be redeemed for tokens: 1. Gaming tokens NFT (100 DGT) 2. Alpha (200 DGT) 3. Gamma (300 DGT) 4. Beta (400 DGT)";

    
     event TokensRedeemed(address indexed user, uint8 itemNumber, uint256 cost, string item, string message);
     function redeemTokens(uint8 num) external  {
        uint256 cost;
        string memory item;
        string memory successMsg = "You have successfully redeemed";

        if (num == 1) {
            cost = 100;
            item = "Gaming tokens NFT";
        } else if (num == 2) {
            cost = 200;
            item = "Alpha";
        } else if (num == 3) {
            cost = 300;
            item = "Gamma";
        } else if (num == 4) {
            cost = 400;
            item = "Beta";
        } else {
            revert("Invalid item number");
        }

        require(balanceOf(msg.sender) >= cost, "Insufficient Degen Tokens");
        _burn(msg.sender, cost);
        
        // Emit an event for off-chain tracking of redemptions
        emit TokensRedeemed(msg.sender, num, cost, item, string(abi.encodePacked(successMsg, " ", item)));
    }

    
    
}
