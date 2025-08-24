/// Module: transaction_context
module transaction_context::transaction_context;

use sui::tx_context::{Self, TxContext};

/// TxContext'ten epoch başlangıç zamanını milisaniye cinsinden döndürür.
/// Not: bağlamı değiştirmiyoruz, bu yüzden &TxContext yeterli.
public fun epoch_start_ms(ctx: &TxContext): u64 {
    tx_context::epoch_timestamp_ms(ctx)
}

/// İsteğe bağlı: epoch numarasını da döndürmek istersen
public fun epoch_number(ctx: &TxContext): u64 {
    tx_context::epoch(ctx)
}
