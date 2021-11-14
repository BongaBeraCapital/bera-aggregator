/* SPDX-License-Identifier: MIT */
pragma solidity =0.8.10;

/* Package Interface Imports */
import {IUniswapV2Factory} from "@uniswap/v2-core/contracts/interfaces/IUniswapV2Factory.sol";

/* Internal Imports */
import {BeraAggregatorKeys} from "../../../storage/BeraAggregatorKeys.sol";
import {UniV2Terminal} from "../ethereum/UniV2Terminal.sol";


contract SpookyTerminal is UniV2Terminal {
    function getUniswapV2FactoryAddress() internal view virtual override returns (address) {
        return BeraStorage.getAddress(keccak256(BeraAggregatorKeys.spookyswap.factory_address));
    }
}
