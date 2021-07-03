## Build a Full Stack Decentralized Application Step-By-Step

[Tutorial Link](https://www.dappuniversity.com/articles/the-ultimate-ethereum-dapp-tutorial)

### Compile & Deploy Election Smart Contract

```
truffle migrate
truffle migrate --reset
```

### Truffle console

```
truffle console
```

### Get app, candidates & accounts

```
PS C:\SOLIDITY\DappUniversity\election2021> truffle console
truffle(development)> Election.deployed().then(function(instance){ app = instance })
undefined
truffle(development)> app.address
'0xc52852544C5364CEf6090e754c917a5C32C0Bc4E'
truffle(development)> app.candidate()
'First Candidate'

truffle(development)> app.candidates(1).then(function(c) { candidate = c; })
undefined
truffle(development)> candidate[0].toNumber()
1
truffle(development)> candidate[1]
'Candidate 1'
truffle(development)> candidate[2].toNumber()
1

truffle(development)> web3.eth.getAccounts().then(function(acc){ accounts = acc })
undefined
truffle(development)> accounts[0]
'0x2cB14881404FEB1ed733F7229073a2388aA95cbF'

truffle(development)> app.vote(1, { from: accounts[0] })
{
  tx: '0x3cba620e243dffe5455e6de640396a36a7c638af3cdf515b552802ef907cf3ac',
  receipt: {
    transactionHash: '0x3cba620e243dffe5455e6de640396a36a7c638af3cdf515b552802ef907cf3ac',
    transactionIndex: 0,
    blockNumber: 121,
    from: '0x2cb14881404feb1ed733f7229073a2388aa95cbf',
    to: '0x569764ae9c7d063d4767ca849aacd625e9b3a489',
    cumulativeGasUsed: 66244,
    contractAddress: null,
    logs: [ [Object] ],
    status: true,
    logsBloom: '0x00000...',
    rawLogs: [ [Object] ]
  },
  logs: [
    {
      logIndex: 0,
      transactionIndex: 0,
      transactionHash: '0x3cba620e243dffe5455e6de640396a36a7c638af3cdf515b552802ef907cf3ac',
      blockHash: '0x88f9a538ec1b49de53f460a5705883091cc385f8ac21ab4abba70728f27979a0',
      blockNumber: 121,
      address: '0x569764AE9C7d063D4767ca849AACd625E9b3A489',
      type: 'mined',
      id: 'log_d4b3f4b5',
      event: 'votedEvent',
      args: [Result]
    }
  ]
}


```

### Run the Front End Application

```
npm run dev
```
