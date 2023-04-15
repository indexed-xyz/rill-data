# indexed.xyz + Rill Data: Smart Contract Analysis

This repository is a smart contract analysis tool powered by [indexed.xyz](https://indexed.xyz) and [Rill Data](https://docs.rilldata.com/), making web3 events more accessible by combining a public data source with a beautiful, interactive dashboard that can be edited and enriched using SQL.

This script does several things on your behalf:
- installs Rill.
- clones this repo.
- replaces the smart contract variables in this repo with one of your choice, limiting the data download to your specified contract.
- rehydrates your Rill project locally, creating everything you need from data to editable dashboard.
- an indexed.xyz + Rill dashboard for your smart contract is available at http://localhost:9009. 🎉

## Try indexed.xyz + Rill Data

To get started, run the script below with the smart contract you are interested in as the argument:
```
curl -s https://cdn.rilldata.com/indexed-xyz.sh | bash -s <your contract> 43c31ff797ec2387177cabab6d18f15a afb354f05026f2512557922974e9dd2fdb21e5c2f5cbf929b35f0645fb284cf7
``` 

*The initial script may take a while depending on your network connection as it downloads some large remote data files.*


## Example

This example downloads [Art Blocks](https://www.artblocks.io/) smart contract events (contract: [0xa7d8d9ef8d8ce8992df33d8b8cf4aebabd5bd270](https://etherscan.io/address/0xa7d8d9ef8d8ce8992df33d8b8cf4aebabd5bd270)):
```
curl -s https://cdn.rilldata.com/indexed-xyz.sh | bash -s 0xa7d8d9ef8D8Ce8992Df33D8b8CF4Aebabd5bD270 43c31ff797ec2387177cabab6d18f15a afb354f05026f2512557922974e9dd2fdb21e5c2f5cbf929b35f0645fb284cf7
```

You can learn more about how to transform this generalizable default dashboard to something that more menaingful for a specific contract on Rill Data's [blog post](https://rilldata.com/indexed-xyz).


## About

indexed.xyz is a public, CC0-licensed decoded blockchain dataset for anyone to download and use openly. indexed.xyz is a community-led effort to make understanding and building in the blockchain space easier. For more information, visit [indexed.xyz](https://indexed.xyz) or contact us at [contact@indexed.xyz](mailto:contact@indexed.xyz).
