SMODS.Joker {
    key = "osc_traffic1",
    rarity = 2,
    atlas = "osc_w1uncommon",
    pos = {x=0,y=0},
    config = {
        state = 1,
        extra = {
            mult = 4,
            xmult = 4
        },
    },
    cost = 7,

    loc_vars = function(self,info_queue,card)
        card.ability.state = os.date("%S") % 3
        return {
            vars = {card.ability.state == 1 and card.ability.extra.mult or card.ability.state == 2 and card.ability.extra.xmult},
            key = "osc_traffic" .. card.ability.state
        }
    end,

    calculate = function(self,card,context)
        card.ability.state = os.date("%S") % 3
        if context.joker_main and not context.blueprint then
            if card.ability.state == 2 then
                return {
                    xmult = card.ability.extra.xmult
                }
            elseif card.ability.state == 1 then
                return {
                    mult = card.ability.extra.mult
                }      
            end
        end
    end,
}

SMODS.Joker {
    key = "osc_rps1",
    rarity = 2,
    atlas = "osc_w1uncommon",
    pos = {x=1,y=0},
    config = {
        state = -1,
        extra = {
            mult = 5,
            chips = 25,
            dollars = 3,
        },
        moves = {"rock","paper","scissors"}
    },
    blueprint_compat = true,
    cost = 6,

    loc_vars = function(self,info_queue,card)
        return {
            vars = {card.ability.state == 1 and card.ability.extra.mult or card.ability.state == 2 and card.ability.extra.xmult or card.ability.extra.dollars,G.GAME.probabilities.normal},
            key = "osc_rps" .. (card.ability.state > -1 and card.ability.state or os.date("%S") % 3)
        }
    end,

    calculate = function(self,card,context)
        if card.ability.state == -1 then card.ability.state = os.date("%S") % 3 else
            card.ability.state = math.ceil(card.ability.state % 3) -- stuff like tropical smoothie makes state incorrect so this fixes that
        end
        if context.individual and context.cardarea == G.play and not context.blueprint then
            if Oscillate.hitchance("rock",1,3) then
                card.ability.state = (card.ability.state+1) % 3
                return {message = card.ability.moves[card.ability.state+1]}
            end            
        end
        if context.joker_main then
            if card.ability.state == 2 then
                return {
                    mult = card.ability.extra.mult
                }
            elseif card.ability.state == 1 then
                return {
                    chips = card.ability.extra.chips
                }      
            else
                return {
                    dollars = card.ability.extra.dollars
                }
            end
        end
    end,
}

SMODS.Joker {
    key = "testest",
    rarity = 2,
    atlas = "osc_w1uncommon",
    pos = {x=2,y=0},
    config = {
        extra = {
            mult = 0,
            gainmult = 1,
        },
    },
    blueprint_compat = true,
    cost = 6,

    loc_vars = function(self,info_queue,card)
        return {
            vars = {card.ability.extra.mult,card.ability.extra.gainmult}
        }
    end,

    calculate = function(self,card,context)
        if context.joker_main then
            local output = 0
            if not context.blueprint then
            local bit1,bit2 = math.floor(pseudorandom("logicgates")+0.5),math.floor(pseudorandom("gatelogics")+0.5)
            local operators,keys,index = {
                ["and"] = function(a,b) return a*b end,
                ["or"] = function(a,b) return a+b - a*b end,
                ["xor"] = function(a,b) return a+b - 2*a*b end,
                ["nand"] = function(a,b) return 1 - (a*b) end,
                ["nor"] = function(a,b) return 1 - (a+b - a*b) end,
                ["xnor"] = function(a,b) return 1 - (a+b - 2*a*b) end,
            }, {"and","or","xor","nand","nor","xnor"}, math.floor(pseudorandom("operator")*6) + 1

            local operator = operators[keys[index]]
            output = operator(bit1,bit2)

            G.E_MANAGER:add_event(Event {
                card_eval_status_text(card, 'extra', nil, nil, nil, {message = keys[index] .. "(" .. bit1 .. "," .. bit2 .. ") = " .. output, colour = G.C.BLUE, delay = 2}),
                trigger = "immediate",
            })
            end
            
            card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.gainmult*output
            return {
                message = (output == 1 and not context.blueprint) and "Upgrade!" or "",
                mult = card.ability.extra.mult
            }

        end
    end,
}

SMODS.Joker {
    key = "bees",
    rarity = 2,
    atlas = "osc_w1uncommon",
    pos = {x=3,y=0},
    config = {
        extra = {
            money = 1
        }
    },
    blueprint_compat = true,
    cost = 5,

    loc_vars = function(self,info_queue,card)
        return{vars={card.ability.extra.money}}
    end,

    calculate = function(self,card,context)
        if context.pre_discard then
            return{dollars=card.ability.extra.money}
        end
    end,
}

