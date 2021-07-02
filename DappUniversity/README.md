# SOLIDITY

## Youtube

[Solidity Tutorial](https://www.youtube.com/watch?v=ipwxYa-F1uY)

[MASTER Solidity](https://www.youtube.com/watch?v=YJ-D1RMI0T0)

[Ethereum Dapp](https://www.youtube.com/watch?v=3681ZYbDSSk)

## Node.js LTS

```
sudo apt update
sudo apt install nodejs npm
node -v
sudo npm install -g n // version manager
sudo n lts // install LongTermSupport version
```

## Truffle Dapp Framework

```
sudo npm install -g truffle
```

#### Start Truffle Project

```
truffle unbox pet-shop
```

#### Contract Migration

```
truffle migrate
```

#### Truffle Console

```
truffle console
PS C:\SOLIDITY\DappUniversity\election2021> truffle console
truffle(development)> Election.deployed().then(function(instance){ app = instance })
undefined
truffle(development)> app.address
'0xc52852544C5364CEf6090e754c917a5C32C0Bc4E'
truffle(development)> app.candidate()
'First Candidate'
truffle(development)>
```
