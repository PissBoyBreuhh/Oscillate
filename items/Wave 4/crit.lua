Oscillate.Joker {
    oscillate_wave = 4,
    oscillate_info = {
        crit = true
    },
    key = "d2",
    rarity = 1,
    atlas = "osc_w4crit",
    pos = {x=0,y=0},
    cost = 4,
    config = {
        extra = {
            critchance = 2,
            critpower = 0.5
        },
        immutable = {
            addedcrit = 0,
            addedpower = 0
        }
    },

    loc_vars = function(self,info_queue,card)
        return { 
            vars = { card.ability.extra.critchance,card.ability.extra.critpower },
        }
    end,

    calculate = function(self,card,context)
        if context.joker_main then
            if pseudorandom("d2") < 0.5 then
                card.ability.immutable.addedcrit = card.ability.immutable.addedcrit + card.ability.extra.critchance
                return{osc_crit = card.ability.extra.critchance}
            else
                card.ability.immutable.addedpower = card.ability.immutable.addedpower + card.ability.extra.critpower
                return{osc_power = card.ability.extra.critpower}
            end
        end

        if context.end_of_round then
            local temp1,temp2 = -card.ability.immutable.addedpower, -card.ability.immutable.addedcrit
            card.ability.immutable.addedpower = 0
            card.ability.immutable.addedcrit = 0
            return{osc_crit = temp2, osc_power = temp1, crit_message = localize("k_reset")}
        end
    end,

    remove_from_deck = function(self, card, from_debuff)
        return{osc_crit = -card.ability.immutable.addedcrit, osc_power = -card.ability.immutable.addedpower, crit_message = localize("k_reset")}
    end,
}

Oscillate.Joker {
    oscillate_wave = 4,
    oscillate_info = {
        crit = true
    },
    key = "d4",
    rarity = 1,
    atlas = "osc_w4crit",
    pos = {x=1,y=0},
    cost = 5,
    config = {
        extra = {
            critchance = 2,
        },
        immutable = {
            added = 0,
        }
    },

    loc_vars = function(self,info_queue,card)
        return { 
            vars = { card.ability.extra.critchance },
        }
    end,

    calculate = function(self,card,context)
        if context.joker_main then
            local roll = pseudorandom("d4", 1, 4)

            card.ability.immutable.added = card.ability.immutable.added + roll * card.ability.extra.critchance
            return {osc_crit = roll * card.ability.extra.critchance}
        end

        if context.end_of_round then
            local temp = -card.ability.immutable.added
            card.ability.immutable.added = 0
            return {osc_crit = temp, crit_message = localize("k_reset")}
        end
    end,

    remove_from_deck = function(self, card, from_debuff)
        return {osc_crit = -card.ability.immutable.added, crit_message = localize("k_reset")}
    end,
}

Oscillate.Joker {
    oscillate_wave = 4,
    oscillate_info = {
        crit = true
    },
    key = "d6",
    rarity = 1,
    atlas = "osc_w4crit",
    pos = {x=2,y=0},
    cost = 5,
    config = {
        extra = {
            critpower = 4,
        },
        immutable = {
            added = 0,
        }
    },

    loc_vars = function(self,info_queue,card)
        return { 
            vars = { card.ability.extra.critpower },
        }
    end,

    calculate = function(self,card,context)
        if context.joker_main then
            local roll = pseudorandom("d6", 1, 6)

            card.ability.immutable.added = card.ability.immutable.added + roll / card.ability.extra.critpower
            return {osc_power = roll / card.ability.extra.critpower}
        end

        if context.end_of_round then
            local temp = -card.ability.immutable.added
            card.ability.immutable.added = 0
            return {osc_power = temp, crit_message = localize("k_reset")}
        end
    end,

    remove_from_deck = function(self, card, from_debuff)
        return {osc_power = -card.ability.immutable.added, crit_message = localize("k_reset")}
    end,
}

Oscillate.Joker {
    oscillate_wave = 4,
    oscillate_info = {
        crit = true
    },
    key = "d8",
    rarity = 2,
    atlas = "osc_w4crit",
    pos = {x=3,y=0},
    cost = 7,
    config = {
        extra = {
            critchance = 4,
        },
        immutable = {
            added = 0,
        }
    },

    loc_vars = function(self,info_queue,card)
        return { 
            vars = { card.ability.extra.critchance },
        }
    end,

    calculate = function(self,card,context)
        if context.joker_main then
            local roll = pseudorandom("d8", 1, 8)

            card.ability.immutable.added = card.ability.immutable.added + roll
            return {osc_power = roll/10, osc_crit = roll}
        end

        if context.end_of_round then
            local temp = -card.ability.immutable.added
            card.ability.immutable.added = 0
            return {osc_power = temp/10, osc_crit = temp, crit_message = localize("k_reset")}
        end
    end,

    remove_from_deck = function(self, card, from_debuff)
        return {osc_power = -card.ability.immutable.added/10, osc_crit = -card.ability.immutable.added, crit_message = localize("k_reset")}
    end,
}

Oscillate.Joker {
    oscillate_wave = 4,
    oscillate_info = {
        crit = true
    },
    key = "d10",
    rarity = 3,
    atlas = "osc_w4crit",
    pos = {x=0,y=1},
    cost = 8,
    config = {
        extra = {
            critpower = 10,
        },
        immutable = {
            added = 0,
        }
    },

    loc_vars = function(self,info_queue,card)
        return { 
            vars = { card.ability.extra.critpower },
        }
    end,

    calculate = function(self,card,context)
        if context.joker_main then
            local roll = pseudorandom("d10", 1, 10)

            card.ability.immutable.added = card.ability.immutable.added + roll/card.ability.extra.critpower
            return {osc_power = roll/card.ability.extra.critpower, xmult = G.GAME.osc_critamount}
        end

        if context.end_of_round then
            local temp = -card.ability.immutable.added
            card.ability.immutable.added = 0
            return {osc_power = temp, crit_message = localize("k_reset")}
        end
    end,

    remove_from_deck = function(self, card, from_debuff)
        return {osc_power = -card.ability.immutable.added, crit_message = localize("k_reset")}
    end,
}

Oscillate.Joker {
    oscillate_wave = 4,
    oscillate_info = {
        crit = true
    },
    key = "d12",
    rarity = 3,
    atlas = "osc_w4crit",
    pos = {x=1,y=1},
    cost = 8,
    config = {
        extra = {
            critchance = 1,
        },
        immutable = {
            added = 0,
        }
    },

    loc_vars = function(self,info_queue,card)
        return { 
            vars = { card.ability.extra.critchance },
        }
    end,

    calculate = function(self,card,context)
        if context.joker_main then
            local roll = pseudorandom("d10", 1, 10)

            card.ability.immutable.added = card.ability.immutable.added + roll
            return {osc_crit = roll, xchips = 1 + (G.GAME.osc_critchance * 100)}
        end

        if context.end_of_round then
            local temp = -card.ability.immutable.added
            card.ability.immutable.added = 0
            return {osc_crit = temp, crit_message = localize("k_reset")}
        end
    end,

    remove_from_deck = function(self, card, from_debuff)
        return {osc_critchance = -card.ability.immutable.added, crit_message = localize("k_reset")}
    end,
}