SMODS.Joker {
    key = "more_bees",
    rarity = 2,
    atlas = "osc_w1uncommon",
    pos = {x=4,y=0},
    config = {
        extra = {
            money = 1
        }
    },
    blueprint_compat = true,
    cost = 6,

    loc_vars = function(self,info_queue,card)
        return{vars={card.ability.extra.money}}
    end,

    calculate = function(self,card,context)
        if context.pre_discard or context.before then
            return{dollars=card.ability.extra.money}
        end
    end,
}

SMODS.Joker {
    key = "even_more_bees",
    rarity = 2,
    atlas = "osc_w1uncommon",
    pos = {x=0,y=1},
    config = {
        extra = {
            money = 1
        }
    },
    blueprint_compat = true,
    cost = 7,

    loc_vars = function(self,info_queue,card)
        return{vars={card.ability.extra.money}}
    end,

    calculate = function(self,card,context)
        if context.pre_discard or context.before or context.setting_blind then
            return{dollars=card.ability.extra.money}
        end
    end,
}

SMODS.Joker {
    key = "heat_death",
    rarity = 2,
    atlas = "osc_w1uncommon",
    pos = {x=1,y=1},
    config = {
        isobtained = 0,
        hijokahh = true,
        extra = {
            xmult = 3,
        },
        immutable = {
            losthands = 0
        }
    },
    blueprint_compat = true,
    cost = 8,

    loc_vars = function(self,info_queue,card)
        return{vars = {card.ability.extra.xmult}}
    end,

    calculate = function(self,card,context)
        if card.ability.isobtained == 0 then
            card.ability.isobtained = 1
            card.ability.immutable.losthands = G.GAME.round_resets.hands-1
            G.GAME.round_resets.hands = 1
            G.GAME.round_resets.discards = G.GAME.round_resets.discards + 3
        end
        if context.joker_main then
            if os.date("%Y %m %d") == "2036 08 12" then
                return{emult = card.ability.extra.xmult}
            else
                return{xmult = card.ability.extra.xmult}
            end
        end
        if context.selling_self and not context.blueprint then
            G.GAME.round_resets.hands = G.GAME.round_resets.hands + card.ability.immutable.losthands
            G.GAME.round_resets.discards = G.GAME.round_resets.discards - 3
        end
    end,
}

