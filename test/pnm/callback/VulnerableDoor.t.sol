// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Notice that if target contract uses hardhat console
// it could conflict with our Agent contract's console.
// You have two options:
// 1. Use our console version everywhere
// 2. Use explicit symbol import here like `import {Symbol} from "contract";`
import {VulnerableDoor} from "src/callback/VulnerableDoor.sol";
import "@narya-ai/contracts/NaryaTest.sol";

contract VulnerableDoorTest is NaryaTest {
    VulnerableDoor target;

    function setUp() public {
        target = new VulnerableDoor();
    }

    function invariantNotStolen() public view {
        require(!target.stolen(), "stolen");
    }
}
