#[test_only]
module build::build_tests {
    // uncomment this line to import the module
    use build::build;

    const ENotImplemented: u64 = 0;

    #[test]
    fun test_build() {
        // pass
    }

    #[test, expected_failure(abort_code = ENotImplemented)]
    fun test_build_fail() {
        abort ENotImplemented
    }
}