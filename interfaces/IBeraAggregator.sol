/* SPDX-License-Identifier: MIT */
pragma solidity =0.8.10;

/* Package Imports */
import { u60x18_t } from "@bonga-bera-capital/bera-utils/contracts/Math.sol";

/** 
 * @title IBeraAggregator
 * @author 0xrebased @ Bonga Bera Capital: https://github.com/BongaBeraCapital
 * @notice Interface of IBeraAggregator
 */
interface IBeraAggregator {

    function addTerminal(address inTerminalAddress) external;

    function removeTerminal(address inTerminalAddress) external;

    function getQuoteFromTerminalAtIndex(
        uint256 index,
        u60x18_t inAmount,
        address inToken,
        address outToken
    ) external view returns (u60x18_t);

    function getLowestQuote(
        u60x18_t inAmount,
        address inToken,
        address outToken
    ) external view returns (uint256, u60x18_t);

    function addLiquidity(
        uint256 index,
        address inPool,
        address[] memory inTokens,
        u60x18_t[] memory inAmounts,
        u60x18_t[] memory inMinimums
    ) external;

    function removeLiquidity(
        uint256 index,
        address inPool,
        address[] memory inTokens,
        u60x18_t[] memory inAmounts,
        u60x18_t[] memory inMinimums
    ) external;

    function marketOrder(
        u60x18_t maxInAmount,
        u60x18_t outAmount,
        address inToken,
        address outToken,
        address inUser,
        uint256 timeout
    ) external;

    function marketOrder(
        uint256 index,
        u60x18_t maxInAmount,
        u60x18_t outAmount,
        address inToken,
        address outToken,
        address inUser,
        uint256 timeout
    ) external;
    function limitOrder(
        u60x18_t inAmount,
        u60x18_t minOutAmount,
        address inToken,
        address outToken,
        address inUser,
        uint256 timeout
    ) external;
    function limitOrder(
        uint256 index,
        address inPool,
        u60x18_t inAmount,
        u60x18_t minOutAmount,
        address inToken,
        address outToken,
        address inUser,
        uint256 timeout
    ) external;
}
