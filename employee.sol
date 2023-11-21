// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

contract Empdata{
    struct EmpStruct{
        uint ID;
        string fname;
        string lname;
        uint salary;
    }

    address public owner;
    uint public empCount=0;
    EmpStruct[] public empRecords;

    constructor(){
        owner=msg.sender;
    }

    function addnewrecords(uint _ID,string memory _fname,string memory _lname,uint _salary)public payable{
        empCount=empCount+1;

        empRecords.push(EmpStruct(_ID,_fname,_lname,_salary));

    }

    function getallrecords()public view returns(EmpStruct[] memory){
        return empRecords;
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