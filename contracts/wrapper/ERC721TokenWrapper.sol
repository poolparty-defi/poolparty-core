// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.9;

import {Initializable, OwnableUpgradeable} from "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import {ERC721Upgradeable} from "@openzeppelin/contracts-upgradeable/token/ERC721/ERC721Upgradeable.sol";
import {ERC721URIStorageUpgradeable} from "@openzeppelin/contracts-upgradeable/token/ERC721/extensions/ERC721URIStorageUpgradeable.sol";

contract ERC721TokenWrapper is Initializable, OwnableUpgradeable, ERC721URIStorageUpgradeable {

    function initialize(
        string memory tokenName,
        string memory tokenSymbol,
        string memory tokenUri,
        uint256 tokenId
    )
        public
        initializer
    {
        __Ownable_init();

        __ERC721_init(tokenName, tokenSymbol);
        __ERC721URIStorage_init();
        _setTokenURI(tokenId, tokenUri);
    }

    function _burn(uint256 tokenId) 
        internal 
        override 
    {
        super._burn(tokenId);
    }
}