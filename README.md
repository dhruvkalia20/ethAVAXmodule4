# Degen token creation using ERC20 for gaming.

This Solidity program is a simple "ERC20 token creation" program that demonstrates the basic functionality of the exchange of tokens for Degen gaming using Avalanche Blockchain. The purpose of this program is to serve as a starting point for those who are currently exchanging and redeeming tokens in Degen games.

## Description

This program is a simple contract written in Solidity, a programming language used for developing smart contracts on the Ethereum blockchain.Under this we are creating a ERC20 token named Degen and symbol is DGN which is used as game token in Degen gaming .We are creating some functions under the smart contract ,The DegenToken contract inherits functionalities from several OpenZeppelin contracts, including ERC20, Ownable, and ERC20Burnable. It allows the contract owner to mint new tokens, and token holders can transfer their tokens to other addresses. Additionally, tokens can be burned, reducing the total supply.
Functionality
constructor: The constructor function sets the name and symbol of the token during deployment.

1. mint: The mint function allows the contract owner to create new tokens and send them to a specified address. Only the contract owner can call this function.

2. transfer: The standard ERC-20 transfer function to send tokens from the sender's address to a specified recipient.

3. redeem: The redeem function allows token holders to burn their tokens, effectively reducing the total supply. The tokens are permanently destroyed, and the balance of the sender will decrease accordingly and also console.log will print the given statement if the burn function executes successfully.

4. currentbalance: This function allows anyone to query the balance of DGN tokens for a specific address.

5. approval: The standard ERC-20 approval function to allow a spender to spend tokens on behalf of the sender.

6. burn: This function allows token holders to burn their tokens similar to the redeem function. The only difference is that it doesn't have an external visibility, so it can only be called internally from other functions in the contract.
## Getting Started

### Executing program

To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.

Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension (e.g., module4.sol). Copy and paste the following code into the file:

```solidity

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "hardhat/console.sol";

contract DegenToken is ERC20, Ownable {

    constructor() ERC20("Degen", "DGN") {}

        function mint(address _to, uint256 _value) public onlyOwner {
            _mint(_to, _value);
    }
    function transfer(address _to,uint _value)public override returns(bool){
         _transfer(msg.sender,_to,_value);
         return true;
    }
    function redeem(uint _value )external{
        _burn(msg.sender,_value);
        console.log("The amount of tokens redeemed successfully are: " ,_value);
    }
    function currentbalance(address _address)external view returns(uint){
        return balanceOf(_address);
    }
    function approval(address _spender,uint tokens)public returns(bool){
       _approve(msg.sender,_spender,tokens);
       return true;
    }
    function burn(uint _value)external{
      _burn(msg.sender,_value);
    }
}


```

To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to "0.8.4" (or another compatible version), and then click on the "Compile module.sol" button.

Once the code is compiled, you can deploy the contract Firstly we have to select the environment which we select as metamask,then we have to deploy our contract and we have to confirm the transaction request on our metamask wallet.

Once the contract is deployed, you can interact with it by calling the the mint ,transfer , approve , burn , checkbalance and redeem functions.

Then we can also check the transaaction status on snowtrace account just by entering the account address on it.

## Authors

Dhruv Kalia
Metacrafter-dhruv_kalia_20


## License

This project is licensed under the MIT License .
