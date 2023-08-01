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
