SMODS.Joker {
    key = "jellybean",
    rarity = "osc_candy",
    atlas = "osc_w1candy",
    pos = {x=0,y=0},
    config = {
        extra = {
            money = 1
        }
    },
    blueprint_compat = true,
    cost = 4,

    loc_vars = function(self,info_queue,card)
        return{
            vars = {
                card.ability.extra.money,
                G.jokers and  (G.jokers.config.card_limit - #G.jokers.cards) * card.ability.extra.money or 0
            }
        }
    end,

    calculate = function(self,card,context)
        if context.joker_main then
            return {dollars = (G.jokers.config.card_limit - #G.jokers.cards) * card.ability.extra.money}
        end
    end
}

SMODS.Joker {
    key = "lozenge",
    rarity = "osc_candy",
    atlas = "osc_w1candy",
    pos = {x=1,y=0},
    config = {
        extra = {
            cards = 2,
        },
        immutable = {
            maxcards = 3,
        }
    },
    cost = 8,

    loc_vars = function(self,info_queue,card)
        return { 
            vars = {math.min(card.ability.extra.cards,card.ability.immutable.maxcards),
                (card.ability.extra.cards == 1 and "" or "s"),
                colours = { HEX("FDA9FC") }
            },
        }
    end,

    calculate = function(self,card,context)
        if context.selling_self and not context.blueprint then
            if G.jokers.config.card_limit - #G.jokers.cards >= 0 then
			    G.GAME.joker_buffer = G.GAME.joker_buffer + card.ability.extra.cards
                G.E_MANAGER:add_event(Event({
                    func = function() 
                        for i = 1, math.max(math.min(card.ability.extra.cards,card.ability.immutable.maxcards,G.jokers.config.card_limit - #G.jokers.cards),1) do
                            local newcard = create_card('Joker', G.jokers, nil, "osc_candy", nil, nil, nil, 'lozenge')
                            newcard:add_to_deck()
                            G.jokers:emplace(newcard)
                            newcard:start_materialize()
                            G.GAME.joker_buffer = 0
                            end
                        return true
                    end
                })) 
            end
		end
    end,
}

SMODS.Joker {
    key = "lemondrop",
    rarity = "osc_candy",
    atlas = "osc_w1candy",
    pos = {x=2,y=0},
    config = {
        extra = {
            chips = 10
        }
    },
    blueprint_compat = true,
    cost = 3,

    loc_vars = function(self,info_queue,card)
        return{vars = {card.ability.extra.chips}}
    end,

    calculate = function(self,card,context)
        if context.individual and context.cardarea == G.play then
            if (
                next(SMODS.get_enhancements(context.other_card)) or
                context.other_card.seal or
                context.other_card.edition
            ) then
                return {chips = card.ability.extra.chips}
            end
        end
    end
}

SMODS.Joker {
    key = "gumsquare",
    rarity = "osc_candy",
    atlas = "osc_w1candy",
    pos = {x=3,y=0},
    config = {
        extra = {
            mult = 2
        }
    },
    blueprint_compat = true,
    cost = 5,

    loc_vars = function(self,info_queue,card)
        return{
            vars = {card.ability.extra.mult,
            G.jokers and card.ability.extra.mult*#G.jokers.cards or 0}
        }
    end,

    calculate = function(self,card,context)
        if context.joker_main then
            return {mult=card.ability.extra.mult*#G.jokers.cards}
        end
    end
}

SMODS.Joker {
    key = "lollipophead",
    rarity = "osc_candy",
    atlas = "osc_w1candy",
    pos = {x=0,y=1},
    config = {
        extra = {
            chips = 100
        }
    },
    blueprint_compat = true,
    cost = 6,

    loc_vars = function(self,info_queue,card)
        return{
            vars = {card.ability.extra.chips}
        }
    end,

    calculate = function(self,card,context)
        if context.joker_main then
            return {chips = card.ability.extra.chips}
        end
    end
}

SMODS.Joker {
    key = "jujubecluster",
    rarity = "osc_candy",
    atlas = "osc_w1candy",
    pos = {x=1,y=1},
    config = {
        extra = {
            retriggers = 2,
            selectedjoker = 1
        },
        immutable = {
            maxretriggers = 20
        }
    },
    cost = 7,

    loc_vars = function(self,info_queue,card)
        return{
            vars = {
                math.min(card.ability.extra.retriggers,card.ability.immutable.maxretriggers),
                (card.ability.extra.retriggers == 1 and "" or "s")
            }
        }
    end,

    calculate = function(self,card,context)
        if context.before then
            card.ability.extra.selectedjoker = math.ceil(pseudorandom("jujutsukaisen")*#G.jokers.cards)%#G.jokers.cards + 1
            while G.jokers.cards[card.ability.extra.selectedjoker].ability.name == "j_osc_jujubecluster" do
                card.ability.extra.selectedjoker = math.ceil(pseudorandom("jujutsukaisen")*#G.jokers.cards)%#G.jokers.cards + 1
            end
        end
        if context.retrigger_joker_check and not context.retrigger_joker and context.other_card == G.jokers.cards[card.ability.extra.selectedjoker] and not context.blueprint then
            return {repetitions = math.min(card.ability.extra.retriggers,card.ability.immutable.maxretriggers)}
        end
    end
}

SMODS.Joker {
    key = "striped",
    rarity = "osc_candy",
    atlas = "osc_w1candy",
    pos = {x=2,y=1},
    config = {
        extra = {
            retriggers = 1,
        },
        immutable = {
            maxretriggers = 5
        }
    },
    blueprint_compat = true,
    cost = 7,

    loc_vars = function(self,info_queue,card)
        return{
            vars = {
                math.min(card.ability.extra.retriggers,card.ability.immutable.maxretriggers),
                (card.ability.extra.retriggers == 1 and "" or "s")
            }
        }
    end,

    calculate = function(self,card,context)
        if context.repetition and context.cardarea == G.play then
            return {repetitions = math.min(card.ability.extra.retriggers,card.ability.immutable.maxretriggers)}
        end
    end
}

SMODS.Joker {
    key = "wrapped",
    rarity = "osc_candy",
    atlas = "osc_w1candy",
    pos = {x=3,y=1},
    config = {
        extra = {
            money = 1,
        },
        immutable = {
            chance = 2,
        }
    },
    blueprint_compat = true,
    cost = 8,

    loc_vars = function(self,info_queue,card)
        return { vars = {card.ability.extra.money,card.ability.immutable.chance,G.GAME.probabilities.normal} }
    end,

    calculate = function(self,card,context)
        if context.other_joker and context.other_joker.ability.set == "Joker" then
            if Oscillate.hitchance("wrapped",1,card.ability.immutable.chance) then 
            if not Talisman.config_file.disable_anims then
				G.E_MANAGER:add_event(Event({
					func = function()
						context.other_joker:juice_up(0.5, 0.5)
						return true
					end,
				}))
			end    
            return {
				dollars = card.ability.extra.money,
                message_card = context.other_joker
			}
            end
		end
    end,
}

SMODS.Joker {
    key = "colorbomb",
    rarity = "osc_candy",
    atlas = "osc_w1candy",
    pos = {x=0,y=2},
    config = {},
    cost = 5,

    calculate = function(self,card,context)
        if context.final_scoring_step and not context.blueprint then
            local suits = {"Hearts","Diamonds","Spades","Clubs"}
            for _,c in ipairs(G.play.cards) do
                G.E_MANAGER:add_event(Event({
                    trigger = "after",
                    func = function()
                        c:change_suit(suits[math.ceil(pseudorandom("color")*4)%4 + 1])
                        c:juice_up(0.5,0.5)
                        card:juice_up(1,1)
                        return true
                    end,
                }))
            end
        end
    end,
}

SMODS.Joker {
    key = "jellyfish",
    rarity = "osc_candy",
    atlas = "osc_w1candy",
    pos = {x=1,y=2},
    config = {},
    blueprint_compat = true,
    cost = 4,

    loc_vars = function(self,info_queue,card)
        info_queue[#info_queue+1] = G.P_CENTERS.m_osc_jellyfish
    end,

    calculate = function(self,card,context)
        if context.final_scoring_step then
            local scoredcard = G.play.cards[math.ceil(pseudorandom("jelly")*#G.play.cards)%#G.play.cards + 1]
            G.E_MANAGER:add_event(Event({
                trigger = "after",
                func = function()
                scoredcard:set_ability("m_osc_jellyfish")
                scoredcard:juice_up(0.5,0.5)
                scoredcard:draw("both")
                card:juice_up(1,1)
                return true
                end,
            }))
        end
    end,
}