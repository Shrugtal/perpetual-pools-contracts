/* Autogenerated file. Do not edit manually. */
/* tslint:disable */
/* eslint-disable */

import { Contract, Signer, utils } from "ethers";
import { Provider } from "@ethersproject/providers";
import type {
  IOracleWrapper,
  IOracleWrapperInterface,
} from "../IOracleWrapper";

const _abi = [
  {
    inputs: [
      {
        internalType: "string",
        name: "marketCode",
        type: "string",
      },
      {
        internalType: "address",
        name: "oracle",
        type: "address",
      },
    ],
    name: "getPrice",
    outputs: [
      {
        internalType: "int256",
        name: "price",
        type: "int256",
      },
      {
        internalType: "uint256",
        name: "timestamp",
        type: "uint256",
      },
    ],
    stateMutability: "nonpayable",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "string",
        name: "marketCode",
        type: "string",
      },
      {
        internalType: "address",
        name: "oracle",
        type: "address",
      },
    ],
    name: "setOracle",
    outputs: [],
    stateMutability: "nonpayable",
    type: "function",
  },
];

export class IOracleWrapper__factory {
  static readonly abi = _abi;
  static createInterface(): IOracleWrapperInterface {
    return new utils.Interface(_abi) as IOracleWrapperInterface;
  }
  static connect(
    address: string,
    signerOrProvider: Signer | Provider
  ): IOracleWrapper {
    return new Contract(address, _abi, signerOrProvider) as IOracleWrapper;
  }
}
