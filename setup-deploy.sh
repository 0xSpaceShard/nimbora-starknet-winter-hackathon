#! /bin/bash

cp .env nimbora-yields-l1-public/.env

cd nimbora-yields-l1-public && ./setup.sh && cd ..
cp nimbora-yields-l1-public/configs.json ./nimbora-yields-l2-public/l1-configs.json
cd nimbora-yields-l2-public && ./setup.sh && cd ..
cp nimbora-yields-l2-public/configs.json ./nimbora-yields-l1-public/l2-configs.json
cd nimbora-yields-l1-public && ./config.sh && cd ..

# Set ENVs
l1PoolingManager=$(cat nimbora-yields-l1-public/configs.json | jq -r .${NETWORK}.l1PoolingManager)
echo export YIELD_DEX_L1_POOLING_MANAGER=$l1PoolingManager >> .env

l2PoolingManager=$(cat nimbora-yields-l2-public/configs.json | jq -r .${NETWORK}.l2PoolingManager)
echo export YIELD_DEX_L2_POOLING_MANAGER=$l2PoolingManager >> .env
