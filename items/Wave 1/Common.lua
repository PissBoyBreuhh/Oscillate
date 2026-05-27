SMODS.Joker {
    key = "workdays",
    rarity = 1,
    atlas = "osc_w1common",
    pos = {x=0,y=0},
    config = {
        extra = {
        daychips = 10
        }
    },
    blueprint_compat = true,
    cost = 3,

    loc_vars = function(self,info_queue,card)
        if 0 < tonumber(os.date("%w")) and tonumber(os.date("%w")) < 6 then
            return {vars = {tonumber(os.date("%w"))*card.ability.extra.daychips,os.date("%A")}}
        else return {vars = {0,os.date("%A")}}
        end
    end,

    calculate = function(self,card,context)
        if 0 < tonumber(os.date("%w")) and tonumber(os.date("%w")) < 6 and context.joker_main then
            return {chips = tonumber(os.date("%w"))*card.ability.extra.daychips}
        end
    end,
}

SMODS.Joker {
    key = "pigeon",
    rarity = 1,
    atlas = "osc_w1common",
    pos = {x=1,y=0},
    config = {
        extra = {
            exceed = 2
        },
        immutable = {
            mult = 0.5
        }
    },
    blueprint_compat = true,
    cost = 3,

    loc_vars = function(self,info_queue,card)
        info_queue[#info_queue+1] = G.P_CENTERS.m_stone
        return{ vars = {card.ability.extra.exceed,card.ability.immutable.mult}}
    end,

    calculate = function(self,card,context)
        if context.final_scoring_step and context.cardarea == G.jokers and 
        SMODS.calculate_round_score() > G.GAME.blind.chips*card.ability.extra.exceed then
            local stone_card = SMODS.add_card { set = "Base", enhancement = "m_stone", area = G.deck }
            return {
                message = localize('k_plus_stone'),
                colour = G.C.SECONDARY_SET.Enhanced,
                func = function()
                    SMODS.calculate_context({ playing_card_added = true, cards = { stone_card } })
                end
            }
        end

        if context.joker_main then
            local stonecards = 0
            for _,c in ipairs(G.playing_cards) do
                if c.config.center == G.P_CENTERS.m_stone then stonecards = stonecards+1 end
            end
            return {mult = stonecards*card.ability.immutable.mult}
        end
    end,
}

SMODS.Joker {
    key = "new_world",
    rarity = 1,
    atlas = "osc_w1common",
    pos = {x=2,y=0},
    config = {
        extra = {
            chips = 24 
        }
    },
    blueprint_compat = true,
    cost = 4,

    loc_vars = function(self,info_queue,card)
        return{vars={card.ability.extra.chips}}
    end,

    calculate = function(self,card,context)
        if context.joker_main then
            local spades = 0
            for _,c in ipairs(G.hand.cards) do
                if c.base.suit == "Spades" then spades = spades + 1 end
            end
            for _,c in ipairs(G.play.cards) do
                if c.base.suit == "Spades" then spades = spades + 1 end
            end
            return {chips = spades*card.ability.extra.chips}
        end
    end
}

SMODS.Joker {
    key = "silksong",
    rarity = 1,
    atlas = "osc_w1common",
    pos = {x=3,y=0},
    immutable = true,
    config = {
        extra = {
            chips = 78,
            mult = 6
        }
    },
    blueprint_compat = true,
    cost = 5,

    loc_vars = function(self,info_queue,card)
        return{vars={card.ability.extra.chips,card.ability.extra.mult}}
    end,

    calculate = function(self,card,context)
        if context.joker_main then
            return {
                chips = card.ability.extra.chips,
                mult = card.ability.extra.mult
            }
        end
    end
}

SMODS.Joker {
    key = "prime",
    rarity = 1,
    atlas = "osc_w1common",
    pos = {x=0,y=1},
    config = {
        extra = {
            chips = 31,
        }
    },
    blueprint_compat = true,
    cost = 4,

    loc_vars = function(self,info_queue,card)
        return{vars={card.ability.extra.chips}}
    end,

    calculate = function(self,card,context)
        if context.individual and context.cardarea == G.play then
            local primes = {"2","3","5","7","Ace"}
            for i = 1,#primes do
                if context.other_card.base.value == primes[i] then
                    return {chips=card.ability.extra.chips}
                end
            end
        end
    end
}

SMODS.Joker {
    key = "rekoj",
    rarity = 1,
    atlas = "osc_w1common",
    pos = {x=1,y=1},
    immutable = true,
    config = {
        extra = {
            mult = 4,
            xmult = 2
        }
    },
    blueprint_compat = true,
    cost = 3,

    loc_vars = function(self,info_queue,card)
        info_queue[#info_queue+1] = G.P_CENTERS.j_joker
        return{vars={card.ability.extra.mult,card.ability.extra.xmult}}
    end,

    calculate = function(self,card,context)
        if context.joker_main then
            local hasjoker = false
            for _,c in ipairs(G.jokers.cards) do
                if c.ability.name == "Joker" then
                    hasjoker = true
                end
            end
            if hasjoker then
                return{xmult = card.ability.extra.xmult}
            else
                return{mult = -card.ability.extra.mult}
            end
        end
    end
}

SMODS.Joker {
    key = "longname",
    rarity = 1,
    atlas = "osc_w1common",
    pos = {x=2,y=1},
    immutable = true,
    config = {},
    blueprint_compat = true,
    cost = 2,

    calculate = function(self,card,context)
        if context.joker_main then
            return {chips = 1}
        end
    end
}

SMODS.Joker {
    key = "cool_joker",
    rarity = 1,
    atlas = "osc_w1common",
    pos = {x=3,y=1},
    config = {
        extra = {
            chips = 24
        },
        immutable = {
            suit = "Diamonds",
            rank = 10
        }
    },
    blueprint_compat = true,
    cost = 4,

    loc_vars = function(self,info_queue,card)
        local ranks = {"2","3","4","5","6","7","8","9","10","Jack","Queen","King","Ace"}
        return{vars = {card.ability.extra.chips,card.ability.immutable.suit,ranks[card.ability.immutable.rank]}}
    end,

    calculate = function(self,card,context)
        if context.individual and context.cardarea == G.play then
            if context.other_card.base.id == card.ability.immutable.rank+1 or context.other_card.base.suit == card.ability.immutable.suit then
                return {chips = card.ability.extra.chips}
            end
        end
        if context.end_of_round then
            local suits = {"Hearts","Spades","Diamonds","Clubs"}
            card.ability.immutable.suit = suits[math.ceil(pseudorandom("cool")*4)]
            card.ability.immutable.rank = math.ceil(pseudorandom("joker")*13)
        end
    end
}

SMODS.Joker {
    key = "jokahh",
    rarity = 1,
    atlas = "osc_w1common",
    pos = {x=2,y=3},
    immutable = true,
    config = {},
    cost = 2,

    calculate = function(self,card,context)
        if context.pre_discard and not context.blueprint then
            play_sound("osc_scream",1,1)
        end
        if context.joker_main and G.SETTINGS.language == "it" then
            for _,c in ipairs(G.jokers.cards) do
                if c.ability.name == "j_osc_heat_death" then
                    return {mult=10}
                end
            end
        end
    end
}

SMODS.Joker {
    key = "french",
    rarity = 1,
    atlas = "osc_w1common",
    pos = {x=0,y=2},
    config = {
        extra = {
            mult = 4,
            chips = 4
        }
    },
    blueprint_compat = true,
    cost = 2,

    loc_vars = function(self,info_queue,card)
        local operator = "-"
        if G.SETTINGS.language == "fr" then operator = "+" end
        return{vars = {operator,card.ability.extra.chips,card.ability.extra.mult}}
    end,

    calculate = function(self,card,context)
        if context.joker_main then
            if G.SETTINGS.language == "fr" then
                return {
                    chips = card.ability.extra.chips,
                    mult = card.ability.extra.mult
                }
            else
                return {
                    chips = -card.ability.extra.chips,
                    mult = -card.ability.extra.mult
                }
            end
        end
    end
}

SMODS.Joker {
    key = "trimmed",
    rarity = 1,
    atlas = "osc_w1common",
    pos = {x=1,y=2},
    immutable = true,
    config = {},
    cost = 4,

    calculate = function(self,card,context)
        if context.joker_main and not context.blueprint then
            for _,c in ipairs(G.hand.cards) do
                if c.base.id <= 4 then
                    G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.8,
                    func = function() 
                        if c.ability.name == 'Glass Card' then 
                            c:shatter()
                        else
                            c:start_dissolve()
                        end
                        card:juice_up()
                    return true end }))
                end
            end
        end
    end
}

