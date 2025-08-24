#[test_only]
module visibility::visibility_tests;
// uncomment this line to import the module
use visibility::visibility;

const ENotImplemented: u64 = 0;

#[test]
fun test_visibility() {
    // pass
}

#[test, expected_failure(abort_code = ::visibility::visibility_tests::ENotImplemented)]
fun test_visibility_fail() {
    abort ENotImplemented
}
