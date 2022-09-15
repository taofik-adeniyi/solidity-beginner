// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.0;


// import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

// interface AggregatorV3Interface {
//   function decimals() external view returns (uint8);

//   function description() external view returns (string memory);

//   function version() external view returns (uint256);

//   function getRoundData(uint80 _roundId)
//     external
//     view
//     returns (
//       uint80 roundId,
//       int256 answer,
//       uint256 startedAt,
//       uint256 updatedAt,
//       uint80 answeredInRound
//     );

//   function latestRoundData()
//     external
//     view
//     returns (
//       uint80 roundId,
//       int256 answer,
//       uint256 startedAt,
//       uint256 updatedAt,
//       uint80 answeredInRound
//     );
// }

import "../Library/PriceConverter.sol";

contract FundMe {
    uint256 minimumFundAmount = 50 * 1e18;
    address[] funders;
    mapping(address => uint256) public addressToAmountFunded;
    using PriceConverter for uint256;

    address public owner;
    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not the owner");
        _;
    }

    function fund() public payable {
        // require(
        //     getConversionRate(msg.value) >= minimumFundAmount,
        //     "Not enough funds"
        // ); // 1e18 is 1 * 10 ** 18 or 1000000000000000000
        require(
            msg.value.getConversionRate() >= minimumFundAmount,
            "Not enough funds"
        ); // 1e18 is 1 * 10 ** 18 or 1000000000000000000
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] = msg.value;
    }

    function withdraw() public onlyOwner {
        for(uint256 funderIndex = 0; funderIndex < funders.length; funderIndex++){
            address funder = funders[funderIndex];
            addressToAmountFunded[funder] = 0;
        }
        //reset the array
        funders = new address[](0);
        //withdraw funds

        //transfer
        payable(msg.sender).transfer(address(this).balance);
        //send
        bool sendSucess = payable(msg.sender).send(address(this).balance);
        require(sendSucess, "Could not send!");
        // call
        // (bool callSucess, bytes memory dataReturned) = payable(msg.sender).cal{value: adress(this).balance}("");
        (bool callSucess, ) = payable(msg.sender).call{value: address(this).balance}("");
        require(callSucess, "Call failed!");
    }

}
