// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.9;

import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/utils/math/SafeMathUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/utils/math/SafeCastUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/security/ReentrancyGuardUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC721/IERC721Upgradeable.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC721/IERC721ReceiverUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/utils/introspection/ERC165CheckerUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC20/utils/SafeERC20Upgradeable.sol";

import {IRafflePool} from "./IRafflePool.sol";

abstract contract RafflePool is IRafflePool, OwnableUpgradeable, ReentrancyGuardUpgradeable, IERC721ReceiverUpgradeable {
    using SafeMathUpgradeable for uint256;
    using SafeCastUpgradeable for uint256;
    using SafeERC20Upgradeable for IERC20Upgradeable;
    using SafeERC20Upgradeable for IERC721Upgradeable;
    using ERC165CheckerUpgradeable for address;

    uint256 internal _acceptedPrice;
    uint8 internal _acceptedSlippage;

    function initialize(
        uint256 acceptedPrice,
        uint8 acceptedSlippage
    )
        public
        initializer
    {
        __Ownable_init();
        __ReentrancyGuard_init();
        
        _acceptedPrice = acceptedPrice;
        _acceptedSlippage = acceptedSlippage;
    }

    function purchaseTicket(
        address to,
        uint256 amount
    ) 
        override
        external
    {
        
    }

    function entryCountOf(address depositor)
        external
        view
        override
        returns (uint256) 
    {

    }

    function depositBalance()
        external
        view
        override
        returns (uint256)
    {

    }

    function raffleGoal()
        external
        view
        override
        returns (uint256) 
    {

    }

    function remainingGoalBalance()
        external
        view
        override
        returns (uint256)
    {

    }

    function transferERC721(
        address to,
        address token, 
        uint256 tokenId
    )   external
        override
    {

    }

    /// @dev Returns the ticket address of the underlying ERC20 token.
    /// @return The address of the ticket asset.
    function ticket() 
        external
        view
        override
        returns (address)
    {

    } 
}