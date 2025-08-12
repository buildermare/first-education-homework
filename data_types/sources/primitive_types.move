<<<<<<< HEAD
/*
/// Module: primitive_types
module primitive_types::primitive_types;
*/

// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions


=======
module primitive_types::primitive_types {
    use std::string;
    use std::vector;

    public fun show_primitive_types() {
        let _name = string::utf8(b"berk");
        let _age = 22u8;
        let _is_coder = true;

        let mut lessons = vector::empty<string::String>();
        vector::push_back(&mut lessons, string::utf8(b"Move"));
        vector::push_back(&mut lessons, string::utf8(b"Sui"));
    }
}
>>>>>>> 1a246a7 (tüm ödevler tamamlandı)
