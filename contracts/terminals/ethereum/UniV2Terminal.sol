/* SPDX-License-Identifier: MIT */
pragma solidity =0.8.10;

/* Package Imports */
import {u60x18, u60x18_t} from "@bonga-bera-capital/bera-utils/contracts/Math.sol";
import {BeraStorageMixin} from "@bonga-bera-capital/bera-storage/contracts/BeraStorageMixin.sol";

/* Package Interface Imports */
import {IUniswapV2Pair} from "@uniswap/v2-core/contracts/interfaces/IUniswapV2Pair.sol";
import {IUniswapV2Factory} from "@uniswap/v2-core/contracts/interfaces/IUniswapV2Factory.sol";
import {IUniswapV2Router02} from "@bonga-bera-capital/uniswap/v2-periphery/contracts/interfaces/IUniswapV2Router02.sol";

/* Internal Imports */
import {BeraAggregatorKeys} from "../../storage/BeraAggregatorKeys.sol";

/* Internal Interface Imports */
import {ITradingTerminal} from "../../../interfaces/terminals/ITradingTerminal.sol";

contract UniV2Terminal is BeraStorageMixin, BeraAggregatorKeys, ITradingTerminal {

    function getQuote(
        u60x18_t inAmount,
        address inToken,
        address outToken
    ) external view virtual override returns (u60x18_t) {
        return u60x18_t.wrap(0);
    }

    function addLiquidity(
        address[] memory inTokens,
        u60x18_t[] memory inAmounts,
        u60x18_t[] memory inMinimums
    ) external virtual override {
        return;
    }

    function removeLiquidity(
        address[] memory inTokens,
        u60x18_t[] memory inAmounts,
        u60x18_t[] memory inMinimums
    ) external virtual override {
        return;
    }

    function limitOrder(
        u60x18_t inAmount,
        u60x18_t minOutAmount,
        address inToken,
        address outToken,
        address inUser,
        uint256 timeout
    ) external virtual override {
        return;
    }

    function marketOrder(
        u60x18_t maxInAmount,
        u60x18_t outAmount,
        address inToken,
        address outToken,
        address inUser,
        uint256 timeout
    ) external virtual override {
        return;
    }

    function getUniswapV2FactoryAddress() internal view virtual returns (address) {
        return BeraStorage.getAddress(keccak256(BeraAggregatorKeys.uniswap.v2.factory_address));
    }

    function getUniswapV2Factory() internal view virtual returns (IUniswapV2Factory) {
        return IUniswapV2Factory(getUniswapV2FactoryAddress());
    }

    function getUniswapV2Pair(address token0, address token1) internal view virtual returns (IUniswapV2Pair) {
        return IUniswapV2Pair(getUniswapV2Factory().getPair(token0, token1));
    }
}
