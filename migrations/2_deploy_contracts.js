var Splitter = artifacts.require("./Splitter.sol");

module.exports = function(deployer) {
    var b0b = "0xd61c423690d5808cc804656fd3bc2ede68c0f102";    
    var car0l = "0xf579141cea872344fe70cb6ff48998b1f069351c";
    deployer.deploy(Splitter, b0b, car0l);
};


