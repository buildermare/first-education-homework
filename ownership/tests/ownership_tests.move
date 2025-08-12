<<<<<<< HEAD
/*
#[test_only]
module ownership::ownership_tests;
// uncomment this line to import the module
// use ownership::ownership;

const ENotImplemented: u64 = 0;

#[test]
fun test_ownership() {
    // pass
}

#[test, expected_failure(abort_code = ::ownership::ownership_tests::ENotImplemented)]
fun test_ownership_fail() {
    abort ENotImplemented
}
*/
=======
#[test_only]
module ownership::ownership_tests {
    use ownership::ownership;
    use sui::tx_context::TxContext;

    const ENotImplemented: u64 = 0;

    #[test]
    fun test_ownership(ctx: &mut TxContext) {
        ownership::create_owned(ctx);
        ownership::create_object_owned(ctx);
    }

    #[test, expected_failure(abort_code = ::ownership::ownership_tests::ENotImplemented)]
    fun test_ownership_fail() {
        abort ENotImplemented;
    }
}
>>>>>>> 1a246a7 (tüm ödevler tamamlandı)
