<<<<<<< HEAD
/*
#[test_only]
module functions::functions_tests;
// uncomment this line to import the module
// use functions::functions;

const ENotImplemented: u64 = 0;

#[test]
fun test_functions() {
    // pass
}

#[test, expected_failure(abort_code = ::functions::functions_tests::ENotImplemented)]
fun test_functions_fail() {
    abort ENotImplemented
}
*/
=======
#[test_only]
module functions::functions_tests {
    use functions::functions;
    use std::option;
    use std::string;

    const ENotImplemented: u64 = 0;

    #[test]
    fun test_functions() {
        let total = functions::sum(10, 5);
        assert!(total == 15, 101);

        let hello = functions::say_hello(option::none<string::String>());
        assert!(string::utf8(b"Hi") == hello, 102);

        let is_odd = functions::check(7);
        assert!(is_odd == true, 103);

        let is_even = functions::check(8);
        assert!(is_even == false, 104);
    }

    #[test, expected_failure(abort_code = ::functions::functions_tests::ENotImplemented)]
    fun test_functions_fail() {
        abort ENotImplemented
    }
}
>>>>>>> 1a246a7 (tüm ödevler tamamlandı)
