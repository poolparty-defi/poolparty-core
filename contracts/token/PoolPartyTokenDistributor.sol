// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.9;

import {Initializable, OwnableUpgradeable} from "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import {SafeERC20} from "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";

import {PoolPartyToken} from "./PoolPartyToken.sol";

import {MultiTokenVaultUpgradeable} from "@poolparty/token-vaults/contracts/vault/MultiTokenVault.sol";

contract PoolPartyTokenDistributor is Initializable {
    using SafeERC20 for IERC20;

    MultiTokenVaultUpgradeable private _multiTokenVault;

    PoolPartyToken private _token;

    function initialize(address multiTokenVault)
        public
        initializer
    {
        require(multiTokenVault != address(0), "validation_error:initialize:multiTokenVault_zero_address");
        _multiTokenVault = MultiTokenVaultUpgradeable(multiTokenVault);
    }

    modifier _meetsVaultRequirements(address token, uint256 amount) {
        require(token != address(0), "validation_error:_meetsVaultRequirements:token_address_zero");
        require(amount > 0, "validation_error:_meetsVaultRequirements:amount_zero");
        _;
    }

    function _mintToVault(address token, uint256 amount) 
        internal
        _meetsVaultRequirements(token, amount)
    {
        
    }

    function depositToVault(address token, uint256 amount)
        external
        _meetsVaultRequirements(token, amount)
    {
        _multiTokenVault.deposit(token, amount);
    }

    function withdrawFromVault(address token, uint256 amount)
        external
        _meetsVaultRequirements(token, amount)
    {
        _multiTokenVault.withdraw(token, amount);
    }
}