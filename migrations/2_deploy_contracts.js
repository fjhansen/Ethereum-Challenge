const Token = artifacts.require("Token");

module.exports = function(deployer) {
  deployer.deploy(Token, 1592740800, 1592827260)
};
