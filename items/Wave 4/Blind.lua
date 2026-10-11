SMODS.Blind {
    key = "stamp",
    atlas = "osc_w4blinds",
    pos = {x=0,y=0},
    dollars = 6,
    mult = 2.5,
    boss = {min = 2},
    boss_colour = Oscillate.badge_colour,

    recalc_debuff = function(self, card, from_blind)
        if card.seal then
            return true
        end
    end,
}

SMODS.Blind {
    key = "toilet",
    atlas = "osc_w4blinds",
    pos = {x=0,y=1},
    dollars = 5,
    mult = 3,
    boss = {min = 4},
    boss_colour = HEX("45de3a"),

    drawn_to_hand = function(self)
        for i,v in ipairs(G.jokers.cards) do
            if Oscillate.is_p_joker(v) then
                v:set_debuff(true)
            end
        end
    end,
}

SMODS.Blind {
    key = "break",
    atlas = "osc_w4blinds",
    pos = {x=0,y=2},
    dollars = 4,
    mult = 2,
    boss_colour = HEX("ff9333"),

    drawn_to_hand = function(self)
        for i,v in ipairs(G.jokers.cards) do
            if v.config.center.from_oscillate then
                v:set_debuff(true)
            end
        end
    end,
}