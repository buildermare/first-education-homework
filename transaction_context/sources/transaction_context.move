<<<<<<< HEAD

/// Module: transaction_context
module transaction_context::transaction_context;

public fun public_fun(ctx: TxContext){
    let _ = ctx;//TODO
}
=======
module transaction_context::transaction_context {
    use sui::clock::{timestamp_ms, Clock};

    // Clock objesinden milisaniye zaman alır
    public fun get_time(clock: &Clock): u64 {
        timestamp_ms(clock)
    }
}
>>>>>>> 1a246a7 (tüm ödevler tamamlandı)
