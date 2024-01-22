#! /bin/bash

cp .env nimbora-relayer-public/.env

cd nimbora-relayer-public && ./setup.sh && cd ..
