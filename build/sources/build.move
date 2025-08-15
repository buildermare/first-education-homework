/// Module: build
module build::build;


use capability::capability::WorkshopCapability;

// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions

fun init(ctx: & TxContext) {
    let _ = ctx;
}

fun init_with_capability(ctx: & TxContext, capability: & WorkshopCapability) {
    let _ = ctx;
    let _ = capability;
}
