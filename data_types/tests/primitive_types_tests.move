#[test_only]
module primitive_types::primitive_types_tests {
    use primitive_types::primitive_types;
    use std::string;

    #[test]
    fun test_primitive_types() {
        let (name, age, is_coder, lessons) = primitive_types::make_profile();

        // name en az 1 karakter
        assert!(string::length(&name) > 0, 1);

        // yaş kontrolü
        assert!(age >= 0, 2);

        // coder bayrağı
        assert!(is_coder, 3);

        // ders sayısı 3 olmalı
        assert!(primitive_types::lessons_len(&lessons) == 3, 4);
    }

    const ENotImplemented: u64 = 0;

    #[test, expected_failure(abort_code = ENotImplemented)]
    fun test_primitive_types_fail() {
        abort ENotImplemented
    }
}
