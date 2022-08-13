#!/bin/zsh

# source chain: pangoro
echo "On Pangoro:"
local pangoro_endpoint="$(node ./scripts/deploy_pangoro_endpoint.js)"
echo " endpoint: $pangoro_endpoint"
local caller="$(node ./scripts/deploy_caller_to_pangoro.js $pangoro_endpoint)"
echo "   caller: $caller\n"

# target chain: pangolin
echo "On Pangolin:"
local pangolin_endpoint="$(node ./scripts/deploy_pangolin_endpoint.js)"
echo " endpoint: $pangolin_endpoint"
local callee="$(node ./scripts/deploy_callee_to_pangolin.js)"
echo "   callee: $callee\n"

echo "Link endpoints:"
echo " pangoro.set(pangolin) ..."
node ./scripts/set_remote_endpoint_on_pangoro.js $pangoro_endpoint $pangolin_endpoint
echo " pangolin.set(pangoro) ..."
node ./scripts/set_remote_endpoint_on_pangolin.js $pangolin_endpoint $pangoro_endpoint

echo "\nInvoke caller.remoteAdd:"
local txhash="$(node ./scripts/remote_add.js $caller $callee)"
echo " txhash: $txhash"