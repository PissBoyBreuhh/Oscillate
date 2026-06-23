Oscillate.is_p = function(card)
    if card.config.center.is_p then
        return true
    end
    for i,v in ipairs(G.jokers.cards) do
        if v.ability.name == "j_osc_pree" then
            return true
        end
    end
    return false
end

Oscillate.Joker {
    oscillate_wave = 3,
    key = "q",
    rarity = 2,
    atlas = "w3p",
    pos = {x=0,y=0},
    is_p_joker = true,
    is_p = true,
    cost = 6,
    config = {
        extra = {
            mult = 4
        },
    },

 	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('k_osc_p'), G.C.FILTER, G.C.WHITE, 0.6 )
        badges[#badges+1] = Oscillate.get_badge(3)
 	end,

    loc_vars = function(self,info_queue,card)
        info_queue[#info_queue+1] = G.P_CENTERS.j_osc_p
        return { 
            vars = { card.ability.extra.mult },
        }
    end,

    calculate = function(self,card,context)
        if context.joker_main then
            local mult = 0
            for i,v in ipairs(G.jokers.cards) do
                if Oscillate.is_p(v) then
                    mult = mult + card.ability.extra.mult
                end
            end
            return {mult = mult}
        end
    end,
}

Oscillate.Joker {
    oscillate_wave = 3,
    key = "d",
    rarity = "osc_blursed",
    atlas = "w3p",
    pos = {x=1,y=0},
    is_p_joker = true,
    is_p = true,
    cost = 2,
    config = {
        extra = {
            chips = 16
        },
    },

 	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('k_osc_p'), G.C.FILTER, G.C.WHITE, 0.6 )
        badges[#badges+1] = Oscillate.get_badge(3)
 	end,

    loc_vars = function(self,info_queue,card)
        info_queue[#info_queue+1] = G.P_CENTERS.j_osc_p
        return { 
            vars = { card.ability.extra.chips },
        }
    end,

    calculate = function(self,card,context)
        if context.other_joker then
            if Oscillate.is_p(context.other_joker) then
                return {chips = card.ability.extra.chips, message_card = context.other_joker}
            end
            
        end
    end,
}

Oscillate.Joker {
    oscillate_wave = 3,
    key = "b",
    rarity = 3,
    atlas = "w3p",
    pos = {x=2,y=0},
    is_p_joker = true,
    is_p = true,
    cost = 9,
    config = {
        extra = {
            xmult = 1.5
        },
    },

 	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('k_osc_p'), G.C.FILTER, G.C.WHITE, 0.6 )
        badges[#badges+1] = Oscillate.get_badge(3)
 	end,

    loc_vars = function(self,info_queue,card)
        info_queue[#info_queue+1] = G.P_CENTERS.j_osc_p
        return { 
            vars = { card.ability.extra.xmult },
        }
    end,

    calculate = function(self,card,context)
        if context.other_joker then
            if Oscillate.is_p(context.other_joker) then
                return {Xmult = card.ability.extra.xmult, message_card = context.other_joker}
            end       
        end
    end,
}

Oscillate.Joker {
    oscillate_wave = 3,
    key = "pree",
    rarity = 2,
    atlas = "w3p",
    pos = {x=0,y=1},
    is_p_joker = true,
    is_p = true,
    cost = 5,

 	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('k_osc_p'), G.C.FILTER, G.C.WHITE, 0.6 )
        badges[#badges+1] = Oscillate.get_badge(3)
 	end,
}

Oscillate.Joker {
    oscillate_wave = 3,
    key = "payee",
    rarity = 3,
    atlas = "w3p",
    pos = {x=1,y=1},
    is_p_joker = true,
    cost = 8,
    config = {
        extra = {
            mult = 6,
            xmult = 2,
            mult_p = 1,
            xmult_p = 0.5
        }
    },

    loc_vars = function(self,info_queue,card)
        info_queue[#info_queue+1] = G.P_CENTERS.j_osc_p
        return { 
            vars = { card.ability.extra.mult, card.ability.extra.xmult, card.ability.extra.mult_p, card.ability.extra.xmult_p },
        }
    end,

 	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('k_osc_p'), G.C.FILTER, G.C.WHITE, 0.6 )
        badges[#badges+1] = Oscillate.get_badge(3)
 	end,

    calculate = function(self,card,context)
        if context.joker_main then
            local count = 0
            for i,v in ipairs(G.jokers.cards) do
                if Oscillate.is_p(v) then
                    count = count + 1
                end
            end  

            local mult, xmult = 0, 1

            if count > 0 then mult = mult + card.ability.extra.mult end
            if count > 1 then xmult = card.ability.extra.xmult end
            if count > 3 then mult = mult + card.ability.extra.mult_p * count end
            if count > 4 then xmult = xmult + card.ability.extra.xmult_p * count end

            return {
                mult = mult,
                xmult = xmult
            }
        end
    end,
}

Oscillate.Joker {
    oscillate_wave = 3,
    key = "prix",
    rarity = 2,
    atlas = "w3p",
    pos = {x=2,y=1},
    is_p_joker = true,
    is_p = true,
    cost = 7,
    config = {
        extra = {
            critchance = 0.2
        },
    },

 	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('k_osc_p'), G.C.FILTER, G.C.WHITE, 0.6 )
        badges[#badges+1] = Oscillate.get_badge(3)
 	end,

    loc_vars = function(self,info_queue,card)
        return { 
            vars = { card.ability.extra.critchance },
        }
    end,

    calculate = function(self,card,context)
        if context.other_joker then
            if Oscillate.is_p_joker(context.other_joker) then
                Oscillate.mod_crit(card.ability.extra.critchance, "chance", "add", card)
            end   
        end
    end,
}

Oscillate.Joker {
    oscillate_wave = 3,
    key = "plea",
    rarity = 1,
    atlas = "w3p",
    pos = {x=0,y=2},
    is_p_joker = true,
    is_p = true,
    cost = 5,
    config = {
        immutable = {
            copies = 2
        },
    },

 	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('k_osc_p'), G.C.FILTER, G.C.WHITE, 0.6 )
        badges[#badges+1] = Oscillate.get_badge(3)
 	end,

    loc_vars = function(self,info_queue,card)
        info_queue[#info_queue+1] = {set = "Other", key = "osc_true_p"}
        return { 
            vars = { card.ability.immutable.copies },
        }
    end,

    calculate = function(self,card,context)
        if context.joker_main then
            local count = 0
            for i,v in ipairs(G.jokers.cards) do
                if Oscillate.is_p_joker(v) then
                    count = count + 1
                end
            end 
            
            if count >= 5 then
                for i = 1, card.ability.immutable.copies do
                    G.E_MANAGER:add_event(Event({
                    func = function()
                        local key = pseudorandom_element(Oscillate.true_p, "so peam")
                        SMODS.add_card({key = key, allow_duplicates = true, edition = "e_negative"})
                        return true
                    end
                    }))
                end
                SMODS.destroy_cards(card)
            end
        end
    end,
}