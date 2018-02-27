pragma solidity ^0.4.18;

contract Owned {
    address owner;

    function Owned() public {
        owner = msg.sender;
    }

    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }
}

contract Passions is Owned{

    struct Passionate {
        uint passionsNumber;
        bytes16 firstName;
        bytes16 lastName;
    }

    mapping (address => Passionate) passionates;
    address[] public passionatesAccounts;

    event passionateInfo(
        bytes16 firstName,
        bytes16 lastName,
        uint passionsNumber
    );

    function setPassionate(address _address, uint _passionsNumber, bytes16 _firstName, bytes16 _lastName) onlyOwner public {
        var passionate = passionates[_address];
        passionate.passionsNumber = _passionsNumber;
        passionate.firstName = _firstName;
        passionate.lastName = _lastName;

        passionatesAccounts.push(_address) -1;
        passionateInfo(_firstName, _lastName, _passionsNumber);
    }

    function getPassionates() view public returns(address[]) {
        return passionatesAccounts;
    }

    function getPassionate(address _address) view public returns (uint, bytes16, bytes16) {
        return (passionates[_address].passionsNumber, passionates[_address].firstName, passionates[_address].lastName);
    }

    function countPassionates() view public returns (uint) {
        return passionatesAccounts.length;
    }

}
