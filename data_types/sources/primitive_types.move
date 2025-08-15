module primitive_types::primitive_types {
    use std::string::{Self, String};

    /// A struct to hold developer information
    public struct Developer has key, store {
        id: UID,
        name: String,
        age: u8,
        is_coder: bool,
        lessons: vector<String>
    }

    /// An entry function to create a new Developer object and transfer it.
    public entry fun create_developer(ctx: &mut TxContext) {
        let name = string::utf8(b"BuilderMare");
        let age = 25;
        let is_coder = true;
        let mut lessons = vector::empty<String>();
        vector::push_back(&mut lessons, string::utf8(b"Move"));
        vector::push_back(&mut lessons, string::utf8(b"Rust"));

        let developer = Developer {
            id: object::new(ctx),
            name: name,
            age: age,
            is_coder: is_coder,
            lessons: lessons
        };

        transfer::transfer(developer, ctx.sender());
    }
}