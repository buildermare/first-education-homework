/// Module: visibility
module visibility::visibility;

use std::string::{Self, String};
use sui::tx_context::{Self, TxContext};
use sui::object::{Self, UID};
use sui::transfer;
use sui::tx_context;

// private: varsayılan görünürlük; yalnızca bu modül içinden erişilir
fun private_fun(): u64 {
    42
}

// public: tüm modüller çağırabilir
public fun public_fun(): String {
    // private fonksiyon modül içinden erişilebilir
    let n = private_fun();
    // örnek bir çıktı üretelim
    let prefix = string::utf8(b"Answer: ");
    // n sayısını stringe çevirmek için hızlıca manuel bir örnek (gerçekte helper yazılabilir)
    // burada sadece sabit bir mesaj dönüyor olacağız, amaç görünürlüğü göstermek
    prefix
}

// entry: işlemlerden/CLI'dan doğrudan çağrılabilir.
// entry fonksiyonlar genelde yan etki yapar, değer döndürmez.
public entry fun entry_fun(ctx: &mut TxContext) {
    // Örnek: entry içinden owned bir obje oluşturup gönderelim
    let obj = Sample { id: object::new(ctx) };
    transfer::transfer(obj, tx_context::sender(ctx));
}

// Örnek bir owned obje (entry örneğini tamamlamak için)
struct Sample has key {
    id: UID
}
