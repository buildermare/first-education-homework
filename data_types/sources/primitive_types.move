/// Module: primitive_types
module primitive_types::primitive_types;

use std::string::{Self, String};
use std::vector;

/// Basit bir örnek fonksiyon: temel türlerle let kullanımı
public fun make_profile(): (String, u64, bool, vector<String>) {
    // name: String
    let name: String = string::utf8(b"Baris");

    // age: u64
    let age: u64 = 27;

    // is_coder: bool
    let is_coder: bool = true;

    // lessons: vector<String>
    let mut lessons: vector<String> = vector::empty<String>();
    vector::push_back(&mut lessons, string::utf8(b"Move Intro"));
    vector::push_back(&mut lessons, string::utf8(b"Ownership"));
    vector::push_back(&mut lessons, string::utf8(b"Capabilities"));

    (name, age, is_coder, lessons)
}

/// Görsel amaçlı: ders sayısını döndürür
public fun lessons_len(lessons: &vector<String>): u64 {
    vector::length<String>(lessons)
}
