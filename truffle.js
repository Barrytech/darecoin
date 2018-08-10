var HDWalletProvider = require("truffle-hdwallet-provider");

var mnemonic = "august net desert drastic hover avoid soldier film sweet actual income suggest";

module.exports = {
  networks: {
    rinkeby: {
      provider: new HDWalletProvider(mnemonic, "https://rinkeby.infura.io/"),
      network_id: 4,
      gas: 4992222,
      gasPrice: 22000000000 // Specified in Wei
    },
    mainnet: {
      provider: new HDWalletProvider(mnemonic, "https://mainnet.infura.io/"),
      network_id: 4,
      gas: 4992222,
      gasPrice: 22000000000 // Specified in Wei
    }
  }
};
