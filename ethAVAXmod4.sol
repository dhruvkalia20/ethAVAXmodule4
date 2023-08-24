// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "hardhat/console.sol";

contract DegenToken is ERC20, Ownable {

    constructor() ERC20("Dhruv", "DHR") {}

        function mint(address _to, uint256 _value) public onlyOwner {
            _mint(_to, _value);
    }
    function transfer(address _to,uint _value)public override returns(bool){
         _transfer(msg.sender,_to,_value);
         return true;
    }
    function redeem_PUBG(uint _input)external payable returns(bool)
    { 
      require(_input<=3&&_input>0,"Please Enter the input between 1 to 3");
      if(_input==1){
          require(this.balanceOf(msg.sender)>=100,"Not enough token to buy the outfit");
          approve(msg.sender,100);
          transferFrom(msg.sender,owner(),100);

          return true;
      }
      else if(_input==2)
      {
          require(this.balanceOf(msg.sender)>=200,"The gun crate cannot be opened as unsufficient balance");
          approve(msg.sender,200);
          return true;
      }
      else{
          require(this.balanceOf(msg.sender)>=500,"Unsufficient Tokens for X-suit");
          approve(msg.sender,500);
          return true;
      }
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
