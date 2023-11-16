import * as dotenv from "dotenv";
import { HardhatUserConfig } from "hardhat/config";
import "hardhat-gas-reporter";
import "hardhat-tracer";
import "@nomicfoundation/hardhat-toolbox";

dotenv.config();

// You need to export an object to set up your config
// Go to https://hardhat.org/config/ to learn more

  const config: HardhatUserConfig = {
    solidity: {
      version: '0.8.7',
      settings: {
          optimizer: {
              enabled: true,
              runs: 2000,
              details: { yul: false },
          },
      },
  },
  
  networks: {
    hardhat: {
    },
    polygon: {
      url: " https://polygon-rpc.com",
      accounts: process.env.PRIVATE_KEY !== undefined ? [process.env.PRIVATE_KEY]:[]
    },
    ethereum: {
      url: process.env.INFURA_API_KEY !== undefined ? `https://mainnet.infura.io/v3/${process.env.INFURA_API_KEY}` : "",
      accounts: process.env.PRIVATE_KEY !== undefined ? [process.env.PRIVATE_KEY]:[]
    },
    mumbai: {
      url: "https://rpc-mumbai.maticvigil.com",
      accounts: process.env.PRIVATE_KEY !== undefined ? [process.env.PRIVATE_KEY]:[]
    },
    goerli: {
      url: process.env.INFURA_API_KEY !== undefined ? `https://mainnet.infura.io/v3/${process.env.INFURA_API_KEY}` : "",
      accounts: process.env.PRIVATE_KEY !== undefined ? [process.env.PRIVATE_KEY]:[]
    },
    cronos: {
      url: "https://evm.cronos.org",
      accounts: process.env.PRIVATE_KEY !== undefined ? [process.env.PRIVATE_KEY]:[]
    },
    celo: {
      url: "https://forno.celo.org",
      accounts: process.env.PRIVATE_KEY !== undefined ? [process.env.PRIVATE_KEY]:[]
    },
    gnosis: {
      url: "https://rpc.gnosischain.com/",
      accounts: process.env.PRIVATE_KEY !== undefined ? [process.env.PRIVATE_KEY]:[]
    },
  },
  gasReporter: {
    enabled: process.env.REPORT_GAS !== undefined,
    currency: "EUR",
  },
  etherscan: {
    apiKey: process.env.ETHERSCAN_API_KEY !== undefined ? process.env.ETHERSCAN_API_KEY : "",
  },
  paths: {
    sources: "./src/contracts",
    tests: "./test"
  }
};

export default config;
