// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import "@narya-ai/contracts/NaryaTest.sol";
import "src/Token.sol";

contract ERC20TotalSupplyTest is NaryaTest {
    address owner = address(0x1);
    address agent;

    Token token;
    uint256 totalSupply;

    function setUp() public {
        vm.startPrank(owner);
        token = new Token();
        totalSupply = token.totalSupply();
        vm.stopPrank();

        agent = getAgent();
    }

    function invariantTotalSupplyShouldNeverChange() public view {
        assert(token.totalSupply() == totalSupply);
    }
}
