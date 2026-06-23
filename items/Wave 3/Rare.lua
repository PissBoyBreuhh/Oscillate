Oscillate.Joker {
    oscillate_wave = 3,
    key = "mexico",
    rarity = 3,
    atlas = "w3rare",
    pos = {x=0,y=0},
    cost = 8,
    config = {
        extra = {
            gain = 0.5,
            xmult = 1.5
        }
    },

    loc_vars = function(self,info_queue,card)
        return {vars = {card.ability.extra.xmult, card.ability.extra.gain}}
    end,

    calculate = function(self,card,context)
        if context.setting_blind and context.blind.boss then
            card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.gain
            return {message = localize("k_upgrade_ex")}
        end

        if context.joker_main then
            return {xmult = card.ability.extra.xmult}
        end
    end,

    add_to_deck = function(self, card, from_debuff)
        G.GAME.osc_mexico = true
    end,

    remove_from_deck = function(self, card, from_debuff)
        G.GAME.osc_mexico = false
    end,
}

Oscillate.Joker {
    oscillate_wave = 3,
    key = "relentless",
    rarity = 3,
    atlas = "w3rare",
    pos = {x=1,y=0},
    cost = 8,
    config = {
        extra = {
            xmult = 2,
        }
    },

    loc_vars = function(self,info_queue,card)
        return {vars = {card.ability.extra.xmult, G.GAME.probabilities.normal}}
    end,

    calculate = function(self,card,context)

        if context.joker_main then
            return {xmult = card.ability.extra.xmult}
        end

        if context.retrigger_joker_check then
            if context.other_card == card then
                local retriggers = 0
                for i = 1, 50 do
                    if pseudorandom("recurrence") < G.GAME.probabilities.normal/2 then
                        retriggers = retriggers + 1
                    else
                        break
                    end
                end

                if retriggers > 0 then
                    return {repetitions = retriggers}
                end
            end
        end
    end,
}