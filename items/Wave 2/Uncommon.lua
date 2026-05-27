SMODS.Joker {
    key = "blursed_eye",
    rarity = 2,
    atlas = "osc_w2uncommon",
    pos = {x=0,y=0},
    cost = 6,
    config = {
        extra = {
            cards = 1,
        },
        immutable = {
            maxcards = 3,
        }
    },

    loc_vars = function(self,info_queue,card)
        return { 
            vars = {math.min(card.ability.extra.cards,card.ability.immutable.maxcards),
                (card.ability.extra.cards == 1 and "" or "s"),
                colours = { HEX("3D1F38") }
            },
        }
    end,

    calculate = function(self,card,context)
        if context.setting_blind then
		    G.GAME.joker_buffer = G.GAME.joker_buffer+math.min(card.ability.extra.cards,card.ability.immutable.maxcards,G.jokers.config.card_limit - #G.jokers.cards)
            G.E_MANAGER:add_event(Event({
                func = function() 
                    for i = 1, math.min(math.min(card.ability.extra.cards,card.ability.immutable.maxcards),math.max(G.jokers.config.card_limit - #G.jokers.cards,0)) do
                        local newcard = create_card('Joker', G.jokers, nil, "osc_blursed", nil, nil, nil, 'candycrush')
                        newcard:add_to_deck()
                        G.jokers:emplace(newcard)
                        newcard:start_materialize()
                        G.GAME.joker_buffer = 0
                        end
                    return true
                end
            }))
            card:juice_up(1,1)
        end
    end,
}

SMODS.Joker {
    key = "tetranacci",
    rarity = 2,
    atlas = "osc_w2uncommon",
    pos = {x=1,y=0},
    cost = 6,
    config = {
        extra = {
            xchips = 1.2,
        },
    },

    loc_vars = function(self,info_queue,card)
        return { 
            vars = { card.ability.extra.xchips }
        }
    end,

    calculate = function(self,card,context)
        if context.individual and context.cardarea == G.play then
            local tribonacci = {"Ace","2","4","8"}
            for i = 1,#tribonacci do
                if context.other_card.base.value == tribonacci[i] then
                    return {xchips = card.ability.extra.xchips}
                end
            end
        end
    end,
}