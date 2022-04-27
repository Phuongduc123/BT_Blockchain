const {ethers, upgrades} = require('hardhat');
const { expect } = require("chai");
const { BigNumber } = require("ethers");

describe("StakingPoint", ()=>{
    before('function', async ()=>{
        [deployer, user1, user2, user3, rewardDistributor] = await ethers.getSigners();

        this.CollectionERC721 = await ethers.getContractFactory("CollectionERC721");
        this.collectionERC721 = await this.CollectionERC721.deploy("COLLECTION NFT WITH OWNER", "NFTT");

        this.CollectionERC1155 = await ethers.getContractFactory("CollectionERC1155");
        this.collectionERC1155 = await this.CollectionERC1155.deploy("https://game.example/api/item/0000000000000000000000000000000000000000000000000000000000000002.json");

        this.AirdropNFT = await ethers.getContractFactory("AirdropNFT");
        this.airdropNFT = await this.AirdropNFT.deploy(this.collectionERC721.address, this.collectionERC1155.address ); 
        console.log(`AirdropNFT contract: ${this.AirdropNFT.address}`);
    })

    it("blockNumber", async()=>{
        const blockNumber = await this.airdropNFT.blockNumber();
        console.log("phuong32", blockNumber.toString())
        expect(await this.airdropNFT.blockNumber()).to.be.ok;
    })

})