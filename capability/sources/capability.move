module capability::capability {
    use std::string::String;

    /// Capability struct
    public struct WorkshopCapability has key, store {
        id: UID
    }

    /// Workshop struct
    public struct Workshop has key, store {
        id: UID,
        lessons: vector<String>
    }

    /// Creates a new workshop
    public entry fun create_workshop(ctx: &mut TxContext) {
        let workshop = Workshop {
            id: object::new(ctx),
            lessons: vector::empty()
        };
        transfer::transfer(workshop, ctx.sender());
    }

    /// Adds a lesson to a workshop
    public entry fun add_lesson(workshop: &mut Workshop, lesson: String, _capability: &WorkshopCapability) {
        vector::push_back(&mut workshop.lessons, lesson);
    }

    fun init(ctx: &mut TxContext) {
        transfer::transfer(WorkshopCapability {
            id: object::new(ctx)
        }, ctx.sender())
    }
}