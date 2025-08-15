# Sui Move Workshop: Challenge Solutions

This document provides a high-level overview of the solutions for each challenge in the Sui Move workshop. Each section corresponds to a directory in the project.

---

## Build Challenge

Fixed the build error in the `build` package.

The main issue was a missing dependency on the `capability` module and an incorrect type definition in the `build.move` file.

To fix this, I:
1. Added a dependency on the `capability` module in `build/Move.toml`.
2. Corrected the type of the `capability` parameter in the `init_with_capability` function in `build/sources/build.move`.
3. Fixed the `capability` module itself, which had a commented-out module declaration and an incomplete `WorkshopCapability` struct.
4. Addressed compiler warnings related to unused mutable references.

---

## Capability Challenge

Completed the capability challenge by implementing a simple workshop system.

- **`WorkshopCapability`**: A struct representing the permission to modify a workshop.
- **`Workshop`**: A struct that holds the workshop's lessons in a vector.
- **`create_workshop`**: An entry function to create a new `Workshop` object.
- **`add_lesson`**: An entry function that allows the holder of a `WorkshopCapability` to add a lesson to a `Workshop`.

The code was also cleaned up to remove unnecessary `use` statements, resulting in a clean build with no warnings.

---

## Data Types Challenge

Completed the data types challenge by creating a `Developer` struct to demonstrate the use of various data types.

- **`Developer`**: A struct containing fields for `name` (String), `age` (u8), `is_coder` (bool), and `lessons` (vector<String>).
- **`create_developer`**: An entry function that initializes a `Developer` object with sample data and transfers it to the user.

This approach provides a more structured and practical example of using data types in Move. The code was also cleaned up to remove unnecessary `use` statements, resulting in a clean build with no warnings.

---

## First Smart Contract Challenge

Completed the first smart contract challenge by creating a simple Move module that defines a `MyObject` struct and an entry function to create and transfer it.

- **`MyObject`**: A simple struct with a `u64` value.
- **`create`**: An entry function that initializes a `MyObejct` with a value of 42 and transfers it to the user.

This provides a basic "hello world" example of a Sui smart contract. The code was also cleaned up to remove unnecessary `use` statements, resulting in a clean build with no warnings.

---

## Functions Challenge

Completed the functions challenge by implementing three simple functions:

- **`sum`**: Takes two `u64` numbers and returns their sum.
- **`say_hello`**: Returns the string "Hi".
- **`is_odd`**: Takes a `u64` number and returns `true` if it's odd, `false` otherwise.

A test function was also included to verify the correctness of these functions.

---

## Ownership Challenge

Completed the ownership challenge by demonstrating three different ownership patterns in Sui:

- **`OwnedObject`**: A simple object that is owned by a specific address.
- **`SharedObject`**: An object that is shared and can be accessed by anyone.
- **`ImmutableObject`**: An object that cannot be modified after its creation.

Entry functions were created for each type to demonstrate how they are created and transferred or shared.

---

## Test Coin Challenge

Completed the test coin challenge by creating a module that defines a new currency called "Workshop Coin".

- **`TEST_COIN`**: The one-time witness for the coin.
- **`init`**: The module initializer that creates the currency and transfers the `TreasuryCap` and `CoinMetadata` to the publisher, allowing them to mint new coins.

This solution follows the variable-supply coin pattern, as indicated by the reference solution.

---

## Test NFT Challenge

Completed the test NFT challenge by implementing a robust NFT module.

- **`WorkshopNFT`**: The main NFT struct, which includes a `creator` field to track the original minter.
- **Creator-Only Actions**: The `update_description` and `burn` functions are restricted to the NFT's original creator, adding a layer of security.
- **Full Lifecycle**: The module includes functions for minting, transferring, updating, and burning the NFT.

---

## Testing Challenge

Completed the testing challenge by implementing `sum` and `compare` functions and writing unit tests to verify their correctness.

- **`sum`**: Adds two `u64` numbers.
- **`compare`**: Checks two `u64` numbers for equality.
- **Unit Tests**: Wrote multiple tests, including a `#[expected_failure]` test, to ensure the functions behave as expected under different conditions.

---

## Time Usage Challenge

Completed the time usage challenge by implementing a `compare` function.

- **`compare`**: Takes a `Clock` object and a `TxContext` and returns `true` if the clock's timestamp is greater than or equal to the epoch's start timestamp.

---

## Transaction Context Challenge

Completed the transaction context challenge by implementing a function that utilizes the `TxContext`.

- **`TimestampObject`**: A struct to store a `u64` timestamp.
- **`create_timestamp_object`**: An entry function that gets the current epoch's start time in milliseconds from the `TxContext`, creates a `TimestampObject` with it, and transfers it to the sender.

---

## Visibility Challenge

Completed the visibility challenge by demonstrating the three types of function visibility in Move.

- **Private Function**: An `increment_internal` function that can only be called from within the same module.
- **Public Function**: A `get_value` function that can be called by other modules.
- **Entry Function**: A `create_and_increment` function that can be called directly as a transaction.

A test was included to verify the internal and public functions.
