// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "src/callback/Dao.sol";
import "@narya-ai/contracts/NaryaTest.sol";

contract DAOTest is NaryaTest {
    DAO dao;

    address user = address(0x1);
    uint256 user_eth_amount = 1 ether;
    uint256 agent_eth_amount = 100000 wei;

    address agent;

    function setUp() public {
        dao = new DAO();

        hoax(user, user_eth_amount);
        dao.deposit{value: user_eth_amount}(user);

        agent = getAgent();
        hoax(agent, agent_eth_amount);
        dao.deposit{value: agent_eth_amount}(agent);
    }

    function invariantBalanceLowerLimit() public view {
        // INVARAINT:
        // The vault should always have at least 1 ether.
        // Otherwise, user cannot get the fund back.
        require(address(dao).balance >= 1 ether);
    }
}
