// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// struct: 结构体 - 类似js中的对象
// array：数组
// mapping：映射 - js中的map

contract HelloWorld {
    string strVar = "Hello World";
    struct Info {
        string phrase;
        uint256 id;
        address addr;
    }

    Info[] infos;

    function sayHello(uint256 _id) public view returns(string memory) {
        for(uint256 i = 0; i < infos.length; i++) {
            if (infos[i].id == _id) {
                return addinfo(infos[i].phrase);
            }
        }
        return addinfo(strVar);
    }

    function setHelloWorld(string memory newString, uint256 _id) public {
        Info memory info = Info(newString, _id, msg.sender);
        infos.push(info);
    }
    /**
        1. storage - 永久
        2. memory - 暂时 - 运行时可以修改 - 复杂类型需要指定，基础类型在函数中会默认
        3. calldata - 暂时，运行时无法更改
        -------------
        4. stack
        5. codes
        6. logs
    */
    function addinfo(string memory helloWorldStr) internal pure returns(string memory) {
        return string.concat(helloWorldStr, " from Frank's contract.");
    }
}
