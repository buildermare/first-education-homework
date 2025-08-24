/// Module: time_usage
module time_usage::time_usage;

use sui::tx_context::{Self, TxContext};
use sui::clock::Clock;

/// compare:
/// - TxContext içinden epoch başlangıç zamanını (ms) alır
/// - Clock içinden mevcut zamanı (ms) alır
/// - Varsayılan: epoch_start_ms <= now_ms ise true döner
///
/// İhtiyacına göre karşılaştırma şartını tersine çevirebilir ya da eşitliği hariç tutabilirsin.
public fun compare(ctx: &TxContext, clock: &Clock): bool {
    let epoch_start_ms = tx_context::epoch_timestamp_ms(ctx);
    let now_ms = clock.timestamp_ms();
    // Örnek karşılaştırma: epoch başlangıcı, Clock'a göre geçmişte mi?
    epoch_start_ms <= now_ms
}
