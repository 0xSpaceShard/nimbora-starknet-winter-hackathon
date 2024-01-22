#! /bin/bash
touch .env

source .env

cd nimbora-yields-l1-public && ./setup.sh && cd ..
cp nimbora-yields-l1-public/configs.json ./nimbora-yields-l2-public/l1-configs.json
cd nimbora-yields-l2-public && ./setup.sh && cd ..
cp nimbora-yields-l2-public/configs.json ./nimbora-yields-l1-public/l2-configs.json
cd nimbora-yields-l1-public && ./config.sh && cd ..