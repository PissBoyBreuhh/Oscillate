Oscillate.Joker {
    oscillate_wave = 4,
    key = "p_bee",
    rarity = 1,
    atlas = "osc_w4p",
    pos = {x=0,y=0},
    is_p_joker = true,
    cost = 4,
    config = {
        extra = {
            chips = 20
        },
    },

 	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('k_osc_p'), G.C.FILTER, G.C.WHITE, 0.6 )
 	end,

    loc_vars = function(self,info_queue,card)
        return { 
            vars = { card.ability.extra.chips },
        }
    end,

    calculate = function(self,card,context)
        if context.joker_main then
            local chips = 0
            for i,v in ipairs(G.jokers.cards) do
                if Oscillate.is_p_joker(v) or v.config.center.is_bee then
                    chips = chips + card.ability.extra.chips
                end
            end
            return {chips = chips}
        end
    end,
}

Oscillate.Joker {
    oscillate_wave = 4,
    key = "balloon_boy",
    rarity = 2,
    atlas = "osc_w4p",
    pos = {x=1,y=0},
    is_p_joker = true,
    cost = 4,
    config = {
        extra = {
            mult = 0,
            gain = 1,
            maxmult = 15
        },
    },

 	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('k_osc_p'), G.C.FILTER, G.C.WHITE, 0.6 )
 	end,

    loc_vars = function(self,info_queue,card)
        return { 
            vars = { card.ability.extra.mult, card.ability.extra.gain, card.ability.extra.maxmult },
        }
    end,

    calculate = function(self,card,context)
        if context.other_joker then
            if Oscillate.is_p(context.other_joker) then
                card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.gain
                if card.ability.extra.mult > card.ability.extra.maxmult then
                    card.ability.extra.mult = 0
                end
                return {mult = card.ability.extra.mult}
            end
        end
    end,
}

Oscillate.Joker {
    oscillate_wave = 4,
    key = "dd",
    rarity = "osc_blursed",
    atlas = "osc_w4p",
    pos = {x=2,y=0},
    is_p_joker = true,
    cost = 4,
    config = {
        extra = {
            mult = 5,
            nult = -3
        },
    },

 	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('k_osc_p'), G.C.FILTER, G.C.WHITE, 0.6 )
 	end,

    loc_vars = function(self,info_queue,card)
        return { 
            vars = { card.ability.extra.mult, card.ability.extra.nult },
        }
    end,

    calculate = function(self,card,context)
        if context.other_joker then
            if Oscillate.is_p_joker(context.other_joker) then
                if pseudorandom("fuckass fucking dee dee istg") > 0.5 then
                    return {mult = card.ability.extra.mult}
                else return {mult = card.ability.extra.nult} end
            end
        end
    end,
}