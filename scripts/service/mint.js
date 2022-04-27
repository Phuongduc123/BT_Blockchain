const hre = require("hardhat");
const {ethers} = require('hardhat');

async function main() {
  [deployer] = await ethers.getSigners();
  const MyToken = await hre.ethers.getContractAt("MyToken","0xf86DADFf7CB0e7d5fdFAC792Ca25ECbcFD5b8fA9");
  console.log(await MyToken.decimals())

  await MyToken.mint("0xF23f7bDd948Ebca7950d5B1F206f696D1A2702E0", ethers.utils.parseEther("1000000000"));
  console.log("A")
  await MyToken.mint("0xDe24e8d4860BbafD8888436096de27BE62dCCD7d", ethers.utils.parseEther("1000000000"));
  console.log("A")

  await MyToken.mint("0x3D2EB1e0E71c865903Af8284E9D96D78783F3e8c", ethers.utils.parseEther("1000000000"));
  console.log("A")
  console.log("MyToken deployed to:", MyToken.address, deployer.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
