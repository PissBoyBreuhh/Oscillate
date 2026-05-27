SMODS.Joker {
    key = "expired_milk",
    rarity = "osc_blursed",
    atlas = "osc_w2blursed",
    pos = {x=0,y=0},
    config = {
        extra = {
            chips = 30,
            gain = -1,
        }
    },
    blueprint_compat = true,
    cost = 0,

    loc_vars = function(self,info_queue,card)
        return {vars = {card.ability.extra.chips, -card.ability.extra.gain}}
    end,

    calculate = function(self,card,context)
        if context.joker_main then
            card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.gain
            return { chips = card.ability.extra.chips }
        end
    end
}

SMODS.Joker {
    key = "kakorrhapiaphobia",
    rarity = "osc_blursed",
    atlas = "osc_w2blursed",
    pos = {x=1,y=0},
    blueprint_compat = true,
    cost = 0,

    calculate = function(self,card,context)
        if context.end_of_round and context.game_over and context.main_eval then
            if G.GAME.blind:get_type() == "Big" then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        G.hand_text_area.blind_chips:juice_up()
                        G.hand_text_area.game_chips:juice_up()
                        play_sound('tarot1')
                        card:start_dissolve()
                        return true
                    end
                }))
                return {
                    message = localize('k_saved_ex'),
                    saved = 'saved_kakorrhapiaphobia',
                    colour = G.C.RED
                }
            end
        end
    end
}

SMODS.Joker {
    key = "claustrophobia",
    rarity = "osc_blursed",
    atlas = "osc_w2blursed",
    pos = {x=2,y=0},
    blueprint_compat = true,
    cost = 0,

    config = {
        immutable = {
            change = 2
        }
    },

    add_to_deck = function(self, card, from_debuff)
		SMODS.change_play_limit(card.ability.immutable.change)
        SMODS.change_discard_limit(card.ability.immutable.change)
        G.hand:change_size(-card.ability.immutable.change)
	end,
	remove_from_deck = function(self, card, from_debuff)
		SMODS.change_play_limit(-card.ability.immutable.change)
        SMODS.change_discard_limit(-card.ability.immutable.change)
        G.hand:change_size(card.ability.immutable.change)
	end,
}

SMODS.Joker {
    key = "dementia",
    rarity = "osc_blursed",
    atlas = "osc_w2blursed",
    pos = {x=3,y=0},
    blueprint_compat = true,
    cost = 0,

    config = {
        extra = {
            chips = 20,
            mult = 3,
            dollars = 3,
            xchips = 2,
            xmult = 1.5
        },
        active = {
            true,
            true,
            true,
            true,
            true
        }
    },

    loc_vars = function(self,info_queue,card)
        return { 
            vars = {
                (card.ability.active[1] and "+"..card.ability.extra.chips or "???"),
                (card.ability.active[2] and "+"..card.ability.extra.mult or "???"),
                (card.ability.active[3] and card.ability.extra.dollars.."$" or "???"),
                (card.ability.active[4] and "X"..card.ability.extra.xchips or "???"),
                (card.ability.active[5] and "X"..card.ability.extra.xmult or "???")
        }
    }
    end,

    calculate = function(self,card,context)
        if context.joker_main then
            return {
                chips = (card.ability.active[1] and card.ability.extra.chips or 0),
                mult = (card.ability.active[2] and card.ability.extra.mult or 0),
                dollars = (card.ability.active[3] and card.ability.extra.dollars or 0),
                xchips = (card.ability.active[4] and card.ability.extra.xchips or 1),
                xmult = (card.ability.active[5] and card.ability.extra.xmult or 1)
            }
        end

        if context.end_of_round and context.main_eval then
            local selector = math.floor(pseudorandom("forgor") * 5) % 5 + 1
            while not card.ability.active[selector] do
                selector = math.floor(pseudorandom("forgor") * 5) % 5 + 1
            end

            card.ability.active[selector] = false
            return {
                message = "I forgot :skull:"
            }
        end
    end
}

