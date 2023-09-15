// SPDX-Licence-Identifier: MIT

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract CallAnything {
    address public s_someAddress;
    uint256 public s_someAmount;

    function transfer(address someAddress, uint256 someAmount) public {
        s_someAddress = someAddress;
        s_someAmount = someAmount;
    }

    function getSelectorOne() public pure returns (bytes4 selector) {
        selector = bytes4(keccak256(bytes("transfer(address,uint256)")));
    }

    function getDataToCallTransfer(
        address someAddress,
        uint256 someAmount
    ) public pure returns (bytes memory) {
        return
            abi.encodeWithSelector(getSelectorOne(), someAddress, someAmount);
    }

    function callTransferWithBinaries(
        address someAddress,
        uint256 someAmount
    ) public returns (bytes4, bool) {
        (bool success, bytes memory returnData) = address(this).call(
            abi.encodeWithSelector(getSelectorOne(), someAddress, someAmount)
        );
        // (bool success, bytes memory returnData) = address(this).call(getDataToCallTransfer( address someAddress , uint256 someAmount)); // same as previous
        return (bytes4(returnData), success);
    }

    function callTransferWithSignature(
        address someAddress,
        uint256 someAmount
    ) public returns (bytes4, bool) {
        (bool success, bytes memory returnData) = address(this).call(
            abi.encodeWithSignature(
                "transfer(address,uint256)",
                someAddress,
                someAmount
            )
        );
        return (bytes4(returnData), success);
    }
}
