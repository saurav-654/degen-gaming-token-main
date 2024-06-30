const hre = require("hardhat");

async function main() {
  const [deployer] = await hre.ethers.getSigners();
  console.log("Deploying contracts with account: ", deployer.address);
  
  const DegenToken = await hre.ethers.getContractFactory("DegenToken");

  // Deploy it
  const degenToken = await DegenToken.deploy();
  await degenToken.waitForDeployment();

  // Display the contract address
  console.log(`Degen token deployed to ${await degenToken.getAddress()}`);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});