// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ProductInventory {
    // Structure to represent a Product
    struct Product {
        string name;
        uint256 quantity;
        uint256 price;
    }

    // Mapping to store product inventory
    mapping(string => Product) public products;

    // Event to log product-related events
    event ProductReceived(string name, uint256 quantity, uint256 price);
    event ProductSold(string name, uint256 quantity, uint256 totalPrice);
    event StockDisplayed(string name, uint256 quantity);

    // Function to receive products
    function receiveProduct(string memory _name, uint256 _quantity, uint256 _price) public {
        require(_quantity > 0, "Quantity must be greater than zero");
        require(_price > 0, "Price must be greater than zero");

        // Check if the product already exists
        if (products[_name].quantity == 0) {
            products[_name] = Product(_name, _quantity, _price);
        } else {
            // Increment quantity if the product already exists
            products[_name].quantity += _quantity;
        }

        // Emit event
        emit ProductReceived(_name, _quantity, _price);
    }

    // Function to sell products
    function sellProduct(string memory _name, uint256 _quantity) public {
        require(products[_name].quantity >= _quantity, "Not enough stock available");

        // Deduct sold quantity from inventory
        products[_name].quantity -= _quantity;

        // Calculate total price
        uint256 totalPrice = _quantity * products[_name].price;

        // Emit event
        emit ProductSold(_name, _quantity, totalPrice);
    }

    // Function to display stock
    function displayStock(string memory _name) public view returns (uint256) {
        return products[_name].quantity;
    }
}
