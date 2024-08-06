// // SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DegenToken is ERC20, Ownable {
    // Mapping to track player's redeemed items
    mapping(address => mapping(uint8 => uint256)) public playerItems;
    
    constructor() ERC20("Degen Gaming Token", "DGT") Ownable(msg.sender) {}
    
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
    
    function redeemTokens(uint8 num) external {
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
        
        // Burn the tokens
        _burn(msg.sender, cost);
        
        // Deliver the item by incrementing the player's item count
        playerItems[msg.sender][num]++;
        
        // Emit an event for off-chain tracking of redemptions
        emit TokensRedeemed(msg.sender, num, cost, item, string(abi.encodePacked(successMsg, " ", item)));
    }
    

    function getPlayerItems(address player, uint8 itemNumber) external view returns (string memory, uint256) {
        require(itemNumber >= 1 && itemNumber <= 4, "Invalid item number");
        string memory itemName;
        if (itemNumber == 1) {
            itemName = "Gaming tokens NFT";
        } else if (itemNumber == 2) {
            itemName = "Alpha";
        } else if (itemNumber == 3) {
            itemName = "Gamma";
        } else if (itemNumber == 4) {
            itemName = "Beta";
        }
        return (itemName, playerItems[player][itemNumber]);
    }

  
    function getRedeemedTokens(address wallet) external view returns (string memory) {
        string memory redeemedTokens = "";
        string[4] memory itemNames = ["Gaming tokens NFT", "Alpha", "Gamma", "Beta"];
        
        for (uint8 i = 1; i <= 4; i++) {
            if (playerItems[wallet][i] > 0) {
                if (bytes(redeemedTokens).length > 0) {
                    redeemedTokens = string(abi.encodePacked(redeemedTokens, ", "));
                }
                redeemedTokens = string(abi.encodePacked(redeemedTokens, itemNames[i-1]));
            }
        }
        
        return redeemedTokens;
    }
}
