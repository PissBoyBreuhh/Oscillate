Oscillate.is_p = function(card)
    if card.config.center.is_p then
        return true
    end
    for i,v in ipairs(G.jokers.cards) do
        if v.ability.name == "j_osc_pea" then
            return true
        end
    end
    return false
end

Oscillate.true_p = {
    "j_osc_p",
    "j_osc_pp",
    "j_osc_ppp",
    "j_osc_pppp",
    "j_osc_pea",
    "j_osc_pee"
}

SMODS.Joker {
    key = "p",
    is_p = true,
    rarity = 1,
    atlas = "osc_w2p",
    pos = {x=0,y=0},
    cost = 1,
    config = {
        extra = {
            mult = 1,
        },
    },

 	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('k_osc_p'), G.C.FILTER, G.C.WHITE, 0.6 )
 	end,

    loc_vars = function(self,info_queue,card)
        return { 
            vars = { card.ability.extra.mult },
        }
    end,

    calculate = function(self,card,context)
        if context.joker_main then
		    return {
                mult = card.ability.extra.mult
            }
        end
    end,
}

SMODS.Joker {
    key = "pp",
    is_p = true,
    rarity = 2,
    atlas = "osc_w2p",
    pos = {x=1,y=0},
    cost = 5,
    config = {
        extra = {
            xmult = 1,
            gain = 1
        },
    },

 	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('k_osc_p'), G.C.FILTER, G.C.WHITE, 0.6 )
 	end,

    loc_vars = function(self,info_queue,card)
        card.ability.extra.xmult = 1
        if G.jokers then
        for i,v in ipairs(G.jokers.cards) do
            if Oscillate.is_p(v) then
                card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.gain
            end
        end
        end
        return { 
            vars = { card.ability.extra.gain,card.ability.extra.xmult },
        }
    end,

    calculate = function(self,card,context)
        if context.joker_main then
            card.ability.extra.xmult = 1
            for i,v in ipairs(G.jokers.cards) do
                if Oscillate.is_p(v) then
                    card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.gain
                end
            end
		    return {
                xmult = card.ability.extra.xmult
            }
        end
    end,
}

SMODS.Joker {
    key = "ppp",
    is_p = true,
    rarity = 3,
    atlas = "osc_w2p",
    pos = {x=2,y=0},
    cost = 7,
    config = {
        extra = {
            retriggers = 1,
        },
        immutable = {
            max = 16
        }
    },

    set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('k_osc_p'), G.C.FILTER, G.C.WHITE, 0.6 )
 	end,

    loc_vars = function(self,info_queue,card)
        return { 
            vars = { math.min(card.ability.extra.retriggers,card.ability.immutable.max), (card.ability.extra.retriggers == 1 and "" or "s") },
        }
    end,

    calculate = function(self,card,context)
        if context.retrigger_joker_check and Oscillate.is_p(context.other_card) then
            return { repetitions = math.min(card.ability.extra.retriggers,card.ability.immutable.max) }
        end
    end,
}

SMODS.Joker {
    key = "pea",
    is_p = true,
    rarity = 2,
    atlas = "osc_w2p",
    pos = {x=0,y=1},
    cost = 6,

    set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('k_osc_p'), G.C.FILTER, G.C.WHITE, 0.6 )
 	end,
}

SMODS.Joker {
    key = "pppp",
    is_p = true,
    rarity = 4,
    atlas = "osc_w2p",
    soul_pos = {x=3,y=1},
    pos = {x=3,y=0},
    cost = 5,
    config = {
        extra = {
            xmult = 1,
            gain = 2
        },
    },

    set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('k_osc_p'), G.C.FILTER, G.C.WHITE, 0.6 )
 	end,

    loc_vars = function(self,info_queue,card)
        card.ability.extra.xmult = 1
        if G.jokers then
        for i,v in ipairs(G.jokers.cards) do
            if Oscillate.is_p(v) then
                card.ability.extra.xmult = card.ability.extra.xmult * card.ability.extra.gain
            end
        end
        end
        return { 
            vars = { card.ability.extra.gain,card.ability.extra.xmult },
        }
    end,

    calculate = function(self,card,context)
        if context.joker_main then
            card.ability.extra.xmult = 1
            for i,v in ipairs(G.jokers.cards) do
                if Oscillate.is_p(v) then
                    card.ability.extra.xmult = card.ability.extra.xmult * card.ability.extra.gain
                end
            end
		    return {
                xmult = card.ability.extra.xmult
            }
        end

        if context.card_added then
            if Oscillate.is_p(context.card) and Oscillate.hitchance("pppp",1,2) and context.card.ability.set == "Joker" then
                local othercard = context.card
                G.E_MANAGER:add_event(Event({
                    func = function()
                        othercard:set_edition("e_negative")
                        return true
                    end
                }))
            end
        end
    end,
}

SMODS.Joker {
    key = "pee",
    is_p = true,
    rarity = 3,
    atlas = "osc_w2p",
    pos = {x=1,y=1},
    cost = 8,
    config = {
        extra = {
            cards = 1,
        },
        immutable = {
            maxcards = 3,
        }
    },

    set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('k_osc_p'), G.C.FILTER, G.C.WHITE, 0.6 )
 	end,

    loc_vars = function(self,info_queue,card)
        info_queue[#info_queue+1] = G.P_CENTERS.j_osc_p
        return { 
            vars = {math.min(card.ability.extra.cards,card.ability.immutable.maxcards),
                (card.ability.extra.cards == 1 and "" or "s"),
            },
        }
    end,
    
    calculate = function(self,card,context)
        if context.end_of_round and not context.blueprint and context.main_eval then
                G.E_MANAGER:add_event(Event({
                    func = function() 
                        for i = 1, math.min(card.ability.extra.cards,card.ability.immutable.maxcards) do
                            SMODS.add_card({key = "j_osc_p", edition = "e_negative"})
                        end
                        return true
                    end
                }))
                card:juice_up(1,1)
            end
    end,
}