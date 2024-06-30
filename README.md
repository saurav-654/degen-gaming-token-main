# Degen Gaming Token

Solidity program creates  ERC20 tokens, which can be minted by contract owners. These tokens can be used for rewards, transfer, balance checking, and burning when not needed in the in-game store.

# Description

This program is a simple smart contract written in Solidity, a programming language used for Ethereum blockchain development. It imports the 'ERC20' and 'Ownable' contracts from 'OpenZepplin', and uses the ERC20 constructor to create tokens. The "mint()" function creates tokens, while the "burnTokens()" function destroys a specified amount. The "decimals()" and "getBalance()" functions return token decimals and account balances. The "storeItems" state variable lists available items, and the "redeemRewards()" function allows players to redeem rewards by exchanging them for tokens. The "transfer()" function transfers tokens to another player.

## Getting started

1. Clone the repository:
```bash
git clone <https://github.com/gks2022004/degen-gaming-token.git>
```
3. Install the dependencies :
 ```bash  
cd  dengen-gaming-token
npm i
```

3. Install the Openzepplin contracts:
``` bash   
npm install @openzeppelin/contracts
```
4. Open two additional terminals in your VS code.
In the second terminal type: `npx hardhat node`.

Before running the script make sure you have enough test avax in your metamask wallet. If not go to: https://faucet.avax.network/

In the third terminal, type: `npx hardhat run scripts/main.js --network fuji`

Can verify by typing: `npx hardhat verify (token address) --network fuji`

To interact with various fucntions, use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/. But first, connect Remix and your local file system: cd to your project and install remixd package:
``` bash
npm install -g @remix-project/remixd
```
Check if installed and then run:
``` bash
remixd --version
remixd
```
Now open the Remix website, click on default workspace and change it to "connect with localhost". Compile your contract. Then go to deploy section and change environment to "Injected Provider". This will help you to connect your metamask wallet. Click on deploy to deploy the contract. Now, you can use the various functions to interact with the contract and mint, burn and transfer your tokens as well as redeem rewards.

### Transcation on snowtrace

If you want to check your transactions, then copy the address on which the contract is deployed and paste it on https://testnet.snowtrace.io/ .
This will show the transcations like mint, deployed,burn etc. 

## Technologies Used
- Remix 
- MetaMask
- ethers.js 
- Hardhat 


## License


                                                          Apache License
                                                     Version 2.0, January 2004
                                                   http://www.apache.org/licenses/        













                              
