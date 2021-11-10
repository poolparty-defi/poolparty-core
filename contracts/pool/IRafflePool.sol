// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.9;

interface IRafflePool {

    function purchaseTicket(
        address to,
        uint256 amount
    ) external;

    function entryCountOf(address depositor)
        external
        view
        returns (uint256);

    function depositBalance()
        external
        view
        returns (uint256);

    function raffleGoal()
        external
        view
        returns (uint256);

    function remainingGoalBalance()
        external
        view
        returns (uint256);

    function transferERC721(
        address to,
        address token, 
        uint256 tokenId
    ) external;

    /// @dev Returns the ticket address of the underlying ERC20 token.
    /// @return The address of the ticket asset.
    function ticket() 
        external
        view
        returns (address);    
}