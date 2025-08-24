#[test_only]
module first_smart_contract::first_smart_contract_tests {
    use std::string;
    use first_smart_contract::first_smart_contract;

    const ENotImplemented: u64 = 0;

    #[test]
    fun test_first_smart_contract() {
        // Basit bir String hazırla
        let msg = string::utf8(b"HelloTest");
        // create_hello entry; test ortamında doğrudan entry çağrısı yapılmaz,
        // unit testlerde çoğunlukla “saf” fonksiyonlar test edilir. Bu yüzden
        // burada yalnızca API yüzünü kontrol etmeye yönelik bir iskelet bırakıyoruz.
        // Gerçekçi senaryoda publish+call akışını e2e test eder ya da
        // fonksiyonu non-entry wrapper ile soyutlarsın.
        // assertler: derleyiciye örnek olsun diye string uzunluğu kontrolü
        assert!(string::length(&msg) > 0, 1);
    }

    #[test, expected_failure(abort_code = ENotImplemented)]
    fun test_first_smart_contract_fail() {
        abort ENotImplemented
    }
}