const HDWalletProvider = require("@truffle/hdwallet-provider");
require('dotenv').config();

const providers = {
    networks: {
        mainnet: {
            host: "",
            port: 80,
            network_id: '1'
        },
        rinkeby: {
            provider: function() {
                return new HDWalletProvider(
                    process.env.HDWALLET_MNEMONIC, 
                    process.env.ALCHEMY_PROVIDER + process.env.ALCHEMY_API_KEY)
            },
            network_id: '4',
            from: process.env.DEVELOPMENT_ADDRESS
        },
        rinkeby_test: {
            provider: function() {
                return new HDWalletProvider(
                    process.env.HDWALLET_MNEMONIC, 
                    process.env.ALCHEMY_PROVIDER + process.env.ALCHEMY_API_KEY)
            },
            network_id: '4',
            from: process.env.DEVELOPMENT_ADDRESS
        },
        avax_c: {
            provider: function() {
                return new HDWalletProvider(
                    process.env.HDWALLET_MNEMONIC, 
                    process.env.AVAX_TEST_RPC)
            },
            network_id: '*',
            from: process.env.DEVELOPMENT_ADDRESS,
            skipDryRun: true,
            gas: 3000000,      
            gasPrice: 225000000000,
        },
        avax_c_test: {
            provider: function() {
                return new HDWalletProvider(
                    process.env.HDWALLET_MNEMONIC, 
                    process.env.AVAX_TEST_RPC)
            },
            network_id: '*',
            from: process.env.DEVELOPMENT_ADDRESS,
            skipDryRun: true,
            gas: 3000000,      
            gasPrice: 225000000000,
        },
        development: {
            host: "127.0.0.1",
            port: "8546",
            network_id: '4',
            gasPrice: 1e6,
            from: process.env.DEVELOPMENT_ADDRESS
        }
    }
}

module.exports = providers;