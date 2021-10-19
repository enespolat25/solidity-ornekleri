// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.4;

contract CryptoToken{
    mapping(address=>uint) public balances;
    address public minter;
    event Sent(address from,address to,uint amount);

    constructor(){
        minter=msg.sender;
    }
    
    function mint(address receiver,uint amount) public{
        require(msg.sender==minter);
        balances[receiver]+=amount;
    }
    
    function send(address receiver, uint amount) public{
        balances[msg.sender]-=amount;
        balances[receiver]+=amount;
        emit Sent(msg.sender,receiver,amount);
        
    }
}
