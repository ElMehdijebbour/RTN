// SPDX-License-Identifier: MIT
pragma solidity ^0.8.11;
import 'https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol';
contract RToken is ERC20 {
    address admin;
    constructor () ERC20 ('RToken','RTN'){
        _mint(msg.sender,10000 * 10 ** 18) ;
        admin = msg.sender;
    }
    function mint( address to ,uint amount) external {
        require(msg.sender==admin,'only admin');
        _mint(to,amount);
    }
    function reward(address to,uint amount) external {
        require(admin == msg.sender, "transfer failed because you are not the owner."); // 
        _transfer(msg.sender,to,amount);
    }
    
}