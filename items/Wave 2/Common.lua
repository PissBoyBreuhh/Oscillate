Oscillate.Joker {
    oscillate_wave = 2,
    key = "freaky",
    rarity = 1,
    atlas = "osc_w2common",
    pos = {x=0,y=0},
    cost = 4,
    config = {
        extra = {
            mult = 6,
        },
    },

    loc_vars = function(self,info_queue,card)
        return { 
            vars = { card.ability.extra.mult },
        }
    end,

    calculate = function(self,card,context)
        if context.joker_main and (context.scoring_name == "Pair" or context.scoring_name == "Two Pair") then
		    return {
                mult = card.ability.extra.mult
            }
        end
    end,
}

Oscillate.Joker {
    oscillate_wave = 2,
    key = "ghost_hunter",
    rarity = 1,
    atlas = "osc_w2common",
    pos = {x=1,y=0},
    cost = 5,
    config = {
        extra = {
            chips = 25,
        },
    },

    loc_vars = function(self,info_queue,card)
        info_queue[#info_queue+1] = G.P_CENTERS.m_osc_ghost
        return { 
            vars = { card.ability.extra.chips },
        }
    end,

    calculate = function(self,card,context)
        if context.joker_main then
            local count = 0
            for i,v in ipairs(G.playing_cards) do
                if v.config.center.key == "m_osc_ghost" then
                    count = count+1
                end
            end
		    return {
                chips = card.ability.extra.chips * count
            }
        end
    end,
}

Oscillate.Joker {
    oscillate_wave = 2,
    key = "wet_joker",
    rarity = 1,
    atlas = "osc_w2common",
    pos = {x=2,y=0},
    cost = 6,
    config = {
        extra = {
            chips = 0,
        },
    },

    loc_vars = function(self,info_queue,card)
        info_queue[#info_queue+1] = G.P_CENTERS.m_osc_soggy
        return { 
            vars = { card.ability.extra.chips },
        }
    end,

    calculate = function(self,card,context)
        if context.individual and context.cardarea == G.play then
            if context.other_card.config.center.key == "m_osc_soggy" then 
                card.ability.extra.chips = card.ability.extra.chips + context.other_card:get_chip_bonus()
                return {
                    message = localize("k_upgrade_ex"),
                    card = card
                }
            end
        end

        if context.joker_main then
            return {chips = card.ability.extra.chips}
        end
    end,
}