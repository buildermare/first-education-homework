#[test_only]
module transaction_context::transaction_context_tests {
    use transaction_context::transaction_context;
    use sui::tx_context::TxContext;

    #[test]
    fun test_epoch_start_ms(ctx: &TxContext) {
        let ms = transaction_context::epoch_start_ms(ctx);
        // Sadece “sıfırdan büyük” gibi basit bir doğrulama yapılabilir.
        assert!(ms > 0, 0);
    }
}