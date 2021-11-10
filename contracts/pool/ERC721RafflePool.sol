// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.9;

import {Initializable, OwnableUpgradeable} from "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import {ERC20Upgradeable} from "@openzeppelin/contracts-upgradeable/token/ERC20/ERC20Upgradeable.sol";

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import {SafeERC20} from "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import {ERC721Holder} from "@openzeppelin/contracts/token/ERC721/utils/ERC721Holder.sol";

import {SafeMathUpgradeable} from "@openzeppelin/contracts-upgradeable/utils/math/SafeMathUpgradeable.sol";
import {PoolPartyToken} from "../token/PoolPartyToken.sol";
import {PoolPartyEntryTicket} from "../token/ticket/PoolPartyEntryTicket.sol";

import {MultiTokenVaultUpgradeable} from "@poolparty/token-vaults/contracts/vault/MultiTokenVault.sol";
import {RafflePool} from "./RafflePool.sol";

contract ERC721RafflePool is Initializable, OwnableUpgradeable, RafflePool, MultiTokenVaultUpgradeable {
    using SafeERC20 for ERC20;
    using SafeMathUpgradeable for uint256;
    
    ERC721 private _erc721Contract;
    uint256 private _erc721TokenId;

    uint256 private _startPeriod;
    uint256 private _durationPeriodSeconds;

    uint256 private _estimatedGasCost;

    function initialize(
        address erc721Contract,
        uint256 erc721TokenId,
        uint256 acceptedPrice,
        uint256 startPeriod,
        uint256 durationPeriodSeconds,
        uint256 estimatedGasCost,
        uint8 acceptedSlippage,
        StoredContract[] memory storedContracts
    )
        public
        initializer
    {
        RafflePool.initialize(
            acceptedPrice, 
            acceptedSlippage
        );

        MultiTokenVaultUpgradeable.initialize(
           storedContracts
        );

        _erc721Contract = ERC721(erc721Contract);
        _erc721TokenId = erc721TokenId;

        _startPeriod = startPeriod;
        _durationPeriodSeconds = durationPeriodSeconds;   

        _estimatedGasCost = estimatedGasCost;     
    }

    function chargeFinalizationGasUpfront(
        address from, 
        address to,
        uint256 amount
    )
        external
        view
        returns (uint256)
    {

    }

    function _timeRemainingSeconds()
        internal
        view
        returns (uint256)
    {
        uint256 currentTime = _currentTimestamp();
        uint256 ending = _endingTime();
        if(currentTime > ending) {
            return 0;
        }
        return ending.sub(currentTime);
    }

    function raffleEndTime()
        external
        view 
        returns (uint256)
    {
        return _endingTime();
    }

    function _endingTime()
        internal
        view
        returns (uint256)
    {
        return _startPeriod.add(_durationPeriodSeconds);
    }

    function _estimateGasWinnerExpense()
        internal 
        view
        returns (uint256)
    {
        
    }

    function _currentBlock()
        internal
        view
        returns (uint256)
    {
        return block.number;
    }

    function _currentTimestamp() 
        internal
        view
        returns (uint256)
    {
        return block.timestamp;
    }

    function onERC721Received(
        address,
        address,
        uint256,
        bytes memory
    ) 
        public 
        override 
        pure
        returns (bytes4) 
    {
        return this.onERC721Received.selector;
    }

}