SMODS.Joker {
    key = "git_gud",
    rarity = 1,
    atlas = "osc_w1common",
    pos = {x=2,y=2},
    config = {
        extra = {
            chipsmul = 10
        }
    },
    blueprint_compat = true,
    cost = 4,

    loc_vars = function(self,info_queue,card)
        return {vars = {card.ability.extra.chipsmul,G.GAME.round_resets.ante*card.ability.extra.chipsmul}}
    end,

    calculate = function(self,card,context)
        if context.joker_main then
            return {chips = G.GAME.round_resets.ante*card.ability.extra.chipsmul}
        end
    end
}

SMODS.Joker {
    key = "pristineblade",
    rarity = 1,
    atlas = "osc_w1common",
    pos = {x=3,y=2},
    immutable = true,
    config = {},
    cost = 5,

    loc_vars = function(self,info_queue,card)
        info_queue[#info_queue+1] = G.P_CENTERS.m_osc_divine
    end,

    calculate = function(self,card,context)
        if context.before and not context.blueprint then
            for _,c in ipairs(G.deck.cards) do
                if c.ability.name == "m_osc_divine" then
                    c.ability.extra.gain = 0
                end
            end
        end
        if context.selling_self then
            for _,c in ipairs(G.deck.cards) do
                if c.ability.name == "m_osc_divine" then
                    c.ability.extra.gain = 0.05
                end 
            end
        end
    end
}

SMODS.Joker {
    key = "child",
    rarity = 1,
    atlas = "osc_w1common",
    pos = {x=3,y=3},
    config = {
        extra = {
            denominator = 18,
            numerator = 1,
        }
    },
    blueprint_compat = true,
    cost = 5,

    loc_vars = function(self,info_queue,card)
        info_queue[#info_queue+1] = G.P_CENTERS.m_steel
        return {vars = {card.ability.extra.denominator,G.GAME.probabilities.normal+card.ability.extra.numerator-1}}
    end,

    calculate = function(self,card,context)
        if context.individual and context.cardarea == G.play then
            if Oscillate.hitchance("get back to work!",card.ability.extra.numerator,card.ability.extra.denominator) then
                local othercard = context.other_card
                G.E_MANAGER:add_event(Event {
                    trigger = "after",
                    func = function()
                        othercard:set_ability(G.P_CENTERS.m_steel)
                        othercard:juice_up(0.5,0.5)
                        card:juice_up(1,1)
                        return true
                    end
                })
                card.ability.extra.numerator = 1
                return {
                    message = localize("k_reset"),
                    message_card = card
                }
            else
                card.ability.extra.numerator = card.ability.extra.numerator+1
                return {
                    message = localize("k_upgrade_ex"),
                    message_card = card
                }
            end
        end
    end
}

SMODS.Joker {
    key = "tribonacci",
    rarity = 1,
    atlas = "osc_w1common",
    pos = {x=0,y=3},
    config = {
        extra = {
            mult = 2
        }
    },
    blueprint_compat = true,
    cost = 4,

    loc_vars = function(self,info_queue,card)
        return{vars={card.ability.extra.mult}}
    end,

    calculate = function(self,card,context)
        if context.individual and context.cardarea == G.play then
            local tribonacci = {"Ace","2","4","7"}
            for i = 1,#tribonacci do
                if context.other_card.base.value == tribonacci[i] then
                    return {mult=card.ability.extra.mult}
                end
            end
        end
    end
}