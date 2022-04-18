const hre = require("hardhat");

async function main() {
  const Airdrop = await hre.ethers.getContractFactory("Airdrop");
  const airDrop = await Airdrop.deploy("0xaf744cEf1F0f4AAc4C6f310627586Fe82d1FFA08");

  await airDrop.deployed();

  console.log("Airdrop deployed to:", airDrop.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
