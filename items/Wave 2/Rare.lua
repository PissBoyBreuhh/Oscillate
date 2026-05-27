SMODS.Joker {
    key = "osc_8_bees",
    rarity = 3,
    atlas = "osc_w2bees",
    pos = {x=0,y=0},
    config = {
        extra = {
            money = 1
        }
    },
    blueprint_compat = true,
    cost = 8,

    loc_vars = function(self,info_queue,card)
        return{vars={card.ability.extra.money}}
    end,

    calculate = function(self,card,context)
        if context.pre_discard or context.before or context.setting_blind or context.buying_card then
            return{dollars=card.ability.extra.money}
        end
    end,
}

SMODS.Joker {
    key = "osc_omg_so_many_bees",
    rarity = 3,
    atlas = "osc_w2bees",
    pos = {x=1,y=0},
    config = {
        extra = {
            money = 1
        }
    },
    blueprint_compat = true,
    cost = 9,

    loc_vars = function(self,info_queue,card)
        return{vars={card.ability.extra.money}}
    end,

    calculate = function(self,card,context)
        if context.pre_discard or context.before or context.setting_blind or context.buying_card or context.reroll_shop then
            return{dollars=card.ability.extra.money}
        end
    end,
}