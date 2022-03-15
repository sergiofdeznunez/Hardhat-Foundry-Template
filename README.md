# Hardhat Foundry Template

This is a solidity template which lets you use both, [Hardhat](https://hardhat.org) and [Foundry](https://github.com/gakonst/foundry).

## Why use both the tools?

Foundry has some awesome testing capabilities, thanks to [cheatcodes](https://onbjerg.github.io/foundry-book/forge/cheatcodes.html), which can manipulate the state of the blockchain. However, I was missing out on some features offered by Hardhat. 

## Getting Started

```shell
npm install
forge install
```

## Foundry Instructions

Write forge tests in [src/test](./src/test).

```shell
forge build
forge test
```

## Hardhat Instructions

Write hardhat tests in [test](./test/).

```shell
npx hardhat accounts
npx hardhat compile
npx hardhat clean
npx hardhat test
npx hardhat node
npx hardhat help
REPORT_GAS=true npx hardhat test
npx hardhat coverage
npx hardhat run scripts/deploy.ts
TS_NODE_FILES=true npx ts-node scripts/deploy.ts
npx eslint '**/*.{js,ts}'
npx eslint '**/*.{js,ts}' --fix
npx prettier '**/*.{json,sol,md}' --check
npx prettier '**/*.{json,sol,md}' --write
npx solhint 'contracts/**/*.sol'
npx solhint 'contracts/**/*.sol' --fix
```

### Etherscan/Polygonscan verification

To try out Etherscan verification, you first need to deploy a contract to a network

In this project, copy the .env.example file to a file named .env, and then edit it to fill in the details. Enter your Etherscan/Polygonscan API keys, and the private key of the account which will send the deployment transaction.

```shell
hardhat run --network DEPLOY_NETWORK scripts/sample-script.ts
```

Then, copy the deployment address and paste it in to replace `DEPLOYED_CONTRACT_ADDRESS` in this command:

```shell
npx hardhat verify --network DEPLOY_NETWORK DEPLOYED_CONTRACT_ADDRESS
```

## Credits

- https://github.com/ImRajdeepB/hardhat-foundry-starter
