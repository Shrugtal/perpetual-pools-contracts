// SPDX-License-Identifier: MIT
pragma solidity ^0.7.6;
pragma abicoder v2;

import "../interfaces/IOracleWrapper.sol";
import "@openzeppelin/contracts/access/AccessControl.sol";
import "@chainlink/contracts/src/v0.7/interfaces/AggregatorV2V3Interface.sol";

/*
@title The oracle management contract
*/
contract OracleWrapper is IOracleWrapper, AccessControl {
  // #### Globals
  /**
  @notice Format: Market code => oracle address. Market code looks like TSLA/USD+aDAI
   */
  mapping(string => address) public assetOracles;
  // #### Roles
  /**
  @notice Use the Operator role to restrict access to the setOracle function
   */
  bytes32 public constant OPERATOR = keccak256("OPERATOR");
  bytes32 public constant ADMIN = keccak256("ADMIN");

  // #### Functions
  constructor() {
    _setupRole(ADMIN, msg.sender);
    _setRoleAdmin(OPERATOR, ADMIN);
  }

  function setOracle(string memory marketCode, address oracle)
    external
    override
    onlyOperator
  {
    assetOracles[marketCode] = oracle;
  }

  function getPrice(string memory marketCode, address oracle)
    external
    override
    returns (int256 price, uint256 timestamp)
  {
    (, price, , timestamp, ) = AggregatorV2V3Interface(assetOracles[marketCode])
      .latestRoundData();
  }

  // #### Modifiers
  modifier onlyOperator {
    require(hasRole(OPERATOR, msg.sender));
    _;
  }
}
