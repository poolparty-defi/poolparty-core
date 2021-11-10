// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.9;

import {Initializable, OwnableUpgradeable} from "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import {ERC20Upgradeable} from "@openzeppelin/contracts-upgradeable/token/ERC20/ERC20Upgradeable.sol";

contract PoolPartyEntryTicket is Initializable, OwnableUpgradeable, ERC20Upgradeable {

    function initialize()
        public
        initializer
    {
        __Ownable_init();
        __ERC20_init("Pool Party Ticket", "pTICKET");
    }

    

}