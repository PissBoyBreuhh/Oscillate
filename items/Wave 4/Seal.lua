SMODS.Seal {
    key = "sleepy",
    badge_colour = HEX("5971ba"),
    config = {
        extra = {
            retriggers = 3,
            odds = 4
        }
    },
    atlas = "osc_w4enhancer",
    pos = {x=0,y=0},

    loc_vars = function(self, info_queue, card)
        return { vars = { G.GAME.probabilities.normal, self.config.extra.odds, self.config.extra.retriggers } }
    end,

    calculate = function(self, card, context)
        if context.repetition and (G.GAME.probabilities.normal/self.config.extra.odds > pseudorandom("sleep") or 
        (G.GAME.probabilities.normal/self.config.extra.odds > pseudorandom("sleepcool") and G.GAME.osc_seal_buffs.sleepy))then
            return {
                repetitions = card.ability.seal.extra.retriggers,
            }
        end
    end,
}

SMODS.Seal {
    key = "dummy",
    badge_colour = HEX("ad7145"),
    atlas = "osc_w4enhancer",
    pos = {x=1,y=0},

    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play and G.GAME.osc_seal_buffs.dummy then
            return {mult = 1}
        end
    end,
}

SMODS.Seal {
    key = "golden_red",
    badge_colour = HEX("c98e4f"),
    config = {
        extra = {
            money = 10,
        }
    },
    atlas = "osc_w4enhancer",
    pos = {x=2,y=0},

    loc_vars = function(self, info_queue, card)
        return { vars = { self.config.extra.money } }
    end,

    get_p_dollars = function(self, card)
        if G.GAME.osc_seal_buffs.golden_red then return 2 end
        return 0
    end,

    calculate = function(self, card, context)
        if context.repetition then
            return {
                repetitions = tonumber(math.floor(math.min(G.GAME.dollars/self.config.extra.money, 40)))
            }
        end
    end,
}

SMODS.Seal {
    key = "honey",
    badge_colour = HEX("e87431"),
    atlas = "osc_w4enhancer",
    pos = {x=0,y=1},
}

SMODS.Seal {
    key = "hell",
    badge_colour = HEX("de3a3a"),
    config = {
        extra = {
            destroychance = 3,
            createchance = 2
        }
    },
    atlas = "osc_w4enhancer",
    pos = {x=1,y=1},

    loc_vars = function(self, info_queue, card)
        return { vars = { self.config.extra.destroychance, self.config.extra.createchance } }
    end,

    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.hand and pseudorandom("hell") < 1/self.config.extra.destroychance then
            local left,right
            for i,v in ipairs(G.hand.cards) do
                if v == card then
                    left = G.hand.cards[i-1]
                    right = G.hand.cards[i+1]
                end
            end

            if left then
                SMODS.destroy_cards(left)
                if pseudorandom("hellleft") < 1/self.config.extra.createchance or G.GAME.osc_seal_buffs.hell then
                    if G.consumeables.config.card_limit > #G.consumeables.cards then
                        G.E_MANAGER:add_event(Event({
                        func = function()
                            SMODS.add_card({set = "osc_song", area = G.consumeables})
                            card:juice_up(0.5,0.5)
                        return true end
                        }))
                    end
                end
            end

            if right then
                SMODS.destroy_cards(right)
                if pseudorandom("hellright") < 1/self.config.extra.createchance or G.GAME.osc_seal_buffs.hell then
                    if G.consumeables.config.card_limit > #G.consumeables.cards then
                        G.E_MANAGER:add_event(Event({
                        func = function()
                            SMODS.add_card({set = "osc_song", area = G.consumeables})
                            card:juice_up(0.5,0.5)
                        return true end
                        }))
                    end
                end
            end
        end
    end,
}