// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

contract customersys{
    struct custStruct{
        uint ID;
        string fname;
        string lname;
        string productname;
        uint bill;

    }
    address public owner;
    uint public custCount=0;
    custStruct[] public custRecords;

    constructor(){
        owner=msg.sender;
    }

    function addrecords(uint _ID,string memory _fname,string memory _lname,string memory _productname,uint _bill)public payable{
        custCount= custCount+1;

        custRecords.push(custStruct(_ID,_fname,_lname,_productname,_bill));
    }

    function getallrecords()public view returns(custStruct[] memory){
        return custRecords;
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