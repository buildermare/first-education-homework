module test_nft::test_nft {
    use std::string::{Self, String};
    use sui::event;
    use sui::url::{Self, Url};

    /// The main NFT struct for the workshop.
    public struct WorkshopNFT has key, store {
        id: UID,
        name: String,
        description: String,
        url: Url,
        creator: address,
    }

    /// Event emitted when a new NFT is minted.
    public struct NFTMinted has copy, drop {
        object_id: ID,
        creator: address,
        name: String,
    }

    // --- Getters ---

    public fun name(nft: &WorkshopNFT): &String { &nft.name }
    public fun description(nft: &WorkshopNFT): &String { &nft.description }
    public fun url(nft: &WorkshopNFT): &Url { &nft.url }
    public fun creator(nft: &WorkshopNFT): &address { &nft.creator }

    // --- Public Functions ---

    /// Mint a new WorkshopNFT and send it to the transaction sender.
    public entry fun mint_to_sender(
        name: vector<u8>,
        description: vector<u8>,
        url: vector<u8>,
        ctx: &mut TxContext,
    ) {
        let sender = ctx.sender();
        let nft = WorkshopNFT {
            id: object::new(ctx),
            name: string::utf8(name),
            description: string::utf8(description),
            url: url::new_unsafe_from_bytes(url),
            creator: sender,
        };

        event::emit(NFTMinted {
            object_id: object::id(&nft),
            creator: sender,
            name: nft.name,
        });

        transfer::public_transfer(nft, sender);
    }

    /// Transfer the NFT to a new owner.
    public entry fun transfer(nft: WorkshopNFT, recipient: address, _: &mut TxContext) {
        transfer::public_transfer(nft, recipient)
    }

    /// Update the description of the NFT. Only the original creator can do this.
    public entry fun update_description(
        nft: &mut WorkshopNFT,
        new_description: vector<u8>,
        ctx: &mut TxContext,
    ) {
        assert!(nft.creator == ctx.sender(), 0); // ENotCreator
        nft.description = string::utf8(new_description);
    }

    /// Burn the NFT. Only the original creator can do this.
    public entry fun burn(nft: WorkshopNFT, ctx: &mut TxContext) {
        assert!(nft.creator == ctx.sender(), 0); // ENotCreator
        let WorkshopNFT { id, name: _, description: _, url: _, creator: _ } = nft;
        object::delete(id);
    }
}
