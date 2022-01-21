// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;
import '@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol';


contract MyContract is ERC721Enumerable {

    // The cost of minting the first token
    uint public initialCost = 0.01 ether;
    // The maximum amount of tokens that can be minted when calling the mint function
    uint public maxMintAmount = 10;

    constructor() ERC721('MyNFT', 'MNFT') {

    }

    // Calculates the sum of the quadratic sequence x^2 up to the nth term
    // Note: We are using a mathematical formula instead of using a for loop, so that we can save on gas fees
    function quadraticSumToN(uint n) private pure returns (uint) {
        return n * (n + 1) * (2 * n + 1) / 6;
    }

    // Gets the total cost of minting `_mintAmount` tokens, given the current token supply of `_supply`
    function getTotalCost(uint _supply, uint _mintAmount) private view returns (uint _cost) {

        // We are using one-based numbering for the quadratic sequence
        uint nextIndex = _supply + 1;

        uint startingN = nextIndex - 1;
        uint endingN = nextIndex + _mintAmount - 1;

        uint totalCost = initialCost * (quadraticSumToN(endingN) - quadraticSumToN(startingN));

        return totalCost;
    }


    function mint(uint _mintAmount) public payable {

        uint supply = totalSupply();

        require(_mintAmount > 0);
        require(_mintAmount <= maxMintAmount);
        require(msg.value >= getTotalCost(supply, _mintAmount), "Not enough ether");

        for (uint i = 1; i <= _mintAmount; i++) {
            _safeMint(msg.sender, supply + i);
        }
    }



}
