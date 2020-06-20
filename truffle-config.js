module.exports = {
  networks: {
    development: {
      host: "localhost",
      port: 7545,
      network_id: "5777", // Match any network id
      gas: 5000000
    }
  },
  contracts_directory: './src/contracts/',
  contracts_build_directory: './src/abis/',
  compilers: {
    solc: {
      version: '0.6.10',
      settings: {
        optimizer: {
          enabled: true, // Default: false
          runs: 200      // Default: 200
        },
      }
    }
  }
};
