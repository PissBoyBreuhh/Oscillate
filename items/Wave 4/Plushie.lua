Oscillate.Joker {
    oscillate_wave = 4,
    key = "large_blahaj",
    rarity = 3,
    atlas = "osc_w4plushies",
    pos = {x=0,y=0},
    cost = 8,

    loc_vars = function(self,info_queue,card)
        info_queue[#info_queue+1] = G.P_SEALS.osc_pink
        info_queue[#info_queue+1] = G.P_SEALS.osc_white
        info_queue[#info_queue+1] = G.P_SEALS.Blue
    end,

    calculate = function(self,card,context)
        if context.discard then
            if #context.full_hand <= 3 then
                context.other_card:set_seal(SMODS.poll_seal({type_key = "bigfemboy", guaranteed = true, options = {"Blue", "osc_pink", "osc_white"}}))
                G.E_MANAGER:add_event(Event{
                    trigger = "after",
                    blocking = false,
                    func = function()             
                        card:juice_up()
                    return true end
                })
            end
        end
    end,
}

Oscillate.Joker {
    oscillate_wave = 4,
    key = "djungelskog",
    rarity = 2,
    atlas = "osc_w4plushies",
    pos = {x=1,y=0},
    cost = 6,

    loc_vars = function(self,info_queue,card)
        info_queue[#info_queue+1] = G.P_SEALS.osc_sleepy
    end,

    calculate = function(self,card,context)
        if context.joker_main then
            if G.hand and G.hand.cards then
                G.hand.cards[1]:set_seal("osc_sleepy")
                G.E_MANAGER:add_event(Event({
                    trigger = "immediate",
                    func = function()
                        card:juice_up()
                        return true
                    end,
                }))
            end
        end
    end,
}

Oscillate.Joker {
    oscillate_wave = 4,
    key = "huggy_wuggy",
    rarity = 2,
    atlas = "osc_w4plushies",
    pos = {x=2,y=0},
    cost = 6,

    loc_vars = function(self,info_queue,card)
        info_queue[#info_queue+1] = G.P_SEALS.osc_dummy
        return {vars = {card.ability.extra.mult}}
    end,

    config = {
        extra = {
            mult = 2
        }
    },

    calculate = function(self,card,context)
        if context.joker_main then
            if G.deck and G.deck.cards then
                local count = 0
                for i,v in ipairs(G.deck.cards) do
                    if v:get_seal() == "osc_dummy" then
                        count = count+1
                    end
                end

                return {mult = count*card.ability.extra.mult}
            end
        end
    end,
}