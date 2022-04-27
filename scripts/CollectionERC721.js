const hre = require("hardhat");

async function main() {
  [address0] = await ethers.getSigners();
  const CollectionERC721 = await hre.ethers.getContractFactory("CollectionERC721");
  const collectionERC721 = await CollectionERC721.deploy("COLLECTION NFT WITH OWNER", "NFTT");

  await collectionERC721.deployed();
  collectionERC721.connect(address0).mint("https://ipfs.io/ipfs/QmWYqaxNntK9qU1k5wWYoqMiFV62aEyJEXWS3Bcpo2ohTq");


  console.log("CollectionERC721 deployed to:", collectionERC721.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
