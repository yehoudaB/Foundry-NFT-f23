// SPDX-Licence-Identifier: MIT

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Encoding {
    function concatStrings() public pure returns (string memory) {
        return string(abi.encodePacked("Hello the ", "answome world"));
    }

    function encodeNumber() public pure returns (bytes memory) {
        bytes memory number = abi.encode(1);
        return number;
    }

    function encodeString() public pure returns (bytes memory) {
        return abi.encode("hello guys");
    }

    function encodePackedString() public pure returns (bytes memory) {
        return abi.encodePacked("hello guys");
    }

    function encodeStringBytes() public pure returns (bytes memory) {
        return bytes("hello guys");
    }

    function decodeString() public pure returns (string memory) {
        return abi.decode(encodeString(), (string));
    }

    function multiEncode() public pure returns (bytes memory) {
        return abi.encode("some string", "it's bigger!");
    }

    function multiDecode() public pure returns (string memory, string memory) {
        (string memory string1, string memory string2) = abi.decode(
            multiEncode(),
            (string, string)
        );
        return (string1, string2);
    }

    function multiEncodePacked() public pure returns (bytes memory) {
        return abi.encodePacked("some string", "it's bigger!");
    }

    function multiDecodePacked()
        public
        pure
        returns (string memory, string memory)
    {
        (string memory string1, string memory string2) = abi.decode(
            multiEncodePacked(),
            (string, string)
        );
        return (string1, string2);
    }

    function multiStringCastPacked() public pure returns (string memory) {
        return string(multiEncodePacked());
    }
}
