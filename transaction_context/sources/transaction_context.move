module transaction_context::transaction_context {
    // No imports needed as the required modules are in scope by default

    /// An object to store a timestamp.
    public struct TimestampObject has key, store {
        id: UID,
        timestamp_ms: u64,
    }

    /// Creates a new TimestampObject with the current epoch's start time.
    public entry fun create_timestamp_object(ctx: &mut TxContext) {
        let timestamp_ms = tx_context::epoch_timestamp_ms(ctx);

        let object = TimestampObject {
            id: object::new(ctx),
            timestamp_ms: timestamp_ms,
        };

        transfer::public_transfer(object, ctx.sender());
    }
}
