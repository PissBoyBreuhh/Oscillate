SMODS.Rarity {
    key = "wizard",
    loc_txt = {name="WIZARD"},
    default_weight = 0,
    badge_colour = HEX("B169F0") 
}

SMODS.Sound {
    key = "osc_wizard",
    path = {
        ['default']="WIZARD.ogg",
    }
}

SMODS.Joker {
    key = "orb_great",
    rarity = 3,
    atlas = "osc_w2wizard",
    pos = {x = 0,y = 0},
    soul_pos = {x = 1,y = 0},
    cost = 10,
    config = {
        extra = {
            blind = 0,
        },
        immutable = {
            requirement = 15
        }
    },

    loc_vars = function(self,info_queue,card)
        return { 
            vars = { card.ability.extra.blind, card.ability.immutable.requirement },
            key = self.key .. (card.ability.extra.blind >= card.ability.immutable.requirement and "_ready" or "")
        }
    end,

    calculate = function(self,card,context)
        if context.end_of_round and context.main_eval then
            card.ability.extra.blind = card.ability.extra.blind+1
            if card.ability.extra.blind >= card.ability.immutable.requirement then
                return {
                    message = "he's ready"
                }
            end
            return {
                message = card.ability.extra.blind .. "/" .. card.ability.immutable.requirement
            }
        end

        if context.selling_self then
            if card.ability.extra.blind >= card.ability.immutable.requirement then
                SMODS.add_card({key = "j_osc_great_wizard"})
                play_sound("osc_wizard")
            end
        end
    end,
}

SMODS.Joker {
    key = "great_wizard",
    rarity = "osc_wizard",
    atlas = "osc_w2wizard",
    pos = {x = 2,y = 0},
    soul_pos = {x = 3,y = 0},
    cost = 40,
    immutable = true,
    config = {
        extra = {
            base = 0.75,
        },
    },

    loc_vars = function(self,info_queue,card)
        return { 
            vars = { card.ability.extra.base * 100 },
        }
    end,

    calculate = function(self,card,context)
        if context.setting_blind then
            G.E_MANAGER:add_event(Event({
                trigger = "immediate",
                func = function() 
                    G.GAME.blind.chips = math.floor(G.GAME.blind.chips - G.GAME.blind.chips * card.ability.extra.base)
                    G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                    return true
                end
            }))
        end
    end,
}

SMODS.Joker {
    key = "orb_nunchucks",
    rarity = 3,
    atlas = "osc_w2wizard",
    pos = {x = 0,y = 1},
    soul_pos = {x = 1,y = 1},
    cost = 10,
    config = {
        immutable = {
            requirement = 250
        }
    },

    loc_vars = function(self,info_queue,card)
        return { 
            vars = { G.GAME.dollars,card.ability.immutable.requirement },
            key = self.key .. (G.GAME.dollars >= card.ability.immutable.requirement and "_ready" or "")
        }
    end,

    calculate = function(self,card,context)
        if context.selling_self then
            if G.GAME.dollars >= card.ability.immutable.requirement then
                SMODS.add_card({key = "j_osc_nunchucks_wizard"})
                play_sound("osc_wizard")
            end
        end
    end,
}

SMODS.Joker {
    key = "nunchucks_wizard",
    rarity = "osc_wizard",
    atlas = "osc_w2wizard",
    pos = {x = 2,y = 1},
    soul_pos = {x = 3,y = 1},
    cost = 40,
    immutable = true,

    calc_dollar_bonus = function(self, card)
        return G.GAME.dollars
    end
}

