// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DegenToken is ERC20, Ownable{
    constructor() ERC20("Degen Gaming Token", "DGT") {}
    address ownerOfContract = msg.sender;

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function burnTokens(uint amount) public {
        _burn(msg.sender, amount);
    }

    function decimals() override public pure returns (uint8) {
        return 0;//100 tokens will be equal to 100 tokens only
    }

    function getBalance() external view returns (uint256) {
        return this.balanceOf(msg.sender);
    }

    string public storeItems = "The following items are available to be redeemed for tokens; 1 Official degen NFT(100 DGN) 2 The Hammer of Ragnarok(200 DGN) 3 The sword of god(300 DGN) 4 Dragon's breath(400 DGN)";

    function redeemTokens(uint8 num) external returns(string memory){
        if(num == 1){
            require(balanceOf(msg.sender) >= 100, "You do not have enough Degen Tokens");
            bool success = transfer(ownerOfContract, 100);
            if(success == true){
                return "You are now the proud owner of Official degen NFT!";
            }
        }
        else if(num == 2){
            require(balanceOf(msg.sender) >= 200, "You do not have enough Degen Tokens");
            bool success = transfer(ownerOfContract, 200);
            if(success == true){
                return "You are now the proud owner of The Hammer of Ragnarok!";
            }
        }
        else if(num == 3){
            require(balanceOf(msg.sender) >= 300, "You do not have enough Degen Tokens");
            bool success = transfer(ownerOfContract, 300);
            if(success == true){
                return "You are now the proud owner of The sword of god!";
            }
        }
        else if(num == 4){
            require(balanceOf(msg.sender) >= 400, "You do not have enough Degen Tokens");
            bool success = transfer(ownerOfContract, 400);
            if(success == true){
                return "You are now the proud owner of Dragon's breath!";
            }
        }
        
        return "Invalid input";
    }

    function transfer(address recipient, uint amount) override public returns(bool){
        require(balanceOf(msg.sender) >= amount, "You do not have enough Degen Tokens");
        _transfer(msg.sender, recipient, amount);
        emit Transfer(msg.sender, recipient, amount);
        return true;//function to this call was successful
    }
}

