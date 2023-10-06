// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import "@narya-ai/contracts/NaryaTest.sol";
import "src/Token.sol";
import "src/Vault.sol";

contract ERC4626RedeemTest is NaryaTest {
    address owner = address(0x1);
    address alice = address(0x927);
    address agent;

    uint256 amount = 1;

    Vault vault;

    function setUp() public {
        vm.startPrank(owner);
        Token token = new Token();
        vault = new Vault(token);
        token.transfer(alice, 50);
        vm.stopPrank();

        vm.prank(alice);
        vault.mint(1, alice);

        agent = getAgent();
    }

    function invariantRedeem() external {
        assert(vault.maxRedeem(alice) == amount);
        vault.redeem(amount, alice, alice);
        assert(vault.maxRedeem(alice) == 0);
    }
}
