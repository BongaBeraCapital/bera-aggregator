/* SPDX-License-Identifier: MIT */
pragma solidity =0.8.10;

/* Internal Imports */
import {BeraAggregatorKeys} from "../../../storage/BeraAggregatorKeys.sol";
import {UniV2Terminal} from "../ethereum/UniV2Terminal.sol";


contract SpiritTerminal is UniV2Terminal {
    function getUniswapV2FactoryAddress() internal view virtual override returns (address) {
        return BeraStorage_.getAddress(keccak256(BeraAggregatorKeys.spiritswap.factory_address));
    }
}
