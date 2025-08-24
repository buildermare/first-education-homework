/// Module: ownership
module ownership::ownership;

use std::string::{Self, String};
use sui::object::{Self, UID};
use sui::tx_context::{Self, TxContext};
use sui::transfer;
use sui::tx_context;

/// Örnek nesne: üç farklı sahiplik senaryosu için aynı veri yapısı
public struct Note has key, store {
    id: UID,
    text: String,
}

/// 1) Address-owned (single owner) nesne üret ve çağırana transfer et
/// - Bu, varsayılan “tek sahip” modelidir: oluşturulan obje işlem imzalayan adrese aittir.
public entry fun create_owned(text: String, ctx: &mut TxContext) {
    let note = Note { id: object::new(ctx), text };
    transfer::transfer(note, tx_context::sender(ctx));
}

/// 2) Shared nesne oluşturma
/// - Obje oluşturulur ve ardından paylaşılır (shared state).
public entry fun create_shared(text: String, ctx: &mut TxContext) {
    let note = Note { id: object::new(ctx), text };
    transfer::share_object(note);
}

/// 3) Immutable (frozen) nesne oluşturma
/// - Obje oluşturulur ve immutable yapılır; artık değiştirilemez/taşınamaz.
public entry fun create_immutable(text: String, ctx: &mut TxContext) {
    let note = Note { id: object::new(ctx), text };
    transfer::freeze_object(note);
}

/// Yardımcı (view benzeri): içeriği oku
public fun text(n: &Note): &String {
    &n.text
}
