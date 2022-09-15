// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract SimpleStorage {
    uint256 public favoriteNumber; //this gets initialized to zero
    struct People {
        uint256 favoriteNumber;
        string name;
    }

    People public person = People({favoriteNumber: 23, name: 'taofik'});
    People[] public people; // = People({favoriteNumber:23, name:'lanre'}) People[3] public people;

    function store(uint256 _favoriteNumber)public{
        favoriteNumber = _favoriteNumber;
        // favoriteNumber = _favoriteNumber;
        // favoriteNumber = _favoriteNumber + 6;
        // favoriteNumber = _favoriteNumber + 10;
    }

    function addPerson(uint256 _favoriteNumber, string memory _name)public{
        // People memory newPerson = People({_favoriteNumber,_name});
        people.push(People({favoriteNumber:_favoriteNumber, name:_name}));
        people.push(People(_favoriteNumber, _name));
        // people.push(newPerson)
    }
    // keywrods that notes function that dont spend gas view and pure

    // keywrods that notes function that dont spend gas view and pure
    // view disallows modification of the blockchain. just reads state
    // pure disallows modification of the blockchain but also disallows reading from the blockchain
    function retrieve()public view returns(uint256){
        return favoriteNumber;
    }
    //retrieve() calling this in a function that modifies the blockchain states would cost gas

    //example of pure keyword in a function usgae
    function add() public pure returns(uint256){
        return 1 + 1;
    }

    // six places you can store data in EVM
    // Stack, Memory, Storage, Calldata, Code, Logs

    // calldata and memory means the data is going to exist temporarily
    // storage exist after the function execution
    // calldata variables can not be reassigned after been initiated


    ///mappings
    
}