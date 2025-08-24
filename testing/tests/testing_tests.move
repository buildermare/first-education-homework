// Basit test örneğin durabilir
#[test]
fun simple_test() {
    let sum_val = 2 + 2;
    assert!(sum_val == 4, 0);
}

// 1) sum fonksiyonu testleri
#[test]
fun test_sum_basic() {
    assert!(functions::sum(0, 0) == 0, 1);
    assert!(functions::sum(1, 2) == 3, 2);
    assert!(functions::sum(10, 15) == 25, 3);
}

#[test]
fun test_sum_commutative() {
    // Toplama değişmeli mi? Evet. a+b == b+a olmalı.
    let a = 7;
    let b = 11;
    assert!(functions::sum(a, b) == functions::sum(b, a), 4);
}

#[test]
fun test_sum_with_zero_identity() {
    let x = 12345;
    assert!(functions::sum(x, 0) == x, 5);
    assert!(functions::sum(0, x) == x, 6);
}

// 2) compare fonksiyonu testleri
// Varsayım: 0 => a<b, 1 => a==b, 2 => a>b
#[test]
fun test_compare_less_equal_greater() {
    assert!(functions::compare(1, 2) == 0, 10); // 1 < 2
    assert!(functions::compare(5, 5) == 1, 11); // 5 == 5
    assert!(functions::compare(9, 3) == 2, 12); // 9 > 3
}

#[test]
fun test_compare_edges() {
    // Kenar durumları: sıfır, ardışık sayılar vb.
    assert!(functions::compare(0, 1) == 0, 20);
    assert!(functions::compare(1, 0) == 2, 21);
    assert!(functions::compare(0, 0) == 1, 22);
}
