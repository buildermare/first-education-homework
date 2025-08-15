module functions::functions {
    use std::string::{Self, String};

    /// Adds two u64 numbers and returns the result.
    public fun sum(a: u64, b: u64): u64 {
        a + b
    }

    /// Returns a "Hi" string.
    public fun say_hello(): String {
        string::utf8(b"Hi")
    }

    /// Checks if a u64 number is odd.
    public fun is_odd(num: u64): bool {
        num % 2 != 0
    }

    #[test]
    fun test_functions() {
        assert!(sum(2, 3) == 5, 0);
        assert!(say_hello() == string::utf8(b"Hi"), 1);
        assert!(is_odd(3) == true, 2);
        assert!(is_odd(4) == false, 3);
    }
}