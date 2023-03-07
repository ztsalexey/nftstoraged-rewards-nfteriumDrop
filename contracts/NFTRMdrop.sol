// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "./ERC721A.sol";


contract NFTRMdrop is ERC721A, Ownable {

   constructor() ERC721A("NFTRMdrop", "NFTRMdrop") {

    _safeMint(msg.sender, 10);

   }

   function mintNFTtoLottery()
       external onlyOwner
   {
       _safeMint(0xD2a2F9e753F5ab137A60906Ad40C89b947562Ce6, 10); //Only works with ERC721 reciever/holder in the case with smart contracts
   }

   function tokenURI(uint256 tokenId) public view override returns (string memory) {
        if (!_exists(tokenId)) _revert(URIQueryForNonexistentToken.selector);

        string memory baseURI = _baseURI();
        return baseURI;
    }

    function _baseURI() internal pure override returns (string memory) {
        return "ipfs://bafyreiasvow4x3zftfl4o3bytenjpoof425hvbknhvz3yfuzk7idtyqkoa/metadata.json";
    }
}