<<<<<<< HEAD
/// Module: build
module build::build;

// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions

fun init(ctx: &mut TxContext) {
    let _ = ctx;
}

fun init_with_capability(ctx: &mut TxContext, capability: &mut Capability) {
    let _ = ctx;
    let _ = capability;
=======
module build::build {
    use sui::tx_context::TxContext;
    use capability::capability::WorkshopCapability;

    /// Dummy init fonksiyonu
    fun init(ctx: &mut TxContext) {
        let _ = ctx;
    }

    /// Capability parametresi alan fonksiyon
    fun init_with_capability(ctx: &mut TxContext, capability: &mut WorkshopCapability) {
        let _ = ctx;
        let _ = capability;
    }
>>>>>>> 1a246a7 (tüm ödevler tamamlandı)
}
