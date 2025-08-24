/// Module: first_smart_contract
module first_smart_contract::first_smart_contract;

use std::string::{Self, String};
use sui::object::{Self, UID};
use sui::tx_context::{Self, TxContext};
use sui::transfer;
use sui::tx_context;

/// Basit bir örnek nesne
public struct Hello has key, store {
    id: UID,
    message: String,
}

/// Paket yayınlandığında bir kez çağrılır.
/// Not: Görsellik için boş bırakıyoruz; gerekirse ilk kurulum yapılabilir.
fun init(_ctx: &mut TxContext) { }

/// Yeni bir Hello nesnesi oluştur ve çağırana transfer et.
/// CLI’dan çağırılabilmesi için entry.
public entry fun create_hello(msg: String, ctx: &mut TxContext) {
    let hello = Hello {
        id: object::new(ctx),
        message: msg,
    };
    transfer::transfer(hello, tx_context::sender(ctx));
}

/// Görsel amaçlı: mesajı oku (zincir üstünde view gibi kullanılır)
public fun message(hello: &Hello): &String {
    &hello.message
}
