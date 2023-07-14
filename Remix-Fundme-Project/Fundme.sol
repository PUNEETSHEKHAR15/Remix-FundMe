// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./PriceConvertor.sol";
// import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol"; => use in Remix
import "./AggregatorV3interface.sol";

error NotOwner();

contract fundMe {
    using PriceConvertorSol for uint256;
    uint256 public constant Minimum_usdAmount = 50 * 1e18;
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    address[] public funders;
    mapping(address => uint256) public AddressToAmount;

    function fundme() public payable {
        require(
            msg.value.GetConversionRate() >= Minimum_usdAmount,
            "Amount entered is not enough"
        );
        funders.push(msg.sender);
        AddressToAmount[msg.sender] += msg.value;
    }

    modifier onlyowner() {
        if (msg.sender != owner) revert NotOwner();
        _;
    }

    function withdraw() public onlyowner {
        for (
            uint256 funderIndex = 0;
            funderIndex < funders.length;
            funderIndex++
        ) {
            address funder = funders[funderIndex];
            AddressToAmount[funder] = 0;
        }
        funders = new address[](0);
        (bool success, ) = payable(msg.sender).call{
            value: address(this).balance
        }("");
        require(success, "call failed");
    }

    // to tranfer amount form outside
    fallback() external payable {
        fundme();
    }

    // executes when call data is not empty or receieve is not present or ethers are sent from outside

    receive() external payable {
        fundme();
    }
}
