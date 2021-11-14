// SPDX-License-Identifier: MIT
pragma solidity >=0.8.10;

import { u60x18_t } from "@bonga-bera-capital/bera-utils/contracts/Math.sol";

interface ITradingTerminal {
   
    //=================================================================================================================
    // Accessors
    //=================================================================================================================
   
    function getQuote(u60x18_t inAmount, address inToken, address outToken ) external view returns (u60x18_t);

    //=================================================================================================================
    // Liquidity
    //=================================================================================================================
   
    function addLiquidity(address[] memory inTokens, u60x18_t[] memory inAmounts, u60x18_t[] memory inMinimums ) external;
    function removeLiquidity(address[] memory inTokens, u60x18_t[] memory inAmounts, u60x18_t[] memory inMinimums) external;

    //=================================================================================================================
    // Swaps
    //=================================================================================================================
   
    function limitOrder(u60x18_t inAmount, u60x18_t minOutAmount, address inToken, address outToken, address inUser, uint256 timeout) external;
    function marketOrder(u60x18_t maxInAmount, u60x18_t outAmount, address inToken, address outToken, address inUser, uint256 timeout) external;

}
