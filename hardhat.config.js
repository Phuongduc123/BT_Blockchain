require("@nomiclabs/hardhat-waffle");
require("@nomiclabs/hardhat-etherscan");
const fs = require('fs');
/**
 * @type import('hardhat/config').HardhatUserConfig
 */

const PROJECT_ID = "057f3e05aaa9474f97efa140a3109e08";

// read the private key of your wallet address from .secret file
const PRIVATE_KEY = fs.readFileSync('.secret').toString().trim();

module.exports = {
  solidity: "0.8.7",
  networks: {
    rinkeby: {
      url: `https://rinkeby.infura.io/v3/${PROJECT_ID}`,
      accounts: [`0x${PRIVATE_KEY}`]
    },
    bscTestnet: {
      url: 'https://data-seed-prebsc-1-s1.binance.org:8545/',
      accounts: [`0x${PRIVATE_KEY}`],
      apiKey: ''
    },
    mainnet: {
      url: `https://mainnet.infura.io/v3/${PROJECT_ID}`,
      accounts: [`0x${PRIVATE_KEY}`]
    }
  },
  etherscan: {
    apiKey: {
      bscTestnet: 'WHI1P19FSH31QTTFZFQRBA2J49UDQ9RDKE'
    }
  }
};
