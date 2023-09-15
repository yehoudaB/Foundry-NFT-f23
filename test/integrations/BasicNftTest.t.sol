// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {BasicNft} from "../../src/BasicNft.sol";
import {Test, console} from "forge-std/Test.sol";
import {DeployBasicNft} from "script/DeployBasicNft.s.sol";

contract BasicNftTest is Test {
    BasicNft public basicNft;
    DeployBasicNft public deployer;
    address public USER = makeAddr("user");
    string constant PUG =
        "ipfs://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json";

    function setUp() public {
        deployer = new DeployBasicNft();
        basicNft = deployer.run();
    }

    function testNameIscorrect() public view {
        string memory expectedName = "Dogie";
        string memory actualName = basicNft.name();
        assert(
            keccak256(abi.encodePacked(expectedName)) ==
                keccak256(abi.encodePacked(actualName))
        );
    }

    function testCanMintAndHaveABalance() public {
        vm.prank(USER);
        basicNft.mintNft(PUG);
        uint256 expectedBalance = 1;
        assert(basicNft.balanceOf(USER) == expectedBalance);
        assert(
            keccak256(abi.encodePacked(PUG)) ==
                keccak256(abi.encodePacked(basicNft.tokenURI(0)))
        );
    }
}
