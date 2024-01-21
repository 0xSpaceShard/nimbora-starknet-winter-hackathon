cd nimbora-yield-l1-public && setup.sh && cd ..
cd nimbora-yield-l1-public && cp config.json nimbora-yield-l2-public/l1-config.json
cd nimbora-yield-l2-public && setup.sh
cd nimbora-relayer-public && docker-compose up -d && cd ..
