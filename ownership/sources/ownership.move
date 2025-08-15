module ownership::ownership {
    // No imports needed as the required modules are in scope by default

    /// An object that is owned by a specific address.
    public struct OwnedObject has key {
        id: UID,
        owner: address,
    }

    /// An object that can be shared and accessed by anyone.
    public struct SharedObject has key {
        id: UID,
        value: u64,
    }

    /// An object that cannot be modified after creation.
    public struct ImmutableObject has key {
        id: UID,
    }

    /// Creates a new OwnedObject and transfers it to the sender.
    public entry fun create_owned_object(ctx: &mut TxContext) {
        let object = OwnedObject {
            id: object::new(ctx),
            owner: ctx.sender(),
        };
        transfer::transfer(object, ctx.sender());
    }

    /// Creates a new SharedObject and shares it.
    public entry fun create_shared_object(ctx: &mut TxContext) {
        let object = SharedObject {
            id: object::new(ctx),
            value: 0,
        };
        transfer::share_object(object);
    }

    /// Creates a new ImmutableObject and freezes it.
    public entry fun create_immutable_object(ctx: &mut TxContext) {
        let object = ImmutableObject {
            id: object::new(ctx),
        };
        transfer::freeze_object(object);
    }
}
