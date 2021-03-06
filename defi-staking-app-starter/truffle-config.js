// We're settings up our networks to the Ganache Network
module.exports = {
  networks: {
    development: {
      host: "127.0.0.1",
      port: 7545,
      network_id: "*", // Connect to any network
    },
  },

  // The path of contracts folder
  contracts_directory: "./src/contracts",

  // The path of all our JSON Files
  contracts_build_directory: "./src/truffle_abis",

  compilers: {
    solc: {
      version: "^0.5.0",
      optimizer: {
        enabled: true,
        runs: 200,
      },
    },
  },
};
