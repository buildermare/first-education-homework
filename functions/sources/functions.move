/// Module: functions
module functions::functions;

use std::string::{Self, String};

/// 1) Sum function
/// İki sayıyı toplar ve sonucu döndürür.
public fun sum(a: u64, b: u64): u64 {
    a + b
}

/// 2) Say hello function
/// - İsim verilirse: "Hi, <name>"
/// - İsim verilmezse: "Hi"
/// Not: Move'da overloading yok; bu yüzden iki ayrı fonksiyon tanımlıyoruz.
public fun say_hello(): String {
    string::utf8(b"Hi")
}

public fun say_hello_to(name: &String): String {
    // "Hi, " + name birleştirmesi
    let prefix = string::utf8(b"Hi, ");
    string::concat(&prefix, name)
}

/// 3) Check function
/// Verilen sayının tek olup olmadığını kontrol eder.
/// Tek ise true, çift ise false döner.
public fun is_odd(n: u64): bool {
    // u64'te mod operatörüyle kontrol
    (n % 2) == 1
}
