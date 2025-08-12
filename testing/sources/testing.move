<<<<<<< HEAD
/// Module: testing
module testing::testing;

// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions

#[test]
fun simple_test() {
    let sum = 2 + 2;
    assert!(sum == 4);
=======
module testing::testing {
    // Toplama fonksiyonu
    public fun sum(a: u64, b: u64): u64 {
        a + b
    }

    // Karşılaştırma fonksiyonu
    public fun compare(a: u64, b: u64): bool {
        a > b
    }

    #[test]
    fun simple_test() {
        let sum = 2 + 2;
        assert!(sum == 4, 100);
    }
>>>>>>> 1a246a7 (tüm ödevler tamamlandı)
}
