module testing::testing {

    /// Adds two u64 numbers.
    public fun sum(a: u64, b: u64): u64 {
        a + b
    }

    /// Compares two u64 numbers for equality.
    public fun compare(a: u64, b: u64): bool {
        a == b
    }

    #[test]
    fun test_sum() {
        assert!(sum(2, 2) == 4, 0);
        assert!(sum(0, 0) == 0, 1);
        assert!(sum(100, 200) == 300, 2);
    }

    #[test]
    fun test_compare() {
        assert!(compare(5, 5) == true, 0);
        assert!(compare(5, 6) == false, 1);
        assert!(compare(0, 0) == true, 2);
    }

    #[test]
    #[expected_failure]
    fun test_sum_failure() {
        // This test is expected to fail, demonstrating failure testing.
        assert!(sum(2, 2) == 5, 0);
    }
}