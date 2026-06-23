Oscillate.Joker {
    oscillate_wave = 3,
    key = "capitalism",
    rarity = "osc_blursed",
    atlas = "w3blursed",
    pos = {x=0,y=0},
    cost = 4,

    calculate = function(self,card,context)
        local sell = 0
        for i,v in ipairs(G.jokers.cards) do
            if v ~= card then sell = sell + v.sell_cost; v.sell_cost = 0 end
        end
        card.sell_cost = card.sell_cost + sell
    end,
}

Oscillate.Joker {
    oscillate_wave = 3,
    key = "scam",
    rarity = "osc_blursed",
    atlas = "w3blursed",
    pos = {x=1,y=0},
    cost = 0,
    config = {
        extra = {
            money = 0
        }
    },

    loc_vars = function(self,info_queue,card)
        return { vars = {card.ability.extra.money}}
    end,

    calculate = function(self,card,context)
        if context.setting_blind then
            if G.GAME.dollars > 0 then
            card.ability.extra.money = G.GAME.dollars
            G.GAME.dollars = 0
            return {message = "Mine!"}
            end
        end

        if context.joker_main then
            local quips = {"hmm...", "yes...", "no...", "ouh...", "oh...", "ugh...", "yuh...", "nuh...", "well...", "shit...", "ah...", "happens...", "oh no...", "oh yes...", "hurm...", "mhm...", "yup...", "mfgghh...,,,", "ofc...", "yo...", "oush...", "shii...", (Osc_config.swears and "fuck..." or "frick..."), "fah..."}
            card.ability.extra.money = card.ability.extra.money + (pseudorandom("crypto", -pseudorandom("crypto1")/2, pseudorandom("crypto2")/2)*card.ability.extra.money)
            return {message = quips[math.random(#quips)]}
        end
    end,

    calc_dollar_bonus = function(self, card)
        local moner = card.ability.extra.money
        card.ability.extra.money = 0
        return moner, {text = "Fine, take it back..."}
    end
}

Oscillate.Joker {
    oscillate_wave = 3,
    key = "blackhole",
    rarity = "osc_blursed",
    atlas = "w3blursed",
    pos = {x=2,y=0},
    cost = 0,

    calculate = function(self,card,context)
        if context.individual and (context.cardarea == G.play or context.cardarea == G.hand) then
            if context.other_card then
                G.GAME.osc_whitehole[#G.GAME.osc_whitehole+1] = context.other_card
                SMODS.destroy_cards(context.other_card)
            end
        end
    end,
}