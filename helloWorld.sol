// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

import "./IHelloWorld.sol";

contract HelloWorldInteraction {
    address public helloWorldAddress;

    constructor(address _helloWorldAddress) {
        helloWorldAddress = _helloWorldAddress;
    }

    function getHelloWorldText() public view returns (string memory) {
        IHelloWorld helloWorld = IHelloWorld(helloWorldAddress);
        return helloWorld.helloWorld();
    }

    function updateText(string calldata newText) public {
        IHelloWorld helloWorld = IHelloWorld(helloWorldAddress);
        helloWorld.setText(newText);
    }

    function changeOwner(address newOwner) public {
        IHelloWorld helloWorld = IHelloWorld(helloWorldAddress);
        helloWorld.transferOwnership(newOwner);
    }

    function getCurrentOwner() public view returns (address) {
        IHelloWorld helloWorld = IHelloWorld(helloWorldAddress);
        return helloWorld.owner();
    }
}
