<<<<<<< HEAD
/*
/// Module: first_smart_contract
module first_smart_contract::first_smart_contract;
*/

// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions


=======
module first_smart_contract::first_smart_contract {
    use sui::object::UID;
    use sui::tx_context::{TxContext, sender};
    use sui::object;
    use sui::transfer;

    public struct MyObject has key {
        id: UID,
        value: u64,
    }

    public entry fun create(ctx: &mut TxContext) {
        let id = object::new(ctx);
        let obj = MyObject {
            id,
            value: 42,
        };
        transfer::transfer(obj, sender(ctx));
    }
}
>>>>>>> 1a246a7 (tüm ödevler tamamlandı)
