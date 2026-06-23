Oscillate.Joker {
    oscillate_wave = 3,
    key = "communism",
    rarity = 2,
    atlas = "w3uncommon",
    pos = {x=0,y=0},
    cost = 5,

    calculate = function(self,card,context)
        local sell = 0
        for i,v in ipairs(G.jokers.cards) do
            sell = sell + v.sell_cost
        end

        sell = sell/(#G.jokers.cards)
        for i,v in ipairs(G.jokers.cards) do
            v.sell_cost = sell
        end
    end,
}

Oscillate.Joker {
    oscillate_wave = 3,
    key = "ascended_grus",
    rarity = 2,
    atlas = "w3uncommon",
    pos = {x=1,y=0},
    cost = 6,
    config = {
        extra = {
            chips = 20,
            mult = 4,
            xmult = 1.5,
            stage = false
        }
    },

    loc_vars = function(self,info_queue,card)
        return {vars = {card.ability.extra.chips,card.ability.extra.mult,card.ability.extra.xmult}}
    end,

    calculate = function(self,card,context)
        if context.individual and context.cardarea == G.play then 
            card.ability.extra.stage = not card.ability.extra.stage
            return {mult = card.ability.extra.stage and card.ability.extra.mult,chips = (not card.ability.extra.stage) and card.ability.extra.chips} 
        end

        if context.joker_main then return {xmult = card.ability.extra.xmult} end
    end,
}