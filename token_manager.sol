pragma solidity ^0.8.0;

contract Token {
    address public owner;
    mapping(address => uint256) public balances;

    event Transfer(address indexed from, address indexed to, uint256 amount);

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can perform this action");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    function transfer(address _to, uint256 _amount) public onlyOwner {
        require(balances[owner] >= _amount, "Insufficient balance");
        require(_to != address(0), "Invalid recipient address");

        balances[owner] -= _amount;
        balances[_to] += _amount;
        emit Transfer(owner, _to, _amount);
    }

    function mint(address _to, uint256 _amount) public onlyOwner {
        require(_to != address(0), "Invalid recipient address");
        balances[_to] += _amount;
    }

}
function mint(address _to, uint256 _amount) public onlyOwner {
        require(_to != address(0), "Invalid recipient address");
        balances[_to] += _amount;
    }