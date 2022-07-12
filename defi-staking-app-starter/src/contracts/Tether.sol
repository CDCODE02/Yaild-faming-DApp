pragma solidity ^0.8.0;

contract Tether {
    string public name = "MyTether";
    string public symbol = "MUSDT";
    uint256 public totalSupply = 1000000000000000000000000; // 1 million tokens
    uint8 public decimals = 18;
    
    event Transfer(
        address indexed _from,
        address indexed _to,
        uint ls_value
    );

    event Approval(
        address indexed _owner,
        address indexed _spender,
        uint _value
    );

    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256)) public allowance;

    constructor() public {
        balanceOf[msg.sender] = totalSupply;
    }

    function transfer(address _to, uint256 _value) public returns (bool success) {
        // require that the value is greater or equal for transfer
        require(balanceOf[msg.sender] >= _value);
        // transfer the amount and subtract the balence 
        balanceOf[msg.sender] -= _value;
        // add the balence to receivers account
        balanceOf[_to] += _value;
        emit Transfer(msg.sender, _to, _value);
        return true;
    }

    function Approve(address _spender, uint256 _value) public returns (bool success) {
        allowance[msg.sender] [_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;  
    }

    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        require(_value <= balanceOf[_from]);
        require(_value <= allowance[_from] [msg.sender]);
        // add the balence for transferFrom
        balanceOf[_to] += _value;
        // subtract the balence for transferFrom
        balanceOf[_from] -= _value;
        allowance[msg.sender][_from] -= _value;
        emit Transfer(_from, _to, _value);
        return true;
    }

}