/* SPDX-License-Identifier: MIT */
pragma solidity =0.8.10;

/* Package Imports */
import {u60x18, u60x18_t} from "@bonga-bera-capital/bera-utils/contracts/Math.sol";
import {TypeSwaps} from "@bonga-bera-capital/bera-utils/contracts/TypeSwaps.sol";

/* Internal Interface Imports */
import {ITradingTerminal} from "../interfaces/terminals/ITradingTerminal.sol";
import {IBeraAggregator} from "../interfaces/IBeraAggregator.sol";

contract BeraAggregator is IBeraAggregator {
    using u60x18 for u60x18_t;

    ITradingTerminal[] public terminals;

    constructor() {}

    function addTerminal(address inTerminalAddress) external {
        // ITradingTerminal newTerminal = ITradingTerminal(inTerminalAddress);
        // terminals[newTerminal.name()] = newTerminal;
    }

    function removeTerminal(address inTerminalAddress) external {
        // ITradingTerminal newTerminal = ITradingTerminal(inTerminalAddress);
        // delete terminals[newTerminal.name()];
    }

    function getQuoteFromTerminalAtIndex(
        uint256 index,
        u60x18_t inAmount,
        address inToken,
        address outToken
    ) public view override returns (u60x18_t) {
        return terminals[index].getQuote(inAmount, inToken, outToken);
    }

    function getLowestQuote(
        u60x18_t inAmount,
        address inToken,
        address outToken
    ) public view override returns (uint256, u60x18_t) {
        u60x18_t lowestQuote = u60x18_t.wrap(2**256 - 1);
        uint256 lowestTerminal;
        for (uint256 i = 0; i < terminals.length; i += 1) {
            u60x18_t quote = getQuoteFromTerminalAtIndex(i, inAmount, inToken, outToken);
            if (quote.lt(lowestQuote)) {
                lowestQuote = quote;
                lowestTerminal = i;
            }
        }
        return (lowestTerminal, lowestQuote);
    }

    function addLiquidity(
        uint256 index,
        address inPool,
        address[] memory inTokens,
        u60x18_t[] memory inAmounts,
        u60x18_t[] memory inMinimums
    ) external virtual override {
        return terminals[index].addLiquidity(inTokens, inAmounts, inMinimums);
    }

    function removeLiquidity(
        uint256 index,
        address inPool,
        address[] memory inTokens,
        u60x18_t[] memory inAmounts,
        u60x18_t[] memory inMinimums
    ) external virtual override {
        return terminals[index].removeLiquidity(inTokens, inAmounts, inMinimums);
    }

    function marketOrder(
        u60x18_t maxInAmount,
        u60x18_t outAmount,
        address inToken,
        address outToken,
        address inUser,
        uint256 timeout
    ) external override {
        (uint256 index, ) = getLowestQuote(maxInAmount, inToken, outToken);
        return terminals[index].marketOrder(maxInAmount, outAmount, inToken, outToken, inUser, timeout);
    }

    function marketOrder(
        uint256 index,
        u60x18_t maxInAmount,
        u60x18_t outAmount,
        address inToken,
        address outToken,
        address inUser,
        uint256 timeout
    ) external override {
        return terminals[index].marketOrder(maxInAmount, outAmount, inToken, outToken, inUser, timeout);
    }

    function limitOrder(
        u60x18_t inAmount,
        u60x18_t minOutAmount,
        address inToken,
        address outToken,
        address inUser,
        uint256 timeout
    ) external override {
        (uint256 index, ) = getLowestQuote(inAmount, inToken, outToken);
        return terminals[index].limitOrder(inAmount, minOutAmount, inToken, outToken, inUser, timeout);
    }

    function limitOrder(
        uint256 index,
        address inPool,
        u60x18_t inAmount,
        u60x18_t minOutAmount,
        address inToken,
        address outToken,
        address inUser,
        uint256 timeout
    ) external override {
        return terminals[index].limitOrder(inAmount, minOutAmount, inToken, outToken, inUser, timeout);
    }
}
