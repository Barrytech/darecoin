var Darecoin = artifacts.require("./Darecoin.sol");

module.exports = function(deployer) {
  deployer.deploy( Darecoin
                 , 0x0c762C4a8D894a7107c7A77aC10029a09Bddb445 // Fees goes to Barry's metamask
                 , 0 // game-fee percent
                 , 10000000000000000 // stake size
                 , 2 // max players
                 , 1 // game-stage length
                 , 0x805cdcf68cc12220f89425be89daa44dbc83ff30 // npt address
                 );
};
