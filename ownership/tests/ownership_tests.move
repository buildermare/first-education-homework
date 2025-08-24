#[test_only]
module ownership::ownership_tests;
// uncomment this line to import the module
use ownership::ownership;

const ENotImplemented: u64 = 0;

#[test]
fun test_ownership() {
    // pass
}

#[test, expected_failure(abort_code = ::ownership::ownership_tests::ENotImplemented)]
fun test_ownership_fail() {
    abort ENotImplemented
}
