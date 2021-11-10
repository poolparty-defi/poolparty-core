// const HDWalletProvider = require('@truffle/hdwallet-provider');
//
// const fs = require('fs');
// const mnemonic = fs.readFileSync(".secret").toString().trim();

const providers = require('./truffle-providers')

module.exports = {

  ...providers,

  mocha: {
    // timeout: 100000
  },

  compilers: {
    solc: {
      version: "^0.8.9",
      docker: false,
      parser: "solcjs",
      settings: {
        optimizer: {
          enabled: true, //env.
          runs: 200 //env.
        },
        emvVersion: "instanbul" //env.
      }
    }
  }
};