SMODS.Joker {
    key = "a_timer",
    rarity = "osc_blursed",
    atlas = "osc_w2blursed",
    pos = {x=0,y=1},
    blueprint_compat = true,
    cost = 0,

    config = {
        extra = {
            xmult = 5,
            lose = 0.1
        },
        immutable = {
            time = 0,
            reset = 5,
            can_lose = true
        }
    },

    loc_vars = function(self,info_queue,card)
        return { 
            main_start = {
                { 
                    n = G.UIT.R, 
                    config = { 
                        minw = 1,
                        minh = 0,
                        align = "cm",
                        padding = 0.05,
                        colour = G.C.WHITE
                    }, 
                    nodes = {
                        { 
                            n = G.UIT.C, 
                            config = { 
                                minw = 0,
                                minh = 0,
                                align = "cl",
                                padding = 0.05,
                                colour = G.C.MULT
                            },  
                            nodes = {
                                {
                                n = G.UIT.T,
                                config = {
                                    text = "X",
                                    colour = G.C.WHITE, 
                                    scale = 0.32 }
                                },
                                {
                                n = G.UIT.T,
                                config = {
                                    ref_table = card.ability.extra, 
                                    ref_value = "xmult", 
                                    colour = G.C.WHITE, 
                                    scale = 0.32 }
                                }
                            } 
                        },
                        {
                        n = G.UIT.T,
                        config = {
                            text = "Mult",
                            colour = G.C.UI.TEXT_DARK, 
                            scale = 0.32 }
                        },
                    } 
                }
            },
            vars = { card.ability.extra.xmult, card.ability.extra.lose } 
        }
    end,

    calculate = function(self,card,context)
        if context.joker_main then
            return { xmult = card.ability.extra.xmult }
        end

        if context.set_blind then
            card.ability.immutable.can_lose = true
        end

        if context.end_of_round then
            card.ability.immutable.can_lose = false
            card.ability.extra.xmult = card.ability.immutable.reset
        end
    end,

    update = function(self,card,dt)
        card.ability.immutable.time = card.ability.immutable.time + G.real_dt
        if card.ability.immutable.time > 1 and card.ability.extra.xmult > 1.1 and card.ability.immutable.can_lose then
            card.ability.immutable.time = 0
            card.ability.extra.xmult = card.ability.extra.xmult - card.ability.extra.lose
        end
    end
}

SMODS.Joker {
    key = "schizophrenia",
    rarity = "osc_blursed",
    atlas = "osc_w2blursed",
    pos = {x=1,y=1},
    blueprint_compat = true,
    cost = 0,

    loc_vars = function(self,info_queue,card)
        info_queue[#info_queue+1] = G.P_CENTERS.m_osc_ghost
    end,

    calculate = function(self,card,context)
        if context.cardarea == "unscored" and context.individual then
            local othercard = context.other_card
            G.E_MANAGER:add_event(Event({
                trigger = "after",
                func = function()
                    G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                    local _card = copy_card(othercard)
                    _card:set_ability("m_osc_ghost")
                    _card:add_to_deck()
                    G.deck.config.card_limit = G.deck.config.card_limit + 1
                    G.deck:emplace(_card)
                    table.insert(G.playing_cards,_card)
                    card:juice_up(0.5,0.5)
                    return true
                end
            }))
            return {
                message = localize("k_copied_ex")
            }
        end
    end
}

SMODS.Joker {
    key = "scumming",
    rarity = "osc_blursed",
    atlas = "osc_w2blursed",
    pos = {x=2,y=1},
    blueprint_compat = true,
    cost = 0,

    add_to_deck = function(self, card, from_debuff)
		G.GAME.osc_scumming = true
	end,
	remove_from_deck = function(self, card, from_debuff)
		G.GAME.osc_scumming = false
	end,
}

SMODS.Joker {
    key = "deep_fry",
    rarity = "osc_blursed",
    atlas = "osc_w2blursed",
    pos = {x=3,y=1},
    blueprint_compat = true,
    cost = 0,

    calculate = function(self,card,context)
        if context.individual and context.cardarea == G.play then
            local othercard = context.other_card
            G.E_MANAGER:add_event(Event({
                trigger = "immediate",
                func = function()
                    othercard:set_edition("e_osc_deep_fry")
                    card:juice_up(0.5, 0.5)
                    return true
                end
            }))
        end
    end
}

SMODS.Sound {
    key = "deep fried music",
    path = "deepfry.ogg",
    pitch = 1,
    
    select_music_track = function(self)
        for _,c in ipairs((G.jokers or {cards = {}}).cards) do
            if c.ability.name == "j_osc_deep_fry" then return {10000} end
        end
    end
}

SMODS.Edition {
    key = "deep_fry",
    shader = "deepfry",
    weight = 6,
    extra_cost = 2,

    config = {
        xchips = 1.2,
    },

    loc_vars = function(self,info_queue,card)
        return {
            vars = {
                card.edition.xchips,
            }
        }
    end,

    calculate = function(self,card,context)
        if (context.post_joker) or (context.main_scoring and context.cardarea == G.play) then
            return {
                xchips = card.edition.xchips,
            }
        end
    end
}

SMODS.Shader {
    key = "deepfry",
    path = "deepfry.fs"
}