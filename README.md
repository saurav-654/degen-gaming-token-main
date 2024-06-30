
# DegenToken README

## Overview

**DegenToken (DGT)** is an ERC20 token contract deployed on the Avalanche network. It serves as the main currency for the Degen gaming ecosystem, allowing users to mint, burn, transfer tokens, and redeem them for exclusive in-game items.

## Contract Details

- **Token Name**: Degen Gaming Token
- **Token Symbol**: DGT
- **Decimals**: 0 (1 token equals 1 unit, no fractional tokens)
- **Network**: Avalanche

## Features

- **Minting**: Only the contract owner can mint new tokens.
- **Burning**: Users can burn their own tokens to remove them from circulation.
- **Transferring**: Users can transfer tokens to others.
- **Balance Checking**: Users can check their own token balance.
- **Item Redemption**: Users can redeem tokens for special items in the Degen gaming store.



## Setup Instructions

1. **Prerequisites**: Ensure you have the following installed:
   - [Node.js](https://nodejs.org/)
   - [npm](https://www.npmjs.com/)
   - [Hardhat](https://hardhat.org/)

2. **Clone the Repository**:
   ```bash
   git clone https://github.com/your-repo/DegenToken.git
   cd DegenToken
   ```

3. **Install Dependencies**:
   ```bash
   npm install
   ```

4. **Compile the Contract**:
   ```bash
   npx hardhat compile
   ```

5. **Deploy the Contract**:
   - Create a `.env` file and add your private key and RPC URL for the Avalanche network.
   - Deploy the contract using Hardhat.
   ```bash
   npx hardhat run scripts/deploy.js --network avalanche
   ```

6. **Verify the Deployment**:
   - Check the Avalanche Explorer to ensure your contract is deployed and verify it if required.

## Usage Examples

### Minting Tokens

To mint tokens, call the `mint` function. Only the owner can execute this.

```solidity
function mint(address to, uint256 amount) public onlyOwner
```

**Example**:

```js
await degenToken.mint("0xRecipientAddress", 100);
```

### Burning Tokens

Users can burn their tokens using the `burnTokens` function.

```solidity
function burnTokens(uint amount) public
```



### Transferring Tokens

Transfer tokens to another address with the `transfer` function.

```solidity
function transfer(address recipient, uint256 amount) public override returns (bool)
```



### Checking Balance

Check your balance using the `getBalance` function.

```solidity
function getBalance() external view returns (uint256)
```



### Redeeming Tokens for Items

Redeem tokens for items using the `redeemTokens` function.

```solidity
function redeemTokens(uint8 num) external returns (string memory)
```





## License

This project is licensed under the MIT License. See the `LICENSE` file for more information.

