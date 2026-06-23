Oscillate.Joker {
    oscillate_wave = 3,
    key = "123",
    rarity = 1,
    atlas = "osc_w3crit",
    pos = {x=0,y=0},
    cost = 6,
    config = {
        extra = {
            critchance = 3
        },
        immutable = {
            added = 0
        }
    },

    loc_vars = function(self,info_queue,card)
        return { 
            vars = { card.ability.extra.critchance },
        }
    end,

    calculate = function(self,card,context)
        if context.joker_main then
            card.ability.immutable.added = card.ability.immutable.added + card.ability.extra.critchance
		    Oscillate.mod_crit(card.ability.extra.critchance, "chance", "add", card)
        end

        if context.end_of_round then
            Oscillate.mod_crit(-card.ability.immutable.added, "chance", "add", card, "Reset!")
            card.ability.immutable.added = 0
        end
    end,

    remove_from_deck = function(self, card, from_debuff)
        Oscillate.mod_crit(-card.ability.immutable.added, "chance", "add", card, nil, false)
    end,
}

Oscillate.Joker {
    oscillate_wave = 3,
    key = "crit_joker",
    rarity = 2,
    atlas = "osc_w3crit",
    pos = {x=1,y=0},
    cost = 8,
    config = {
        immutable = {
            critchance = 10
        }
    },

    loc_vars = function(self,info_queue,card)
        return { 
            vars = { card.ability.immutable.critchance },
        }
    end,

    add_to_deck = function(self, card, from_debuff)
        Oscillate.mod_crit(card.ability.immutable.critchance, "chance", "add", card, nil, false)
    end,

    remove_from_deck = function(self, card, from_debuff)
        Oscillate.mod_crit(-card.ability.immutable.critchance, "chance", "add", card, nil, false)
    end,
}

Oscillate.Joker {
    oscillate_wave = 3,
    key = "gambling_god",
    rarity = 3,
    atlas = "osc_w3crit",
    pos = {x=2,y=0},
    cost = 8,
    config = {
        immutable = {
            critamount = 2
        }
    },

    loc_vars = function(self,info_queue,card)
        return { 
            vars = { card.ability.immutable.critamount },
        }
    end,

    add_to_deck = function(self, card, from_debuff)
        Oscillate.mod_crit(card.ability.immutable.critamount, "amount", "add", card, nil, false)
    end,

    remove_from_deck = function(self, card, from_debuff)
        Oscillate.mod_crit(-card.ability.immutable.critamount, "amount", "add", card, nil, false)
    end,
}

Oscillate.Joker {
    oscillate_wave = 3,
    key = "IShowGambling",
    rarity = 2,
    atlas = "osc_w3crit",
    pos = {x=0,y=1},
    cost = 8,
    config = {
        extra = {
            critchance = 1
        },
        immutable = {
            added = 0
        }
    },

    loc_vars = function(self,info_queue,card)
        return { 
            vars = { card.ability.extra.critchance },
        }
    end,

    calculate = function(self,card,context)
        if context.individual and context.cardarea == G.play then
            card.ability.immutable.added = card.ability.immutable.added + card.ability.extra.critchance
		    Oscillate.mod_crit(card.ability.extra.critchance, "chance", "add", card)
        end

        if context.ante_end then
            Oscillate.mod_crit(-card.ability.immutable.added, "chance", "add", card, "Reset!")
            card.ability.immutable.added = 0
        end
    end,

    remove_from_deck = function(self, card, from_debuff)
        Oscillate.mod_crit(-card.ability.immutable.added, "chance", "add", card, nil, false)
    end,
}

Oscillate.Joker {
    oscillate_wave = 3,
    key = "FourClover",
    rarity = 4,
    atlas = "osc_w3crit",
    pos = {x=1,y=1},
    soul_pos = {x=1,y=2},
    cost = 20,
    config = {
        immutable = {
            critchance = 100
        },
    },

    loc_vars = function(self,info_queue,card)
        return { 
            vars = { card.ability.immutable.critchance },
        }
    end,

    add_to_deck = function(self, card, from_debuff)
        Oscillate.mod_crit(card.ability.immutable.critchance, "chance", "add", card, nil, false)
    end,

    remove_from_deck = function(self, card, from_debuff)
        Oscillate.mod_crit(-card.ability.immutable.critchance, "chance", "add", card, nil, false)
    end,
}

Oscillate.Joker {
    oscillate_wave = 3,
    key = "boomshakalaka",
    rarity = 2,
    atlas = "osc_w3crit",
    pos = {x=2,y=1},
    cost = 6,
    config = {
        extra = {
            critamount = 0.2
        },
        immutable = {
            added = 0
        }
    },

    loc_vars = function(self,info_queue,card)
        return { 
            vars = { card.ability.extra.critamount },
        }
    end,

    calculate = function(self,card,context)
        if context.joker_main then
            card.ability.immutable.added = card.ability.immutable.added + card.ability.extra.critamount
		    Oscillate.mod_crit(card.ability.extra.critamount, "amount", "add", card)
        end

        if context.ante_end then
            Oscillate.mod_crit(-card.ability.immutable.added, "amount", "add", card, "Reset!")
            card.ability.immutable.added = 0
        end
    end,

    remove_from_deck = function(self, card, from_debuff)
        Oscillate.mod_crit(-card.ability.immutable.added, "amount", "add", card, nil, false)
    end,
}