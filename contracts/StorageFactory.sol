// //SPDX-License-Identifier: MIT
// pragma solidity ^0.8.0;


// contract SimpleStorage {

//     uint256 favoriteNumber;

//     struct People {
//         uint256 favoriteNumber;
//         string name;
//     }
//     // uint256[] public anArray;
//     People[] public people;

//     mapping(string => uint256) public nameToFavoriteNumber;

//     function store(uint256 _favoriteNumber) public virtual {
//         favoriteNumber = _favoriteNumber;
//     }
    
//     function retrieve() public view returns (uint256){
//         return favoriteNumber;
//     }

//     function addPerson(string memory _name, uint256 _favoriteNumber) public {
//         people.push(People(_favoriteNumber, _name));
//         nameToFavoriteNumber[_name] = _favoriteNumber;
//     }
// }

// contract StorageFactory {
//     SimpleStorage public simpleStorage;
//     function createSimpleStorage() public {
//         simpleStorage = new SimpleStorage();
//     }
// }

//SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "./SimpleStorage.sol";

contract StorageFactory {
    // SimpleStorage public simpleStorage;
    SimpleStorage[] public simpleStorageArray;
    function createSimpleStorage() public {
        // simpleStorage = new SimpleStorage();
        SimpleStorage newSimpleStorage = new SimpleStorage();
        simpleStorageArray.push(newSimpleStorage);
    }

    function sfStore(uint256 _simpleStorageIndex, uint256 _simpleStorageNumber)public{
        // SimpleStorage simpleStorage = SimpleStorage(simpleStorageArray[_simpleStorageIndex]);
        SimpleStorage newsimpleStorage = simpleStorageArray[_simpleStorageIndex];
        newsimpleStorage.store(_simpleStorageNumber);
    }

    function sfGet(uint256 _simpleStorageIndex) public view returns(uint256){
        SimpleStorage newSimpleStorage = simpleStorageArray[_simpleStorageIndex];
        return newSimpleStorage.retrieve();
    }
}