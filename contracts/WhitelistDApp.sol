//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract WhitelistDapp{

    // Max number of whitelisted addresses allowed
    uint8 public maxWhitelistedAddresses;

    // Create a mapping of whitelistedAddresses
    // if an address is whitelisted, we would set it to true, it is false by default for all other addresses.
    mapping(address => bool) public whitelistedAddresses;

    // numOfAddressesWhitelisted would be used to keep track of how many addresses have been whitelisted
    uint8 public numOfAddressesWhitelisted;

    // Setting the Max number of whitelisted addresses
    // User will put the value at the time of deployment
    constructor(uint8 _maxWhitelistedAddresses) {
        maxWhitelistedAddresses =  _maxWhitelistedAddresses;
    }

    /**
        addAddressToWhitelist - This function adds the address of the sender to the
        whitelist
     */
    function addAddressToWhitelist() public {
        // check if the user has already been whitelisted
        require(!whitelistedAddresses[msg.sender], "Address has already been whitelisted");
        
        // check if the numOfAddressesWhitelisted < maxWhitelistedAddresses, if not then throw an error.
        require(numOfAddressesWhitelisted < maxWhitelistedAddresses, "Limit reached, more addresses can't be whitelisted!");
        
        // Add the address which called the function to the whitelistedAddress array
        whitelistedAddresses[msg.sender] = true;
        
        // Increase the number of whitelisted addresses
        numOfAddressesWhitelisted += 1;
    }


}