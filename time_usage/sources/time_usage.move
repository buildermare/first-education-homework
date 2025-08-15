module time_usage::time_usage {
    use sui::clock::{Self, Clock};
    use sui::tx_context::{Self, TxContext};

    /// Compares the timestamp from a `Clock` object with the current epoch's start time.
    /// Returns `true` if the clock's timestamp is greater than or equal to the epoch start time.
    public fun compare(clock: &Clock, ctx: &TxContext): bool {
        let clock_timestamp = clock::timestamp_ms(clock);
        let epoch_timestamp = tx_context::epoch_timestamp_ms(ctx);

        clock_timestamp >= epoch_timestamp
    }
}