const hre = require("hardhat");

async function main() {
  const AirdropNFT = await hre.ethers.getContractFactory("AirdropNFT");
  const airdropNFT = await AirdropNFT.deploy("0x14D672f68A4Ed8Ea3fB5b3FfFcA748Dc342c3049", "0xa25374d655cEf4181B6691f90b8D9E078904c513");

  await airdropNFT.deployed();

  console.log("AirdropNFT deployed to:", airdropNFT.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
