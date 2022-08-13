// We require the Hardhat Runtime Environment explicitly here. This is optional
// but useful for running the script in a standalone fashion through `node <script>`.
//
// You can also run a script with `npx hardhat run <script>`. If you do that, Hardhat
// will compile your contracts, add the Hardhat Runtime Environment's members to the
// global scope, and execute the script.
process.env.HARDHAT_NETWORK = "pangolin"
const hre = require("hardhat");

// on pangoro, set pangolin endpoint
async function main() {
    const endpoint_address = process.argv[2]
    const remote_endpoint_address = process.argv[3]
    const PangolinToPangoroEndpoint = await hre.ethers.getContractFactory("PangolinToPangoroEndpoint");
    const endpoint = await PangolinToPangoroEndpoint.attach(endpoint_address);
    await endpoint.setRemoteEndpoint("0x70616772", remote_endpoint_address);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
});