SMODS.Joker {
    key = "chaos",
    rarity = "osc_blursed",
    atlas = "osc_w1blursed",
    pos = {x=0,y=0},
    config = {
        extra = {
            range = 5
        }
    },
    blueprint_compat = true,
    cost = 2,

    loc_vars = function(self,info_queue,card)
        return {vars = {card.ability.extra.range}}
    end,

    calculate = function(self,card,context)
        if context.joker_main then
            local chips = (pseudorandom("chaoschips")-0.5) * card.ability.extra.range * 2
            local mult = (pseudorandom("chaosmult")-0.5) * card.ability.extra.range * 2
            local dollars = math.ceil((pseudorandom("chaosdollars")-0.5) * card.ability.extra.range * 200)/100
            return {
                chips = chips,
                mult = mult,
                dollars = dollars
            }
        end
    end
}

SMODS.Joker {
    key = "he",
    rarity = "osc_blursed",
    atlas = "osc_w1blursed",
    pos = {x=1,y=0},
    config = {
        immutable = {
            xmult = 0.1
        }
    },
    blueprint_compat = true,
    cost = 0,

    calculate = function(self,card,context)
        card:set_eternal(true)
        if context.joker_main then
            return { xmult = card.ability.immutable.xmult}
        end
    end
}