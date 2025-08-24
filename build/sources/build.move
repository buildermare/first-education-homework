/// Module: build
module build::build;

use sui::object::{Self, UID};
use sui::tx_context::TxContext;
use sui::transfer;
use sui::tx_context;

// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions

/// Modül içinde kullanılacak örnek capability
struct AdminCapability has key {
    id: UID
}

/// Paket yayınlandığında bir kez çağrılır.
fun init(ctx: &mut TxContext) {
    // Örnek: capability'yi modül yayıncısına transfer et
    transfer::transfer(
        AdminCapability { id: object::new(ctx) },
        tx_context::sender(ctx)
    )
}

/// Örnek: sahipliği gerektiren bir fonksiyon imzası
/// (Gerçekte çağırmadan önce caller’ın AdminCapability sahibi olduğunu ispatlaması gerekir)
fun init_with_capability(_ctx: &mut TxContext, _cap: &mut AdminCapability) {
    // no-op
}

// Açıklamalar:
	// •	AdminCapability struct’ı tanımlandı ve init içinde bir kez üretilip modül yayıncısına verildi .
	// •	init_with_capability fonksiyonunda Capability yerine AdminCapability kullanıldı .
	// •	Gerekli import’lar eklendi: object::UID/new, tx_context::TxContext/sender, transfer::transfer .

// ---------------------------------------------------------------------

/* /// Module: build
module build::build;

use sui::tx_context::TxContext;

// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions

fun init(ctx: &mut TxContext) {
    let _ = ctx;
} */

// Bu sürüm “sui move build” ile derlenir, “sui move test” ile testler koşar.
// İsteğe bağlı: capability kullanılmayacaksa bu fonksiyon ya silinmeli
// ya da anlamlı bir parametre ile güncellenmeli. Burada kaldırıyoruz.
// fun init_with_capability(ctx: &mut TxContext, capability: &mut Capability) { ... }

// ------------------------------------------------------------------------

// Sorunlar ve nedenleri
	// 1.	Sui türleri import edilmemiş
	// •	init ve init_with_capability fonksiyonları TxContext ve Capability kullanıyor ancak std/sui framework’ten import yok. Sui’de bu türler genelde şu modüllerden gelir:
	// •	TxContext: sui::tx_context::TxContext
	// •	Capability: Kendi modülünde tanımlanmadıysa Sui framework’te generic bir “Capability” tipi yok; genelde “capability pattern” için kendi capability struct’ını tanımlamak gerekir .
	// 2.	init fonksiyonunun görünürlüğü ve imzası
	// •	Sui Move’da modül yayınlandığında bir kez çağrılan özel initializer fonksiyonunun imzası fun init(ctx: &mut TxContext) şeklindedir; görünürlük belirtmez (public/entry olmaz) ve sadece ctx alır. Bu doğru; fakat içe aktarmadan TxContext kullanımı derlenmez. Ayrıca init içinde en azından ctx kullanılmalı veya underscore ile atama yapılmalı; siz let _ = ctx; demişsiniz, bu kabul edilir, ama bağlam için import şart .
	// 3.	Capability tipi tanımsız
	// •	init_with_capability(ctx: &mut TxContext, capability: &mut Capability) içinde Capability isimli bir tip kullanılmak istenmiş ama tanımlı değil. Sui’de yaygın desen, modül içinde struct …Capability has key { id: UID } gibi bir yetenek (cap) objesi tanımlamaktır . Alternatifi, parametreyi kaldırmaktır.