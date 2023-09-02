// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ContractManager {
    // Mapping to store the user type (student or sponsor) for each address
    mapping(address => string) public userType;

    // Mapping to check if an address is registered
    mapping(address => bool) public isRegistered;

    // Event to log user registration
    event UserRegistered(address indexed user, string userType);

    // Function to register whether a user is a student or sponsor
    function registration(string memory user) external {
        require(bytes(user).length > 0, "User type must not be empty");
        require(!isRegistered[msg.sender], "User already registered");

        userType[msg.sender] = user;
        isRegistered[msg.sender] = true;

        emit UserRegistered(msg.sender, user);
    }

    // Function to check if a user is registered and get their type
    function isUserRegistered(address user) external view returns (bool) {
        return (isRegistered[user] == true? true : false);
    }

    // Function to check if an address is registered and get the user type
    function isUserType(address userAddress) external view returns (bool, string memory) {
        // bool registered = isRegistered[userAddress];
        // string memory typeOfUser = userType[userAddress];
        // return (registered, typeOfUser);
        return (isRegistered[userAddress] == true? (true,userType[userAddress]) : (false,"User not registered"));
    }

}
