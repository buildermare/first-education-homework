#[test_only]
module time_usage::time_usage_tests {
    use time_usage::time_usage;
    use sui::tx_context::TxContext;
    use sui::clock::{Self, Clock};

    #[test]
    fun test_time_usage_basic(ctx: &TxContext, clock: &Clock) {
        // Test ortamı Clock ve TxContext sağlar. Varsayılan olarak
        // epoch_start_ms <= now_ms olacağı için true bekleriz.
        let ok = time_usage::compare(ctx, clock);
        assert!(ok, 0);
    }

    // Not: Clock değerini manipüle etmek istersen test-only yardımcılar gerekir.
    // Bazı ortamlarda sui::clock::increment_for_testing mevcut olabilir.
}