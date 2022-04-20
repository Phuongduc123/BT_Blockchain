const hre = require("hardhat");

async function main() {
  [address0] = await ethers.getSigners();
  const CollectionERC1155 = await hre.ethers.getContractFactory("CollectionERC1155");
  const collectionERC1155 = await CollectionERC1155.deploy("https://game.example/api/item/0000000000000000000000000000000000000000000000000000000000000002.json");

  await collectionERC1155.deployed();
  collectionERC1155.connect(address0).mint("https://ipfs.io/ipfs/QmWYqaxNntK9qU1k5wWYoqMiFV62aEyJEXWS3Bcpo2ohTq",1000);


  console.log("CollectionERC1155 deployed to:", collectionERC1155.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
