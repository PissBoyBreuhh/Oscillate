SMODS.Atlas {
    key = "osc_w4samuksapo",
    path = "wave4samuksapo.png",
    px = 189,
    py = 370
}


Oscillate.Joker{ 
    oscillate_wave = 4,
    key = "samuksapo",
    rarity = 2,
    atlas = "osc_w4uncommon",
    pos = {x=0, y=0},
    cost = 5,

    loc_vars = function(self,info_queue,card)
        return {vars = {
            elements = {
                { n=G.UIT.R, config = {align="cm"}, nodes = { 
                    { n=G.UIT.O, config= { object =
                        SMODS.create_sprite(0, 0, 2.5, 5, "osc_w4samuksapo", {x = 0, y = 0})
                    }} 
                }},
            }      
        }}
    end,

    config = {
        extra = {
            xmult = 2
        }
    },

    calculate = function(self,card,context)
        if context.joker_main then
            return {xmult = card.ability.extra.xmult}
        end
    end
}

Oscillate.Joker{ 
    oscillate_wave = 4,
    key = "2_eggs",
    rarity = 2,
    atlas = "osc_w4uncommon",
    pos = {x=1, y=0},
    cost = 6,

    loc_vars = function(self,info_queue,card)
        return {vars = {card.ability.extra.sell_val}}
    end,

    config = {
        extra = {
            sell_val = 1
        }
    },

    calculate = function(self,card,context)
        if context.end_of_round and context.game_over == false and context.main_eval then
            for i,v in ipairs(G.jokers.cards) do
                v.sell_cost = v.sell_cost + card.ability.extra.sell_val
            end
     
            return {
                message = localize('k_val_up'),
                colour = G.C.MONEY
            }
        end
    end
}

Oscillate.Joker{ 
    oscillate_wave = 4,
    key = "meta_joker",
    rarity = 2,
    atlas = "osc_w4uncommon",
    pos = {x=2, y=0},
    cost = 6,

    loc_vars = function(self,info_queue,card)
        return {vars = {card.ability.extra.mult, card.ability.extra.chance,colours = {
            Oscillate.badge_colour,
            HEX("45de3a"),
            HEX("ff9333"),
            HEX("e683e2")
        }}}
    end,

    config = {
        extra = {
            mult = 10,
            chance = 5,
        }
    },

    calculate = function(self,card,context)
        if context.joker_main then
            local wave = pseudorandom("meta",1,Oscillate.current_wave)
            if wave == 1 then
                return {mult = card.ability.extra.mult}
            elseif wave == 2 then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        if G.jokers.config.card_limit - #G.jokers.cards > 0 then
                            local key = pseudorandom_element(Oscillate.true_p, "meta also")
                            SMODS.add_card({key = key, allow_duplicates = true})
                            card:juice_up(1,1)
                            return true
                        end
                        return true
                    end
                }))
            elseif wave == 3 then
                return {osc_crit = card.ability.extra.chance}
            elseif wave == 4 then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        SMODS.add_card({set = "osc_song", area = G.consumeables})
                        card:juice_up(0.5,0.5)
                    return true end
                }))  
            end
        end
    end
}