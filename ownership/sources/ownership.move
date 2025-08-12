<<<<<<< HEAD
/// Module: ownership
module ownership::ownership;
=======
module ownership::ownership {
    use sui::object::UID;
    use sui::object;
    use sui::transfer;
    use sui::tx_context::{TxContext, sender};

    // Owned object – transfer edilir
    public struct OwnedObj has key {
        id: UID,
        data: u64,
    }

    /// Immutable object – değiştirilemez (sadece örnek, deploy'da özel işlem gerekir)
    public struct ImmutableObj has key {
        id: UID,
        info: u64,
    }

    /// ObjectOwned: iç içe struct
    public struct ParentObj has key {
        id: UID,
        child: ChildObj,
    }

    public struct ChildObj has store {
        value: u64,
    }

    // Basit bir owned obje oluşturur ve kullanıcıya gönderir
    public entry fun create_owned(ctx: &mut TxContext) {
        let id = object::new(ctx);
        let obj = OwnedObj { id, data: 42 };
        transfer::transfer(obj, sender(ctx));
    }

    // Object-owned örnek – bir obje içinde başka obje
    public entry fun create_object_owned(ctx: &mut TxContext) {
        let id = object::new(ctx);
        let child = ChildObj { value: 7 };
        let parent = ParentObj { id, child };
        transfer::transfer(parent, sender(ctx));
    }

    // Immutable ve Shared türleri normal `entry` fonksiyonla yaratılmaz, testte simüle edilir
}
>>>>>>> 1a246a7 (tüm ödevler tamamlandı)
