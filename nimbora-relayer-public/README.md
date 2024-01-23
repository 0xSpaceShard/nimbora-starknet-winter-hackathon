# Nimbora Relayer

The Nimbora Relayer is a worker service that processes reports from both L1 and L2. After a transaction is accepted on L1, the relayer calls the L1 PoolingManager contract to process the report. Once the transaction is processed on L1, the relayer waits for a message from L1 to L2 to be accepted (this takes a maximum of 3 minutes, it's possible controle the value through ENV var `RELAYER_WARM_TIME_MS`), then it calls the L2 PoolingManager to finalize the report.

The relayer connects to a GraphQL service (Hasura GraphQL engine), which serves as an API to query the Starknet indexed data (PoolingManager and the TokenManager) by the indexer. For more information about the Hasura GraphQL engine, visit [link](https://hasura.io/)

Event data is stored in a Postgres database.

The indexer is a node process that uses [Checkpoint](https://docs.checkpoint.fyi/guides/step-by-step-setup) as an indexing framework. It indexes the Starknet events when the transaction is ACCEPTED_ON_L2.

![architecture](https://github.com/0xSpaceShard/nimbora-hackathon/assets/127413534/6b1cbfde-eb25-49ec-a629-1a160a5d2280)


## Config

Before starting the services, make a copy of the `.env.example` file and rename it to `.env`. Update the environment variables as needed, such as RPC nodes and private keys.

## Run Services

To initiate the services, use the command `make up`. This command will start a Docker compose file containing all necessary services for processing Yield-Dex reports.
The next step is to connect your GraphQL with the database and begin tracking the required data.

0. On your Browser go to the hasura dashboard `http://127.0.0.1:8080/console`
   
1. Click on manage
    
    ![01](https://github.com/0xSpaceShard/nimbora-relayer-public/assets/127413534/e8af3c32-e180-4153-83bd-b768a7790543)

    
2. Select the Postgres database and click on "connect to existing database".
    
    ![02](https://github.com/0xSpaceShard/nimbora-relayer-public/assets/127413534/c7bdb058-677b-4e3c-8c72-c24f55d04d2c)

    
3. Set the `DATABASE_NAME` and `DATABASE_URL`, then click on the database.
    
    ![03](https://github.com/0xSpaceShard/nimbora-relayer-public/assets/127413534/d46d4d05-f623-417b-b398-9f431b2eae2f)

    
4. Monitor all indexed data.
    
    ![05](https://github.com/0xSpaceShard/nimbora-relayer-public/assets/127413534/b43ed5ca-e040-460d-843e-b7ec6ce2e868)

    
5. The relayer will begin processing the reports after 5 minutes.

The relayer will process reportes when the Starknet transction is acepted on L1. This process can take between 8-10 hours.

## Docker Development

You can use the same process to run the relayer in development mode. Use the command `make dev-up` to start a hot-reload, dockerized relayer.

## Vanilla development

### Install

```
yarn
```

## Prometheus metrics

A Prometheuse client 

```
http://0.0.0.0:9000/metric
```
