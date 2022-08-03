// SPDX-License-Identifier: MIT

pragma solidity ^0.8.9;

import "@darwinia/contracts-periphery/contracts/s2s/MessageEndpoint.sol";

// On Darwinia, to Crab
contract DarwiniaToCrabEndpoint is MessageEndpoint {
    constructor() {
        outboundLaneId = 0x00000000;
        inboundLaneId = 0x00000000;
        storageAddress = address(1024);
        dispatchAddress = address(1025);
        storageKeyForMarketFee          = 0x190d00dd4103825c78f55e5b5dbf8bfe2edb70953213f33a6ef6b8a5e3ffcab2;
        storageKeyForLatestNonce        = 0xf4e61b17ce395203fe0f3c53a0d3986096c246acb9b55077390e3ca723a0ca1f;
        storageKeyForLastDeliveredNonce = 0xf4e61b17ce395203fe0f3c53a0d39860e5f83cf83f2127eb47afdc35d6e43fab;
        sendMessageCallIndex = 0x2c03;
        remoteMessageTransactCallIndex = 0x2801; // crab message transact
        remoteSmartChainId = 44; // crab smart chain
    }

    function _canBeExecuted(address, bytes calldata)
        internal
        pure
        override
        returns (bool)
    {
        return true;
    }

    function setRemoteEndpoint(bytes4 _remoteChainId, address _remoteEndpoint)
        external
    {
        _setRemoteEndpoint(_remoteChainId, _remoteEndpoint);
    }

    function remoteDispatch(
        uint32 pangoroSpecVersion,
        bytes memory pangoroCallEncoded,
        uint64 pangoroCallWeight
    ) external payable returns (uint256) {
        return
            _remoteDispatch(
                pangoroSpecVersion,
                pangoroCallEncoded,
                pangoroCallWeight
            );
    }

    function remoteExecute(
        uint32 pangoroSpecVersion,
        address callReceiver,
        bytes calldata callPayload,
        uint256 gasLimit
    ) external payable returns (uint256) {
        return
            _remoteExecute(
                pangoroSpecVersion,
                callReceiver,
                callPayload,
                gasLimit
            );
    }

    function setOutboundLaneId(bytes4 _outboundLaneId) external {
        _setOutboundLaneId(_outboundLaneId);
    }

    function setRemoteMessageTransactCallIndex(
        bytes2 _remoteMessageTransactCallIndex
    ) external {
        _setRemoteMessageTransactCallIndex(_remoteMessageTransactCallIndex);
    }

    function setStorageAddress(address _storageAddress) external {
        _setStorageAddress(_storageAddress);
    }

    function setDispatchAddress(address _dispatchAddress) external {
        _setDispatchAddress(_dispatchAddress);
    }

    function setSendMessageCallIndex(bytes2 _sendMessageCallIndex) external {
        _setSendMessageCallIndex(_sendMessageCallIndex);
    }

    function setStorageKeyForMarketFee(bytes32 _storageKeyForMarketFee)
        external
    {
        _setStorageKeyForMarketFee(_storageKeyForMarketFee);
    }

    function setStorageKeyForLatestNonce(bytes32 _storageKeyForLatestNonce)
        external
    {
        _setStorageKeyForLatestNonce(_storageKeyForLatestNonce);
    }

    function setRemoteWeightPerGas(uint64 _remoteWeightPerGas) external {
        _setRemoteWeightPerGas(_remoteWeightPerGas);
    }

    function setInboundLaneId(bytes4 _inboundLaneId) external {
        _setInboundLaneId(_inboundLaneId);
    }

    function setRemoteSmartChainId(uint64 _remoteSmartChainId) external {
        _setRemoteSmartChainId(_remoteSmartChainId);
    }

    function setStorageKeyForLastDeliveredNonce(
        bytes32 _storageKeyForLastDeliveredNonce
    ) external {
        _setStorageKeyForLastDeliveredNonce(_storageKeyForLastDeliveredNonce);
    }
}