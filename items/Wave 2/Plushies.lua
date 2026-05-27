SMODS.Joker {
    key = "metal_sonic",
    rarity = 2,
    atlas = "osc_w2plush",
    pos = {x=0,y=0},
    cost = 6,
    config = {
        extra = {
            xchips = 1,
            gain = 0.1
        },
    },

    loc_vars = function(self,info_queue,card)
        if G.playing_cards then
            local val = 1
            for i,v in ipairs(G.playing_cards) do
                if v:get_seal() ~= nil then val = val + card.ability.extra.gain end
            end
            card.ability.extra.xchips = val
        end
        return { 
            vars = { card.ability.extra.xchips,card.ability.extra.gain },
        }
    end,

    calculate = function(self,card,context)
        if context.joker_main then
            if G.playing_cards then        
                local val = 1
                for i,v in ipairs(G.playing_cards) do
                    if v:get_seal() then val = val + card.ability.extra.gain end
                end
                card.ability.extra.xchips = val
		        return {
                    xchips = card.ability.extra.xchips
                }
            end
        end
    end,
}

SMODS.Joker {
    key = "kurzgesagt_duck",
    rarity = 1,
    atlas = "osc_w2plush",
    pos = {x=1,y=0},
    cost = 4,
    config = {
        extra = {
            multiple = 0.5
        },
    },

    loc_vars = function(self,info_queue,card)
        return { 
            vars = { card.ability.extra.multiple },
        }
    end,

    calculate = function(self,card,context)
        if context.individual and context.cardarea == G.play then
            if context.other_card:get_seal() then
                return { 
                    chips = context.other_card.base.nominal * card.ability.extra.multiple,
                    card = context.other_card
                }
            end
        end
    end,
}

SMODS.Joker {
    key = "long_kurzgesagt_duck",
    rarity = 2,
    atlas = "osc_w2plush",
    pos = {x=0,y=1},
    cost = 6,
    config = {
        extra = {
            multiple = 1
        },
    },

    loc_vars = function(self,info_queue,card)
        return { 
            vars = { card.ability.extra.multiple },
        }
    end,

    calculate = function(self,card,context)
        if context.individual and context.cardarea == G.play then
            if context.other_card:get_seal() then
                return { 
                    chips = context.other_card.base.nominal * card.ability.extra.multiple,
                    card = context.other_card
                }
            end
        end
    end,
}

SMODS.Joker {
    key = "20_hornet",
    rarity = 2,
    atlas = "osc_w2plush",
    pos = {x=1,y=1},
    cost = 7,
    config = {
        extra = {
            chips = 0,
            gain = 20
        },
    },

    loc_vars = function(self,info_queue,card)
        return { 
            vars = { card.ability.extra.chips, card.ability.extra.gain },
        }
    end,

    calculate = function(self,card,context)
        if context.individual and context.cardarea == G.play then
            if context.other_card:get_seal() then
                card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.gain
                return {  message = localize("k_upgrade_ex"), card = card }
            end
        end

        if context.joker_main then
            return { chips = card.ability.extra.chips }
        end
    end,
}