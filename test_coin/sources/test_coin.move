module test_coin::test_coin {
    // Only sui::coin is needed for the create_currency function.
    // transfer and tx_context are brought in by default.
    use sui::coin;

    /// The one-time witness for our coin.
    public struct TEST_COIN has drop {}

    /// In the module initializer, we create the currency and transfer the
    /// TreasuryCap and CoinMetadata to the publisher.
    fun init(witness: TEST_COIN, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(
            witness,
            9,                   // decimals
            b"WKC",              // symbol
            b"Workshop Coin",    // name
            b"A coin for completing challenges in the Sui workshop.", // description
            option::none(),      // icon_url
            ctx
        );
        transfer::public_transfer(treasury, ctx.sender());
        transfer::public_transfer(metadata, ctx.sender());
    }
}