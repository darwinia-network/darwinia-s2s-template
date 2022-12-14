# Darwinia S2S Template Project

This project demonstrates a basic Darwinia Substrate-based messaging SDK use case. The use case shows how to call a smart contract function on Pangolin from Pangoro. It comes with 4 contracts. 

* Endpoint contract on Pangoro. [PangoroToPangolinEndpoint.sol](./contracts/PangoroToPangolinEndpoint.sol)
* Caller contract on Pangoro. [Caller.sol](./contracts/Caller.sol)
* Endpoint on Pangolin. [PangolinToPangoroEndpoint.sol](./contracts/PangolinToPangoroEndpoint.sol)
* Callee contract on Pangolin. [Callee.sol](./contracts/Callee.sol)

## Run

1. Set private keys

    ```bash
    cp .env_sample .env
    ```
    Set your private keys

2. Run scripts

    ```bash
    ./scripts/run.sh
    ```
