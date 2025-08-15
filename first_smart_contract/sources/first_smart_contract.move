module first_smart_contract::first_smart_contract {
    // No imports needed as the required modules are in scope by default
    
    /// A simple object with a u64 value
    public struct MyObject has key {
        id: UID,
        value: u64
    }

    /// An entry function to create a new MyObject and transfer it.
    public entry fun create(ctx: &mut TxContext) {
        let my_object = MyObject {
            id: object::new(ctx),
            value: 42
        };

        transfer::transfer(my_object, ctx.sender());
    }
}