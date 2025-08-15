module visibility::visibility {
    // No imports needed as the required modules are in scope by default

    /// A simple counter object.
    public struct Counter has key, store {
        id: UID,
        value: u64,
    }

    // --- Private Function ---
    /// Increments the counter's value. Can only be called from within this module.
    fun increment_internal(counter: &mut Counter) {
        counter.value = counter.value + 1;
    }

    // --- Public Function ---
    /// Gets the current value of the counter. Can be called by other modules.
    public fun get_value(counter: &Counter): u64 {
        counter.value
    }

    // --- Entry Function ---
    /// Creates a new counter, increments it, and transfers it to the sender.
    /// Can be called directly as a transaction.
    public entry fun create_and_increment(ctx: &mut TxContext) {
        let mut counter = Counter {
            id: object::new(ctx),
            value: 0,
        };

        // Call the private function.
        increment_internal(&mut counter);

        transfer::public_transfer(counter, ctx.sender());
    }

    #[test]
    fun test_visibility() {
        use sui::test_scenario;

        let mut scenario = test_scenario::begin(@0x0);
        let ctx = test_scenario::ctx(&mut scenario);

        let mut counter = Counter {
            id: object::new(ctx),
            value: 5,
        };

        // Test the private function
        increment_internal(&mut counter);
        assert!(counter.value == 6, 0);

        // Test the public function
        assert!(get_value(&counter) == 6, 1);

        // Consume the counter to satisfy the drop checker.
        let Counter { id, value: _ } = counter;
        object::delete(id);

        test_scenario::end(scenario);
    }
}