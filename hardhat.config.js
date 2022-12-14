require("@nomicfoundation/hardhat-toolbox");

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.17",
  defaultNetwork: "hardhat",
    networks: {
        hardhat: {
            gas: "auto",
            blockGasLimit: 100000000429720, // whatever you want here
        },
    }
};