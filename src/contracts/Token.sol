pragma solidity ^0.6.0;

/// @title A mintable ERC20 token with time constraints
/// @author Frances Juniper Hansen
/// @notice Mintable token with time constraints based on an Auto depecate design pattern.
/// @dev Currently; Time constraints _endTime & _startTime may only be deployed in valid epoch unix format. 

import "@openzeppelin/contracts/access/AccessControl.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Token is ERC20, AccessControl {
    bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");
    uint256 private startTime;
    uint256 private endTime;

    modifier whenOpen() {
        require(now > startTime && now <= endTime,
        "Window is closed");
        _;
    }

    constructor(uint _startTime, uint _endTime) public ERC20("TOKEN","TKN") {
       _setupRole(MINTER_ROLE, msg.sender);
        require(_startTime > now, "invalid start time. ST must be greater than current time");
        require(_endTime > _startTime, "invalid endTime. ET must be greater than ST.");
        require(_endTime > _startTime + 1 days, "invalid endTime. ET must be greater than ST + 1 days");
        startTime = _startTime;
        endTime = _endTime;
    }

    function mint(address to, uint256 amount) public whenOpen {
        require(hasRole(MINTER_ROLE, msg.sender), "Caller must have minter role");
        _mint(to, amount);
    }

    function isWindowOpen() public view returns(bool) {
        return now > startTime && now <= endTime;
    }

    function starttime() public view returns(uint) {
        return startTime;
    }

    function endtime() public view returns(uint) {
        return endTime;
    }

    function transfer(address recipient, uint256 amount) public override whenOpen returns(bool){
        require(super.transfer(recipient, amount), "error for transfer");
    }
}