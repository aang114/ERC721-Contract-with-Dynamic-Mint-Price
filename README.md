# ERC721 Contract with Dynamic Mint Price

## Task



Using the Truffle suite and OpenZeppelin contracts, create an ERC721 contract that uses the Enumerable extension where the minting function:

1. Takes an amount of tokens users can mint; and 
2. The price increases quadratically for each token minted.



## Solution

The ERC721 Contract created is `contracts/MyContract.sol`

The quadrtaic sequence function used to determine the price is `ax^2`, where `x` starts from 1. 

Therefore, the `x`th token minted has a price of `ax^2` ether. 



The state variables are:

1. `maxMintAmount`  - which determines the maximum amount of tokens that can be minted when calling the `mint` function
   1. It is set to `10`
2. `initialCost` is the constant `a` in the quadratric sequence function `ax^2` 
   1. It is set to `0.01 ether`







