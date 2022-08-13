require("@nomicfoundation/hardhat-toolbox");
require('hardhat-deploy');
require('dotenv').config({ path: './.env' })

const PANGORO_PRIVATE_KEY = process.env.PANGORO_PRIVATE_KEY 
const PANGOLIN_PRIVATE_KEY = process.env.PANGOLIN_PRIVATE_KEY 

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.9",
  defaultNetwork: 'pangoro',
  networks: {
    pangoro: {
      url: 'https://pangoro-rpc.darwinia.network',
      network_id: "45",
      accounts: [PANGORO_PRIVATE_KEY],
      gas: 3_000_000,
      gasPrice: 53100000000
    },
    pangolin: {
      url: 'https://pangolin-rpc.darwinia.network',
      network_id: "43",
      accounts: [PANGOLIN_PRIVATE_KEY],
      gas: 3_000_000,
      gasPrice: 53100000000
    },
  }
};
