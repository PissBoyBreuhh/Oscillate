Oscillate.Joker {
    oscillate_wave = 3,
    key = "fdj",
    rarity = 1,
    atlas = "osc_w3fdj",
    pos = {x=0,y=0},
    cost = 3,
    config = {
        extra = {
            mult = 5
        }
    },

    loc_vars = function(self,info_queue,card)
        return {vars = {card.ability.extra.mult}}
    end,

    calculate = function(self,card,context)
        if context.joker_main then return {mult = card.ability.extra.mult} end
    end,
}

Oscillate.Joker {
    oscillate_wave = 3,
    key = "neon",
    rarity = 1,
    atlas = "osc_w3common",
    pos = {x=0,y=0},
    cost = 5,
    config = {
        extra = {
            xchips = 1.1
        }
    },

    loc_vars = function(self,info_queue,card)
        return {vars = {card.ability.extra.xchips}}
    end,

    calculate = function(self,card,context)
        if context.individual and context.cardarea == G.play then
            return {xchips = card.ability.extra.xchips}
        end
    end,

    add_to_deck = function(self, card, from_debuff)
        G.GAME.osc_neon = true
    end,

    remove_from_deck = function(self, card, from_debuff)
        G.GAME.osc_neon = false
    end,
}

Oscillate.Joker {
    oscillate_wave = 3,
    key = "badge",
    rarity = 1,
    atlas = "osc_w3common",
    pos = {x=1,y=0},
    cost = 5,
    config = {
        extra = {
            gain = 0.2,
        },
        badges = {

        }
    },

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.gain, card.ability.extra.gain * #card.ability.badges}}
    end,

 	set_badges = function(self, card, badges)
        local function get_color()
            return pseudorandom_element({G.C.RED, G.C.BLUE, G.C.GREEN, G.C.GOLD, G.C.PURPLE, G.C.WHITE, G.C.EDITION, G.C.FILTER, G.C.DARK_EDITION}, "badge")
        end

        local first, second = 
        {"Super", "Crazily", "Insanely", "Awesomely", "Exactly", "Oscillatingly", "So So So", "Magically", "Extremely", "Eternally"},
        {"Super", "Cool", "Insane", "Awesome", "Exact", "Oscillating", "Magical", "Extreme", "Fire", "Eternal", "P Joker"}

        table.insert(card.ability.badges, 1, {pseudorandom_element(first, "badge") .. " " .. pseudorandom_element(second, "badge"), get_color(), get_color(), pseudorandom("badge") + 0.8})

        badges[#badges+1] = Oscillate.get_badge(3)
        for i = 1, #card.ability.badges do
            badges[#badges+1] = create_badge(card.ability.badges[i][1], card.ability.badges[i][2], card.ability.badges[i][3], card.ability.badges[i][4])
        end
        
 	end,

    calculate = function(self,card,context)
        if context.joker_main then
            return {chips = card.ability.extra.gain * #card.ability.badges}
        end
    end,
}

Oscillate.Joker {
    oscillate_wave = 3,
    key = "jokerback",
    rarity = 1,
    atlas = "osc_w3common",
    pos = {x=0,y=1},
    cost = 5,
    config = {
        extra = {
            nult = -2,
            mult = 6,
            stage = false
        }
    },

    loc_vars = function(self,info_queue,card)
        return {vars = {card.ability.extra.nult,card.ability.extra.mult}}
    end,

    calculate = function(self,card,context)
        if context.individual and context.cardarea == G.play then 
            card.ability.extra.stage = not card.ability.extra.stage
            return {mult = card.ability.extra.stage and card.ability.extra.mult or card.ability.extra.nult} 
        end
    end,
}

Oscillate.Joker {
    oscillate_wave = 3,
    key = "radiance",
    rarity = 1,
    atlas = "osc_w3common",
    pos = {x=1,y=1},
    cost = 3,
    config = {
        extra = {
            mult = 1.5,
        }
    },

    loc_vars = function(self,info_queue,card)
        return {vars = {card.ability.extra.mult}}
    end,

    calculate = function(self,card,context)
        if context.individual and context.cardarea == G.play then 
            return {mult = card.ability.extra.mult} 
        end
    end,
}