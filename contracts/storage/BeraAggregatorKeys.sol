// SPDX-License-Identifier: MIT
pragma solidity =0.8.10;

/**
 * @title BeraAggregatorKeys
 * @author 0xrebased @ Bonga Bera Capital: https://github.com/BongaBeraCapital
 * @notice Stores keys to use for lookup in the BeraStorage contract
 */
abstract contract BeraAggregatorKeys {
    //=================================================================================================================
    // Declarations
    //=================================================================================================================

    _uni internal uniswap = _uni(_v2("uniswap.v2.factory.address"), _v3("uniswap.v2.factory.address"));
    _spky internal spookyswap = _spky("spookyswap.factory.address");
    _sushi internal sushiswap = _sushi("sushiswap.factory.address");
    
    //=================================================================================================================
    // Definitions
    //=================================================================================================================

    struct _v2 {
        bytes factory_address;
    }

    struct _v3 {
        bytes factory_address;
    }

    struct _sushi {
        bytes factory_address;
    }

    struct _spky {
        bytes factory_address;
    }

    struct _uni {
        _v2 v2;
        _v3 v3;
    }
}
