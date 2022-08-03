// SPDX-License-Identifier: MIT

pragma solidity ^0.8.9;

import "./PangoroToPangolinEndpoint.sol";

// Call Pangolin.callee.add(2) from Pangoro
contract Caller {
    address public endpoint;

    constructor(address _endpoint) {
        endpoint = _endpoint;
    }

    function remoteAdd(address callee) external payable returns (uint256) {
        uint256 messageId = PangoroToPangolinEndpoint(endpoint).remoteExecute(
            28140, // latest spec version of pangolin
            callee,
            hex"1003e2d20000000000000000000000000000000000000000000000000000000000000002", // add(2)
            120000 // gas limit
        );

        return messageId;
    }
}