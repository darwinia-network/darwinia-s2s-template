// SPDX-License-Identifier: MIT

pragma solidity ^0.8.9;

import "@darwinia/contracts-periphery/contracts/s2s/MessageEndpoint.sol";

// On Crab, to Darwinia
contract CrabToDarwiniaEndpoint is MessageEndpoint {
    constructor() {
        outboundLaneId = 0x00000000;
        inboundLaneId = 0x00000000;
        storageAddress = address(1024);
        dispatchAddress = address(1025);
        storageKeyForMarketFee          = 0xe0c938a0fbc88db6078b53e160c7c3ed2edb70953213f33a6ef6b8a5e3ffcab2;
        storageKeyForLatestNonce        = 0xf1501030816118b9129255f5096aa9b296c246acb9b55077390e3ca723a0ca1f;
        storageKeyForLastDeliveredNonce = 0xf1501030816118b9129255f5096aa9b2e5f83cf83f2127eb47afdc35d6e43fab;
        sendMessageCallIndex = 0x3003;
        remoteMessageTransactCallIndex = 0x3001; // darwinia message transact
        remoteSmartChainId = 46; // darwinia smart chain
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