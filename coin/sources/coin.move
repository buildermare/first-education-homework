module coin::coin {
    use sui::coin::{Self, TreasuryCap, CoinMetadata, create_currency};
    use sui::url::Url;
    use sui::tx_context::TxContext;
    use std::option::{Self, none};

    /// Yeni bir coin türü tanımlanıyor
    public struct Workshop has store, drop {} // drop zorunlu!

    /// Entry function: Yeni coin yaratır
    public entry fun init_coin(ctx: &mut TxContext): (TreasuryCap<Workshop>, CoinMetadata<Workshop>) {
        let (treasury, metadata) = create_currency<Workshop>(
            Workshop {},                // witness (değer, referans değil!)
            b"Workshop",                // name
            b"WKSHP",                   // symbol
            b"The Workshop Coin",      // description
            9,                          // decimals (u8 otomatik algılanır)
            none<Url>(),               // icon_url
            1_000_000,                 // initial_supply
            ctx                        // ctx
        );
        (treasury, metadata)
    }
}
