// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "./ERC721A.sol";

contract NFTRMdrop is ERC721A, Ownable {
    constructor() ERC721A("SAFECHADDROP", "SAFECHAD105") {
        _safeMint(0x968a547217A2027903b3e45a4AC824E3033f8366, 100);
    }

    function mintNFTtoLottery() external onlyOwner {
        _safeMint(0x968a547217A2027903b3e45a4AC824E3033f8366, 100); //Only works with ERC721 reciever/holder in the case with smart contracts
    }

    function tokenURI(uint256 tokenId) public view override returns (string memory) {
        if (!_exists(tokenId)) _revert(URIQueryForNonexistentToken.selector);

        string memory baseURI = _baseURI();
        return baseURI;
    }

    function _baseURI() internal pure override returns (string memory) {
        return "ipfs://bafyreifobt33nxwz5cj4eqgwit6omqgcxc5lpoicpkzvo7sgwtpb6xpzz4/metadata.json";
    }
}
