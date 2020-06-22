const Token = artifacts.require("Token");

module.exports = function(deployer) {
  deployer.deploy(Token, 1595389544, 1595476244)
};