SMODS.Joker {
    key = "epicenter",
    rarity = 2,
    atlas = "osc_w1uncommon",
    pos = {x=4,y=1},
    immutable = true,
    config = {},
    cost = 6,

    loc_vars = function(self,info_queue,card)
        local jokers
        if G.jokers then
            jokers = G.jokers.cards
        else
            jokers = {}
        end
        if card == jokers[math.ceil(#jokers/2)] and #jokers % 2 == 1 then
            return{vars = {"joker in middle"}}
        else
            return{vars = {"joker not in middle"}}
        end
    end,

    calculate = function(self,card,context)
        if context.repetition and context.cardarea == G.play and not context.blueprint then
            if context.other_card == context.scoring_hand[math.ceil(#context.scoring_hand/2)] and #context.scoring_hand % 2 == 1
            and card == G.jokers.cards[math.ceil(#G.jokers.cards/2)] and #G.jokers.cards % 2 == 1
            then
                return {repetitions = #context.scoring_hand}
            end
        end
    end
}

SMODS.Joker {
    key = "azazel_plush",
    rarity = 2,
    atlas = "osc_w1uncommon",
    pos = {x=2,y=1},
    config = {
    extra = {
            mult = 7
        }
    },
    blueprint_compat = true,
    cost = 5,

    loc_vars = function(self,info_queue,card)
        info_queue[#info_queue+1] = G.P_CENTERS.osc_incubus_seal
        return {vars = {card.ability.extra.mult}}
    end,

    calculate = function(self,card,context)
        if context.individual and context.cardarea == G.play then
            if context.other_card.seal == "osc_incubus" then
                return {mult = card.ability.extra.mult}
            end
        end
    end
}

SMODS.Joker {
    key = "aussie_lamb",
    rarity = 2,
    atlas = "osc_w1uncommon",
    pos = {x=0,y=2},
    config = {
        extra = {
            xmult = 1,
            gain = 0.01
        }
    },
    blueprint_compat = true,
    cost = 7,

    loc_vars = function(self,info_queue,card)
        return {vars = {card.ability.extra.xmult,card.ability.extra.gain}}
    end,

    calculate = function(self,card,context)
        if context.individual and context.cardarea == G.play then
            if context.other_card.base.suit == "Hearts" then
                card.ability.extra.xmult = card.ability.extra.xmult+card.ability.extra.gain
                return{message = localize("k_upgrade_ex"),message_card = card}
            end
        end
        if context.joker_main then
            return {xmult = card.ability.extra.xmult}
        end
    end
}

SMODS.Joker {
    key = "canadian_rhino",
    rarity = 2,
    atlas = "osc_w1uncommon",
    pos = {x=1,y=2},
    config = {
        extra = {
            xmult = 1,
            gain = 0.01
        }
    },
    blueprint_compat = true,
    cost = 7,

    loc_vars = function(self,info_queue,card)
        return {vars = {card.ability.extra.xmult,card.ability.extra.gain}}
    end,

    calculate = function(self,card,context)
        if context.individual and context.cardarea == G.play then
            if context.other_card.base.suit == "Clubs" then
                card.ability.extra.xmult = card.ability.extra.xmult+card.ability.extra.gain
                return{message = localize("k_upgrade_ex"),message_card = card}
            end
        end
        if context.joker_main then
            return {xmult = card.ability.extra.xmult}
        end
    end
}

SMODS.Joker {
    key = "korean_salmon",
    rarity = 2,
    atlas = "osc_w1uncommon",
    pos = {x=2,y=2},
    config = {
        extra = {
            xmult = 1,
            gain = 0.01
        }
    },
    blueprint_compat = true,
    cost = 7,

    loc_vars = function(self,info_queue,card)
        return {vars = {card.ability.extra.xmult,card.ability.extra.gain}}
    end,

    calculate = function(self,card,context)
        if context.individual and context.cardarea == G.play then
            if context.other_card.base.suit == "Diamonds" then
                card.ability.extra.xmult = card.ability.extra.xmult+card.ability.extra.gain
                return{message = localize("k_upgrade_ex"),message_card = card}
            end
        end
        if context.joker_main then
            return {xmult = card.ability.extra.xmult}
        end
    end
}

SMODS.Joker {
    key = "british_cow",
    rarity = 2,
    atlas = "osc_w1uncommon",
    pos = {x=3,y=2},
    config = {
        extra = {
            xmult = 1,
            gain = 0.01
        }
    },
    blueprint_compat = true,
    cost = 7,

    loc_vars = function(self,info_queue,card)
        return {vars = {card.ability.extra.xmult,card.ability.extra.gain}}
    end,

    calculate = function(self,card,context)
        if context.individual and context.cardarea == G.play then
            if context.other_card.base.suit == "Spades" then
                card.ability.extra.xmult = card.ability.extra.xmult+card.ability.extra.gain
                return{message = localize("k_upgrade_ex"),message_card = card}
            end
        end
        if context.joker_main then
            return {xmult = card.ability.extra.xmult}
        end
    end
}

SMODS.Joker {
    key = "amazon_package",
    rarity = 2,
    atlas = "osc_w1uncommon",
    pos = {x=3,y=1},
    immutable = true,
    config = {
        immutable = {
            obtained_ante = false
        }
    },
    cost = 8,

    loc_vars = function(self,info_queue,card)
        return {vars = {(card.ability.immutable.obtained_ante and G.GAME.round_resets.ante - card.ability.immutable.obtained_ante or 0)}}
    end,

    calculate = function(self,card,context)
        if not card.ability.immutable.obtained_ante then
            card.ability.immutable.obtained_ante = G.GAME.round_resets.ante
        end
        if G.GAME.round_resets.ante - card.ability.immutable.obtained_ante >= 2 and not context.blueprint then
            card.ability.immutable.obtained_ante = G.GAME.round_resets.ante
            G.GAME.joker_buffer = G.GAME.joker_buffer + 2
            G.E_MANAGER:add_event(Event({
                func = function() 
                        local newcard = create_card('Joker', G.jokers, nil, 4, nil, nil, nil, 'amazon')
                        newcard:add_to_deck()
                        G.jokers:emplace(newcard)
                        newcard:start_materialize()
                        G.GAME.joker_buffer = 0
                    return true
                end
            }))
            G.E_MANAGER:add_event(Event({
                trigger = "immediate",
                func = function()
                    card:start_dissolve()
                    return true
                end
            }))
        end
        if context.final_scoring_step and context.cardarea == G.jokers and 
        SMODS.calculate_round_score() > G.GAME.blind.chips then
            G.E_MANAGER:add_event(Event({
                trigger = "immediate",
                func = function()
                    card:start_dissolve()
                    return true
                end
            }))
        end
    end
}

SMODS.Joker {
    key = "oblobbles",
    rarity = 2,
    atlas = "osc_w1common", -- got buffed from common, thats why its atlas is w1common
    pos = {x=1,y=3},
    config = {
        extra = {
            xchips = 2,
            played_hands = 0,
        }
    },
    blueprint_compat = true,
    cost = 6,

    loc_vars = function(self,info_queue,card)
        return{vars={card.ability.extra.xchips,card.ability.extra.played_hands}}
    end,

    calculate = function(self,card,context)
        if context.before then
            card.ability.extra.played_hands = card.ability.extra.played_hands+1
            return {message = card.ability.extra.played_hands .. "/2"}
        end
        if context.joker_main and card.ability.extra.played_hands >= 3 then
            card.ability.extra.played_hands = 0
            G.E_MANAGER:add_event(Event {
                card_eval_status_text(card, 'extra', nil, nil, nil, {message = "reset"}),
                trigger = "immediate",
            })
            return{xchips = card.ability.extra.xchips}
        end
    end
}