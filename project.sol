// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StudentFees {

    struct Student {
        uint256 balance;
        bool hasPaid;
    }

    
    mapping(address => Student) public students;

    
    event FeePaid(address indexed student, uint256 amount);

    
    function payFees() public payable {
        require(msg.value > 0, "Payment must be greater than zero.");
        
        Student storage student = students[msg.sender];
        student.balance += msg.value;
        student.hasPaid = true;
        
        emit FeePaid(msg.sender, msg.value);
    }

    function getPaymentStatus(address studentAddress) public view returns (bool) {
        return students[studentAddress].hasPaid;
    }

    function getStudentBalance(address studentAddress) public view returns (uint256) {
        return students[studentAddress].balance;
    }
}

