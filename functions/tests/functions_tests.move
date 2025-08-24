#[test_only]
module functions::functions_tests {
    use std::string;
    use functions::functions;

    #[test]
    fun test_sum() {
        assert!(functions::sum(2, 3) == 5, 1);
        assert!(functions::sum(0, 0) == 0, 2);
    }

    #[test]
    fun test_say_hello() {
        let hi = functions::say_hello();
        assert!(string::length(&hi) == 2, 3); // "Hi"

        let name = string::utf8(b"Baris");
        let msg = functions::say_hello_to(&name);
        // "Hi, " + "Baris" = length 4 + 5 = 9 (Hi,␣ = 4)
        assert!(string::length(&msg) == 9, 4);
    }

    #[test]
    fun test_is_odd() {
        assert!(functions::is_odd(1), 5);
        assert!(!functions::is_odd(2), 6);
        assert!(functions::is_odd(101), 7);
    }
}
