Oscillate.Joker {
    oscillate_wave = 3,
    key = "red_plushie",
    rarity = 2,
    atlas = "osc_w3plushie",
    pos = {x=0,y=0},
    cost = 4,
    config = {
        extra = {
            mult = 10
        },
        immutable = {
            retrigger = false
        }
    },

    loc_vars = function(self,info_queue,card)
        info_queue[#info_queue+1] = G.P_SEALS.Red
        return {vars = {card.ability.extra.mult}}
    end,

    calculate = function(self,card,context)
        if context.joker_main then
            return {mult = card.ability.extra.mult}
        end

        if context.retrigger_joker_check then
            if card.ability.immutable.retrigger and context.other_card == card then
                card.ability.immutable.retrigger = false
                return {repetitions = 1}
            end
        end

        if context.individual then
            if context.other_card:get_seal() == "Red" then
                card.ability.immutable.retrigger = true
            end
        end
    end,
}

Oscillate.Joker {
    oscillate_wave = 3,
    key = "skeletal",
    rarity = 2,
    atlas = "osc_w3plushie",
    pos = {x=1,y=0},
    cost = 4,
    config = {
        extra = {
            tables = {
            {mult = 5, odds = 3},
            {mult = 8, odds = 5},
            {mult = 16, odds = 10},
            {mult = 30, odds = 25}
            }
        },
    },

    loc_vars = function(self,info_queue,card)
        local vars = {G.GAME.probabilities.normal}
        for i,v in ipairs(card.ability.extra.tables) do -- "unwraps" matrix to table for vars return
            vars[#vars+1] = v.odds
            vars[#vars+1] = v.mult
        end
        return {vars = vars}
    end,

    calculate = function(self,card,context)
        if context.individual and context.cardarea == G.play then
            if context.other_card:get_seal() then
                local mult = 0
                for i,v in ipairs(card.ability.extra.tables) do
                    if pseudorandom("extremigans") < G.GAME.probabilities.normal/v.odds then
                        mult = mult + v.mult
                    end
                end
                return {mult = mult}
            end
        end
    end,
}

SMODS.Seal {
    key = "pink",
    badge_colour = HEX("e7a4f5"),
    atlas = "osc_w3enhancers",
    pos = {x=0,y=1},

    loc_vars = function(self, info_queue, card)
        return { vars = { colours = {HEX("FDA9FC") } } }
    end,

    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            if #context.full_hand == 1 and G.GAME.current_round.hands_played == 0 and #G.jokers.cards+G.GAME.joker_buffer < G.jokers.config.card_limit then
                G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                G.E_MANAGER:add_event(Event{
                    trigger = "after",
                    func = function()
                        SMODS.add_card({
                            set = "Joker",
                            rarity = "osc_candy"
                        })
                    return true end
                })

            end
        end
    end,
}

SMODS.Seal {
    key = "white",
    badge_colour = HEX("dddddd"),
    config = {
        extra = {
            odds = 2
        }
    },
    atlas = "osc_w3enhancers",
    pos = {x=1,y=0},

    loc_vars = function(self, info_queue, card)
        return { vars = { G.GAME.probabilities.normal, self.config.extra.odds } }
    end,

    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == "unscored" then
            if pseudorandom("white") < G.GAME.probabilities.normal/self.config.extra.odds then
                return {
                    level_up = 1
                }
            end
        end
    end,
}

Oscillate.Joker {
    oscillate_wave = 3,
    key = "blahaj",
    rarity = 2,
    atlas = "osc_w3plushie",
    pos = {x=0,y=1},
    cost = 6,

    loc_vars = function(self,info_queue,card)
        info_queue[#info_queue+1] = G.P_SEALS.osc_pink
        info_queue[#info_queue+1] = G.P_SEALS.osc_white
        info_queue[#info_queue+1] = G.P_SEALS.Blue
    end,

    calculate = function(self,card,context)
        if context.individual and context.cardarea == "unscored" then
            context.other_card:set_seal(SMODS.poll_seal({type_key = "femboy", guaranteed = true, options = {"Blue", "osc_pink", "osc_white"}}))
            G.E_MANAGER:add_event(Event{
                trigger = "after",
                blocking = false,
                func = function()             
                    card:juice_up()
                return true end
            })
        end
    end,
}

Oscillate.Joker {
    oscillate_wave = 3,
    key = "dealer",
    rarity = 2,
    atlas = "osc_w3plushie",
    pos = {x=1,y=1},
    cost = 0,
    config = {
        extra = {
            odds = 5
        }
    },

    loc_vars = function(self,info_queue,card)
        return {vars = {G.GAME.probabilities.normal,card.ability.extra.odds}}
    end,

    calculate = function(self,card,context)
        if context.joker_main then
            if G.GAME.probabilities.normal/card.ability.extra.odds > pseudorandom("buckshot") then
                SMODS.destroy_cards(G.play.cards)
                for i,v in ipairs(G.hand.cards) do
                    v:set_seal("osc_seal?")
                end
            end
        end
    end,
}