SMODS.Joker {
    key = "orb_gun",
    rarity = 3,
    atlas = "osc_w2wizard",
    pos = {x = 0,y = 2},
    soul_pos = {x = 1,y = 2},
    cost = 10,
    config = {
        extra = {
            chips = 0,
        },
        immutable = {
            requirement = 10^9
        }
    },

    loc_vars = function(self,info_queue,card)
        return { 
            vars = { card.ability.extra.chips, card.ability.immutable.requirement },
            key = self.key .. (card.ability.extra.chips >= card.ability.immutable.requirement and "_ready" or "")
        }
    end,

    calculate = function(self,card,context)
        if context.final_scoring_step and context.cardarea == G.jokers then
            card.ability.extra.chips = card.ability.extra.chips+SMODS.calculate_round_score()
            if card.ability.extra.chips >= card.ability.immutable.requirement then
                return {
                    message = "he's ready"
                }
            end
            return {
                message = card.ability.extra.chips .. "/" .. card.ability.immutable.requirement
            }
        end

        if context.selling_self then
            if card.ability.extra.chips >= card.ability.immutable.requirement then
                SMODS.add_card({key = "j_osc_gun_wizard"})
                play_sound("osc_wizard")
            end
        end
    end,
}

SMODS.Joker {
    key = "gun_wizard",
    rarity = "osc_wizard",
    atlas = "osc_w2wizard",
    pos = {x = 2,y = 2},
    soul_pos = {x = 3,y = 2},
    cost = 40,
    immutable = true,
    config = {
        extra = {
            xmult = 1
        }
    },

    calculate = function(self,card,context)
        if context.individual and context.cardarea == G.play then
            card.ability.extra.xmult = card.ability.extra.xmult + context.other_card:get_chip_bonus()
            return {
                message = localize("k_upgrade_ex"),
                card = card
            }
        end

        if context.joker_main then
            return {xmult = card.ability.extra.xmult}
        end

        if context.after and context.main_eval then
            card.ability.extra.xmult = 0
            return {message = localize("k_reset")}
        end
    end,
}

SMODS.Joker {
    key = "orb_p",
    rarity = 3,
    atlas = "osc_w2wizard",
    pos = {x = 0,y = 3},
    soul_pos = {x = 1,y = 3},
    cost = 10,
    config = {
        extra = {
            p = 0,
        },
        immutable = {
            requirement = 10
        }
    },

    loc_vars = function(self,info_queue,card)
        card.ability.extra.p = 0
        if G.jokers then
            for i,v in ipairs(G.jokers.cards) do
                if Oscillate.is_p(v) then
                    card.ability.extra.p = card.ability.extra.p + 1
                end
            end
        end
        return { 
            vars = { card.ability.extra.p, card.ability.immutable.requirement },
            key = self.key .. (card.ability.extra.p >= card.ability.immutable.requirement and "_ready" or "")
        }
    end,

    calculate = function(self,card,context)
        if context.card_added or context.joker_type_destroyed then
            card.ability.extra.p = 0
            for i,v in ipairs(G.jokers.cards) do
                if Oscillate.is_p(v) then
                    card.ability.extra.p = card.ability.extra.p + 1
                end
            end
            if card.ability.extra.p >= card.ability.immutable.requirement then
                return {
                    message = "he's ready"
                }
            end
        end

        if context.selling_self then
            if card.ability.extra.p >= card.ability.immutable.requirement then
                SMODS.add_card({key = "j_osc_p_wizard"})
                play_sound("osc_wizard")
            end
        end
    end,
}

SMODS.Joker {
    key = "p_wizard",
    rarity = "osc_wizard",
    atlas = "osc_w2wizard",
    pos = {x = 2,y = 3},
    soul_pos = {x = 3,y = 3},
    cost = 40,
    immutable = true,
    config = {
        extra = {
            xmult = 3,
            emult = 1.2
        }
    },

    loc_vars = function(self,info_queue,card)
        info_queue[#info_queue+1] = G.P_CENTERS.j_osc_p
        return { 
            vars = { card.ability.extra.xmult, card.ability.extra.emult },
        }
    end,

    calculate = function(self,card,context)
        if context.other_joker then
            if context.other_joker.config.center.key == "j_osc_p" then
                return { emult = card.ability.extra.emult }
            end
            if Oscillate.is_p(context.other_joker) then
                return { xmult = card.ability.extra.xmult }
            end
        end
    end,
}
