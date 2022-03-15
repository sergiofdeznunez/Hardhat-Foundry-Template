
pragma solidity 0.8.12;

import "ds-test/test.sol";
import "../contracts/Proxy.sol";

interface CheatCodes {
    function prank(address _from) external;
    function expectRevert(bytes calldata) external;
    function startPrank(address) external;
    function stopPrank() external;
    function assume(bool) external;
}

contract Test is DSTest {

    Proxy proxy;
    CheatCodes cheats = CheatCodes(HEVM_ADDRESS);

    function setUp () public {
        proxy = new Proxy();
    }
    /*
     * ProxyTests
     */
    function testProxy_setLogic_notAdmin(address _address) public {
        cheats.expectRevert(bytes("you're not the proxy admin"));
        cheats.prank(_address);
        proxy.setLogicContract(_address);
    }
    function testProxy_setAdmin_notAdmin(address _address) public {
        cheats.expectRevert(bytes("you're not the proxy admin"));
        cheats.prank(_address);
        proxy.setProxyAdmin(_address);
    }

    function testProxy_setLogic_admin(address _address) public {
        proxy.setLogicContract(_address);
        assertEq(proxy.implementation(), _address);
    }

    function testProxy_setAdmin_admin(address _address) public {
        proxy.setProxyAdmin(_address);
        assertEq(proxy.proxyAdmin(), _address);
    }

}