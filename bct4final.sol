// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.7.0 <0.9.0;

contract MarksManagmtSys {
    struct StudentStruct {
        uint ID;
        string fName;
        string lName;
        uint marks;
    }

    address public owner;
    uint public stdCount = 0;
    StudentStruct[] public stdRecords;

    constructor() {
        owner = msg.sender;
    }

    function addNewRecords(uint _ID, string memory _fName, string memory _lName, uint _marks) public payable {
        // Increase the count by 1
        stdCount = stdCount + 1;
        
        // Adding data into the array
        stdRecords.push(StudentStruct(_ID, _fName, _lName, _marks));
    }

    function getAllRecords() public view returns (StudentStruct[] memory) {
        return stdRecords;
    }
// Fallback function for handling Ether transfers with data
    fallback() external payable {
        revert("Fallback function not allowed");
    }

    // Receive function for handling direct Ether transfers
    receive() external payable {
        revert("Receive function not allowed");
    }
}