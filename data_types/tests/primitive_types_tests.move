<<<<<<< HEAD
/*
#[test_only]
module primitive_types::primitive_types_tests;
// uncomment this line to import the module
// use primitive_types::primitive_types;

const ENotImplemented: u64 = 0;

#[test]
fun test_primitive_types() {
    // pass
}

#[test, expected_failure(abort_code = ::primitive_types::primitive_types_tests::ENotImplemented)]
fun test_primitive_types_fail() {
    abort ENotImplemented
}
*/
=======
#[test_only]
module primitive_types::primitive_types_tests {
    use primitive_types::primitive_types;

    #[test]
    fun test_primitive_types() {
        primitive_types::show_primitive_types()
    }

    const ENotImplemented: u64 = 0;

    #[test, expected_failure(abort_code = ::primitive_types::primitive_types_tests::ENotImplemented)]
    fun test_primitive_types_fail() {
        abort ENotImplemented
    }
}
>>>>>>> 1a246a7 (tüm ödevler tamamlandı)
