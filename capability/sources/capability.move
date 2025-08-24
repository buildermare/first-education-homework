/// Module: capability
module capability::capability;

use std::string::{Self, String};
use std::vector;
use sui::object::{Self, UID};
use sui::tx_context::{Self, TxContext};
use sui::transfer;

/// Bir atölyeyi yönetmeye (ders eklemek vb.) izin veren yetenek.
/// key yeteneği ile bu nesne bir Object olarak zincirde tutulur ve
/// sahibine transfer edilebilir.
struct WorkshopCapability has key {
    id: UID
}

/// Atölye nesnesi: ders adlarını tutar.
public struct Workshop has key, store {
    id: UID,
    workshop_lessons: vector<String>,
}

/// 1) Atölyeyi oluştur ve capability üret.
/// - Yeni bir Workshop objesi döndürür.
/// - WorkshopCapability’yi modül yayıncısına/sender’a transfer eder.
/// Not: Kapasiteyi bir hesapta tutarak daha sonra admin-only işlemleri yetkilendirebiliriz.
public fun create_workshop(ctx: &mut TxContext): Workshop {
    // Yeni capability üret ve çağırana (sender) transfer et
    let cap = WorkshopCapability { id: object::new(ctx) };
    transfer::transfer(cap, tx_context::sender(ctx));

    // Boş ders listesiyle Workshop oluştur
    Workshop {
        id: object::new(ctx),
        workshop_lessons: vector::empty<String>(),
    }
}

/// 3) Sadece capability sahibi ders ekleyebilir
/// - cap: WorkshopCapability’e sahip olan kullanıcının geçmesi gerekir
/// - w: hedef Workshop üzerinde değişiklik yapar
/// - name: eklenecek ders ismi
public fun add_lesson(_cap: &WorkshopCapability, w: &mut Workshop, name: String) {
    vector::push_back<String>(&mut w.workshop_lessons, name)
}

/// Görsel amaçlı: ders sayısını geri döndürür (view tarzı)
public fun lessons_len(w: &Workshop): u64 {
    vector::length<String>(&w.workshop_lessons)
}
