// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Test, console} from "forge-std/Test.sol";
import {DeployMoodNft} from "../../script/DeployMoodNft.s.sol";

contract DeployMoodNftTest is Test {
    DeployMoodNft public deployer;

    function setUp() public {
        deployer = new DeployMoodNft();
    }

    function testConvertSvgToUri() public view {
        string
            memory expectedURI = "data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjEwMCIgd2lkdGg9IjEwMCI+ICA8Y2lyY2xlIGN4PSI1MCIgY3k9IjUwIiByPSI0MCIgc3Ryb2tlPSJibGFjayIgc3Ryb2tlLXdpZHRoPSIzIiBmaWxsPSJyZWQiIC8+ICBTb3JyeSwgeW91ciBicm93c2VyIGRvZXMgbm90IHN1cHBvcnQgaW5saW5lIFNWRy4gIDwvc3ZnPiA=";
        string
            memory svg = '<svg height="100" width="100">  <circle cx="50" cy="50" r="40" stroke="black" stroke-width="3" fill="red" />  Sorry, your browser does not support inline SVG.  </svg> ';
        string memory actualURI = deployer.svgToImageURI(svg);
        console.log("actualURI :", actualURI);
        console.log("expectedURI :", expectedURI);
        assert(
            keccak256(abi.encodePacked(expectedURI)) ==
                keccak256(abi.encodePacked(actualURI))
        );
    }
}
