SMODS.ConsumableType {
    key = "osc_song",
    primary_colour = HEX("e3a754"),
	secondary_colour = HEX("ed885c"),
    collection_rows = {5,5,5},
    shop_rate = 0.1,
    default = "c_osc_badassery",
    can_stack = true,
	can_divide = true,
}
G.C.OSC_SONG = HEX("e3a754")

Oscillate.Apply_Seal = function(cards, seal)
    for i=1, #cards do
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.11,
            func = function() 
                cards[i]:set_seal(seal)
                return true 
            end 
        }))
    end
end

SMODS.Consumable {
    set = "osc_song",
    key = "badassery",
    atlas = "osc_w4songs",
    pos = {x = 2, y = 1},
    cost = 6,

    config = {
        cards = 2
    },

    set_badges = function(self, card, badges)
        badges[#badges+1] = Oscillate.get_song_badge("unholyness")
    end,

    loc_vars = function(self,info_queue,card)
        info_queue[#info_queue+1] = G.P_SEALS.Red
        return {vars = {card.ability.cards}}
    end,

    can_use = function(self,card)
        if G.hand and (0 < #G.hand.highlighted and #G.hand.highlighted <= card.ability.cards) then 
            return true 
        end
    end,

    use = function(self,card,area,copier)
        Oscillate.Apply_Seal(G.hand.highlighted, "Red")
    end
}

SMODS.Consumable {
    set = "osc_song",
    key = "guitar_solo",
    atlas = "osc_w4songs",
    pos = {x = 7, y = 3},
    cost = 6,

    config = {
        cards = 2
    },

    set_badges = function(self, card, badges)
        badges[#badges+1] = Oscillate.get_song_badge("unholyness")
    end,

    loc_vars = function(self,info_queue,card)
        info_queue[#info_queue+1] = G.P_SEALS.Blue
        return {vars = {card.ability.cards}}
    end,

    can_use = function(self,card)
        if G.hand and (0 < #G.hand.highlighted and #G.hand.highlighted <= card.ability.cards) then 
            return true 
        end
    end,

    use = function(self,card,area,copier)
        Oscillate.Apply_Seal(G.hand.highlighted, "Blue")
    end
}

SMODS.Consumable {
    set = "osc_song",
    key = "brian_ccancer",
    atlas = "osc_w4songs",
    pos = {x = 6, y = 0},
    cost = 6,

    config = {
        cards = 2
    },

    set_badges = function(self, card, badges)
        badges[#badges+1] = Oscillate.get_song_badge("unholyness")
    end,

    loc_vars = function(self,info_queue,card)
        info_queue[#info_queue+1] = G.P_SEALS.Purple
        return {vars = {card.ability.cards}}
    end,

    can_use = function(self,card)
        if G.hand and (0 < #G.hand.highlighted and #G.hand.highlighted <= card.ability.cards) then 
            return true 
        end
    end,

    use = function(self,card,area,copier)
        Oscillate.Apply_Seal(G.hand.highlighted, "Purple")
    end
}

SMODS.Consumable {
    set = "osc_song",
    key = "me_and_boys",
    atlas = "osc_w4songs",
    pos = {x = 5, y = 2},
    cost = 6,

    config = {
        cards = 2
    },

    set_badges = function(self, card, badges)
        badges[#badges+1] = Oscillate.get_song_badge("unholyness")
    end,

    loc_vars = function(self,info_queue,card)
        info_queue[#info_queue+1] = G.P_SEALS.Gold
        return {vars = {card.ability.cards}}
    end,

    can_use = function(self,card)
        if G.hand and (0 < #G.hand.highlighted and #G.hand.highlighted <= card.ability.cards) then 
            return true 
        end
    end,

    use = function(self,card,area,copier)
        Oscillate.Apply_Seal(G.hand.highlighted, "Gold")
    end
}

SMODS.Consumable {
    set = "osc_song",
    key = "peter_griffin",
    atlas = "osc_w4songs",
    pos = {x = 5, y = 1},
    cost = 6,

    config = {
        cards = 2
    },

    set_badges = function(self, card, badges)
        badges[#badges+1] = Oscillate.get_song_badge("unholyness")
    end,

    loc_vars = function(self,info_queue,card)
        info_queue[#info_queue+1] = G.P_SEALS.osc_incubus
        return {vars = {card.ability.cards}}
    end,

    can_use = function(self,card)
        if G.hand and (0 < #G.hand.highlighted and #G.hand.highlighted <= card.ability.cards) then 
            return true 
        end
    end,

    use = function(self,card,area,copier)
        Oscillate.Apply_Seal(G.hand.highlighted, "osc_incubus")
    end
}

SMODS.Consumable {
    set = "osc_song",
    key = "fall_down",
    atlas = "osc_w4songs",
    pos = {x = 6, y = 2},
    cost = 6,

    config = {
        cards = 2
    },

    set_badges = function(self, card, badges)
        badges[#badges+1] = Oscillate.get_song_badge("unholyness")
    end,

    loc_vars = function(self,info_queue,card)
        info_queue[#info_queue+1] = G.P_SEALS.osc_pink
        return {vars = {card.ability.cards}}
    end,

    can_use = function(self,card)
        if G.hand and (0 < #G.hand.highlighted and #G.hand.highlighted <= card.ability.cards) then 
            return true 
        end
    end,

    use = function(self,card,area,copier)
        Oscillate.Apply_Seal(G.hand.highlighted, "osc_pink")
    end
}

SMODS.Consumable {
    set = "osc_song",
    key = "divine",
    atlas = "osc_w4songs",
    pos = {x = 9, y = 0},
    cost = 6,

    config = {
        cards = 2
    },

    set_badges = function(self, card, badges)
        badges[#badges+1] = Oscillate.get_song_badge("unholyness")
    end,

    loc_vars = function(self,info_queue,card)
        info_queue[#info_queue+1] = G.P_SEALS.osc_white
        return {vars = {card.ability.cards}}
    end,

    can_use = function(self,card)
        if G.hand and (0 < #G.hand.highlighted and #G.hand.highlighted <= card.ability.cards) then 
            return true 
        end
    end,

    use = function(self,card,area,copier)
        Oscillate.Apply_Seal(G.hand.highlighted, "osc_white")
    end
}

SMODS.Consumable {
    set = "osc_song",
    key = "golden_badassery",
    atlas = "osc_w4songs",
    pos = {x = 7, y = 1},
    cost = 6,

    config = {
        cards = 2
    },

    set_badges = function(self, card, badges)
        badges[#badges+1] = Oscillate.get_song_badge("tapes")
    end,

    loc_vars = function(self,info_queue,card)
        info_queue[#info_queue+1] = G.P_SEALS.osc_golden_red
        return {vars = {card.ability.cards}}
    end,

    can_use = function(self,card)
        if G.hand and (0 < #G.hand.highlighted and #G.hand.highlighted <= card.ability.cards) then 
            return true 
        end
    end,

    use = function(self,card,area,copier)
        Oscillate.Apply_Seal(G.hand.highlighted, "osc_golden_red")
    end
}

SMODS.Consumable {
    set = "osc_song",
    key = "bedtime_story",
    atlas = "osc_w4songs",
    pos = {x = 3, y = 0},
    cost = 6,

    config = {
        cards = 2
    },

    set_badges = function(self, card, badges)
        badges[#badges+1] = Oscillate.get_song_badge("congregation")
    end,

    loc_vars = function(self,info_queue,card)
        info_queue[#info_queue+1] = G.P_SEALS.osc_sleepy
        return {vars = {card.ability.cards}}
    end,

    can_use = function(self,card)
        if G.hand and (0 < #G.hand.highlighted and #G.hand.highlighted <= card.ability.cards) then 
            return true 
        end
    end,

    use = function(self,card,area,copier)
        Oscillate.Apply_Seal(G.hand.highlighted, "osc_sleepy")
    end
}

SMODS.Consumable {
    set = "osc_song",
    key = "hair",
    atlas = "osc_w4songs",
    pos = {x = 0, y = 2},
    cost = 6,

    config = {
        cards = 2
    },

    set_badges = function(self, card, badges)
        badges[#badges+1] = Oscillate.get_song_badge("unholyness")
    end,

    loc_vars = function(self,info_queue,card)
        info_queue[#info_queue+1] = G.P_SEALS.osc_honey
        return {vars = {card.ability.cards}}
    end,

    can_use = function(self,card)
        if G.hand and (0 < #G.hand.highlighted and #G.hand.highlighted <= card.ability.cards) then 
            return true 
        end
    end,

    use = function(self,card,area,copier)
        Oscillate.Apply_Seal(G.hand.highlighted, "osc_honey")
    end
}

SMODS.Consumable {
    set = "osc_song",
    key = "hell_tape",
    atlas = "osc_w4songs",
    pos = {x = 8, y = 3},
    cost = 6,

    config = {
        cards = 2
    },

    set_badges = function(self, card, badges)
        badges[#badges+1] = Oscillate.get_song_badge("unholyness")
    end,

    loc_vars = function(self,info_queue,card)
        info_queue[#info_queue+1] = G.P_SEALS.osc_hell
        return {vars = {card.ability.cards}}
    end,

    can_use = function(self,card)
        if G.hand and (0 < #G.hand.highlighted and #G.hand.highlighted <= card.ability.cards) then 
            return true 
        end
    end,

    use = function(self,card,area,copier)
        Oscillate.Apply_Seal(G.hand.highlighted, "osc_hell")
    end
}

SMODS.Consumable {
    set = "osc_song",
    key = "culmination",
    atlas = "osc_w4songs",
    pos = {x = 4, y = 3},
    cost = 6,

    config = {
        cards = 2
    },

    set_badges = function(self, card, badges)
        badges[#badges+1] = Oscillate.get_song_badge("tapes")
    end,

    loc_vars = function(self,info_queue,card)
        info_queue[#info_queue+1] = G.P_SEALS["osc_seal?"]
        return {vars = {card.ability.cards}}
    end,

    can_use = function(self,card)
        if G.hand and (0 < #G.hand.highlighted and #G.hand.highlighted <= card.ability.cards) then 
            return true 
        end
    end,

    use = function(self,card,area,copier)
        Oscillate.Apply_Seal(G.hand.highlighted, "osc_seal?")
    end
}

SMODS.Consumable {
    set = "osc_song",
    key = "noisum_maximum",
    atlas = "osc_w4songs",
    pos = {x = 2, y = 3},
    cost = 6,

    config = {
        cards = 2
    },

    set_badges = function(self, card, badges)
        badges[#badges+1] = Oscillate.get_song_badge("tapes")
    end,

    loc_vars = function(self,info_queue,card)
        return {vars = {card.ability.cards}}
    end,

    can_use = function(self,card)
        return true 
    end,

    use = function(self,card,area,copier)
        for i = 1, math.min(card.ability.cards,20) do
            G.E_MANAGER:add_event(Event({
            func = function()
                SMODS.add_card({set = "osc_song", area = G.consumeables})
                card:juice_up(0.5,0.5)
            return true end
        }))  
        end
    end
}

SMODS.Consumable {
    set = "osc_song",
    key = "idk",
    atlas = "osc_w4songs",
    pos = {x = 1, y = 2},
    cost = 6,

    set_badges = function(self, card, badges)
        badges[#badges+1] = Oscillate.get_song_badge("unholyness")
    end,

    loc_vars = function(self,info_queue,card)
        info_queue[#info_queue+1] = G.P_SEALS.osc_dummy
    end,

    can_use = function(self,card)
        if G.hand.cards then 
            return true 
        end
    end,

    use = function(self,card,area,copier)
        Oscillate.Apply_Seal(G.hand.cards, "osc_dummy")
    end
}

SMODS.Consumable {
    set = "osc_song",
    key = "epic",
    atlas = "osc_w4songs",
    pos = {x = 5, y = 3},
    cost = 6,

    config = {
        chance = 3
    },

    set_badges = function(self, card, badges)
        badges[#badges+1] = Oscillate.get_song_badge("unholyness")
    end,

    loc_vars = function(self,info_queue,card)
        info_queue[#info_queue+1] = G.P_SEALS.osc_dummy
        info_queue[#info_queue+1] = G.P_SEALS["osc_seal?"]
        return{vars = {card.ability.chance}}
    end,

    can_use = function(self,card)
        if G.deck.cards then 
            return true 
        end
    end,

    use = function(self,card,area,copier)
        for i,v in ipairs(G.deck.cards) do
            if pseudorandom("epic") < 1/card.ability.chance and v:get_seal() == "osc_dummy" then
                Oscillate.Apply_Seal({v}, "osc_seal?")
            end
        end
    end
}

SMODS.Consumable {
    set = "osc_song",
    key = "fuckwad",
    atlas = "osc_w4songs",
    pos = {x = 1, y = 1},
    cost = 6,

    set_badges = function(self, card, badges)
        badges[#badges+1] = Oscillate.get_song_badge("unholyness")
    end,

    loc_vars = function(self,info_queue,card)
        info_queue[#info_queue+1] = G.P_SEALS.Red
        info_queue[#info_queue+1] = G.P_SEALS.Gold
        info_queue[#info_queue+1] = G.P_SEALS.osc_golden_red
    end,

    can_use = function(self,card)
        if G.deck.cards then 
            return true 
        end
    end,

    use = function(self,card,area,copier)
        for i,v in ipairs(G.deck.cards) do
            if v:get_seal() == "Red" or v:get_seal() == "Gold" then
                Oscillate.Apply_Seal({v}, "osc_golden_red")
            end
        end
    end
}

SMODS.Consumable {
    set = "osc_song",
    key = "bells",
    atlas = "osc_w4songs",
    pos = {x = 5, y = 0},
    cost = 6,

    set_badges = function(self, card, badges)
        badges[#badges+1] = Oscillate.get_song_badge("tapes")
    end,

    can_use = function(self,card)
        if G.hand then 
            return true 
        end
    end,

    use = function(self,card,area,copier)
        for i,v in ipairs(G.hand.cards) do
            if v.seal then
                local left,right = G.hand.cards[i-1], G.hand.cards[i+1]
                if left then Oscillate.Apply_Seal({left}, v.seal) end
                if right then Oscillate.Apply_Seal({right}, v.seal) end
            end
        end
    end
}

SMODS.Consumable {
    set = "osc_song",
    key = "bells_el",
    atlas = "osc_w4songs",
    pos = {x = 4, y = 0},
    cost = 6,

    set_badges = function(self, card, badges)
        badges[#badges+1] = Oscillate.get_song_badge("congregation")
    end,

    can_use = function(self,card)
        if G.hand then 
            return true 
        end
    end,

    use = function(self,card,area,copier)
        local seals = {}
        for i,v in ipairs(G.hand.cards) do
            if v.seal then
                table.insert(seals, v)
            end
            
        end

        if #seals > 0 then
            local seal = pseudorandom_element(seals, "BELLS OF GOD")
            Oscillate.Apply_Seal(G.hand.cards, seal.seal)
        end
    end
}

SMODS.Consumable {
    set = "osc_song",
    key = "blurry",
    atlas = "osc_w4songs",
    pos = {x = 3, y = 1},
    cost = 6,

    config = {
        cards = 2
    },

    set_badges = function(self, card, badges)
        badges[#badges+1] = Oscillate.get_song_badge("unholyness")
    end,

    loc_vars = function(self,info_queue,card)
        info_queue[#info_queue+1] = G.P_SEALS.osc_dummy
        info_queue[#info_queue+1] = G.P_SEALS.Red
        return {vars = {card.ability.cards}}
    end,

    can_use = function(self,card)
        if G.hand then 
            return true 
        end
    end,

    use = function(self,card,area,copier)
        for i,v in ipairs(G.hand.cards) do
            if v:get_seal() == "osc_dummy" then
                Oscillate.Apply_Seal({v}, "Red")
            end
        end
    end
}

SMODS.Consumable {
    set = "osc_song",
    key = "guitar_song",
    atlas = "osc_w4songs",
    pos = {x = 8, y = 1},
    cost = 6,

    config = {
        cards = 2
    },

    set_badges = function(self, card, badges)
        badges[#badges+1] = Oscillate.get_song_badge("congregation")
    end,

    loc_vars = function(self,info_queue,card)
        info_queue[#info_queue+1] = G.P_SEALS.osc_dummy
        info_queue[#info_queue+1] = G.P_SEALS.Blue
        return {vars = {card.ability.cards}}
    end,

    can_use = function(self,card)
        if G.hand then 
            return true 
        end
    end,

    use = function(self,card,area,copier)
        for i,v in ipairs(G.hand.cards) do
            if v:get_seal() == "osc_dummy" then
                Oscillate.Apply_Seal({v}, "Blue")
            end
        end
    end
}

SMODS.Consumable {
    set = "osc_song",
    key = "abyssmal",
    atlas = "osc_w4songs",
    pos = {x = 0, y = 0},
    cost = 6,

    config = {
        cards = 2
    },

    set_badges = function(self, card, badges)
        badges[#badges+1] = Oscillate.get_song_badge("tapes")
    end,

    loc_vars = function(self,info_queue,card)
        info_queue[#info_queue+1] = G.P_SEALS.osc_dummy
        info_queue[#info_queue+1] = G.P_SEALS.Purple
        return {vars = {card.ability.cards}}
    end,

    can_use = function(self,card)
        if G.hand then 
            return true 
        end
    end,

    use = function(self,card,area,copier)
        for i,v in ipairs(G.hand.cards) do
            if v:get_seal() == "osc_dummy" then
                Oscillate.Apply_Seal({v}, "Purple")
            end
        end
    end
}

SMODS.Consumable {
    set = "osc_song",
    key = "flight",
    atlas = "osc_w4songs",
    pos = {x = 8, y = 2},
    cost = 6,

    config = {
        cards = 2
    },

    set_badges = function(self, card, badges)
        badges[#badges+1] = Oscillate.get_song_badge("tapes")
    end,

    loc_vars = function(self,info_queue,card)
        info_queue[#info_queue+1] = G.P_SEALS.osc_dummy
        info_queue[#info_queue+1] = G.P_SEALS.Gold
        return {vars = {card.ability.cards}}
    end,

    can_use = function(self,card)
        if G.hand then 
            return true 
        end
    end,

    use = function(self,card,area,copier)
        for i,v in ipairs(G.hand.cards) do
            if v:get_seal() == "osc_dummy" then
                Oscillate.Apply_Seal({v}, "Gold")
            end
        end
    end
}

SMODS.Consumable {
    set = "osc_song",
    key = "gleep_glorp",
    atlas = "osc_w4songs",
    pos = {x = 6, y = 1},
    cost = 6,

    config = {
        cards = 2
    },

    set_badges = function(self, card, badges)
        badges[#badges+1] = Oscillate.get_song_badge("tapes")
    end,

    loc_vars = function(self,info_queue,card)
        info_queue[#info_queue+1] = G.P_SEALS.osc_dummy
        info_queue[#info_queue+1] = G.P_SEALS.osc_incubus
        return {vars = {card.ability.cards}}
    end,

    can_use = function(self,card)
        if G.hand then 
            return true 
        end
    end,

    use = function(self,card,area,copier)
        for i,v in ipairs(G.hand.cards) do
            if v:get_seal() == "osc_dummy" then
                Oscillate.Apply_Seal({v}, "osc_incubus")
            end
        end
    end
}

SMODS.Consumable {
    set = "osc_song",
    key = "beat_switch",
    atlas = "osc_w4songs",
    pos = {x = 2, y = 0},
    cost = 6,

    config = {
        cards = 2
    },

    set_badges = function(self, card, badges)
        badges[#badges+1] = Oscillate.get_song_badge("congregation")
    end,

    loc_vars = function(self,info_queue,card)
        info_queue[#info_queue+1] = G.P_SEALS.osc_dummy
        info_queue[#info_queue+1] = G.P_SEALS.osc_pink
        return {vars = {card.ability.cards}}
    end,

    can_use = function(self,card)
        if G.hand then 
            return true 
        end
    end,

    use = function(self,card,area,copier)
        for i,v in ipairs(G.hand.cards) do
            if v:get_seal() == "osc_dummy" then
                Oscillate.Apply_Seal({v}, "osc_pink")
            end
        end
    end
}

SMODS.Consumable {
    set = "osc_song",
    key = "chairman",
    atlas = "osc_w4songs",
    pos = {x = 1, y = 0},
    cost = 6,

    config = {
        cards = 2
    },

    set_badges = function(self, card, badges)
        badges[#badges+1] = Oscillate.get_song_badge("congregation")
    end,

    loc_vars = function(self,info_queue,card)
        info_queue[#info_queue+1] = G.P_SEALS.osc_dummy
        info_queue[#info_queue+1] = G.P_SEALS.osc_white
        return {vars = {card.ability.cards}}
    end,

    can_use = function(self,card)
        if G.hand then 
            return true 
        end
    end,

    use = function(self,card,area,copier)
        for i,v in ipairs(G.hand.cards) do
            if v:get_seal() == "osc_dummy" then
                Oscillate.Apply_Seal({v}, "osc_white")
            end
        end
    end
}

SMODS.Consumable {
    set = "osc_song",
    key = "6_19",
    atlas = "osc_w4songs",
    pos = {x = 4, y = 4},
    cost = 6,

    config = {
        cards = 2
    },

    set_badges = function(self, card, badges)
        badges[#badges+1] = Oscillate.get_song_badge("congregation")
    end,

    loc_vars = function(self,info_queue,card)
        info_queue[#info_queue+1] = G.P_SEALS.osc_dummy
        info_queue[#info_queue+1] = G.P_SEALS.osc_golden_red
        return {vars = {card.ability.cards}}
    end,

    can_use = function(self,card)
        if G.hand then 
            return true 
        end
    end,

    use = function(self,card,area,copier)
        for i,v in ipairs(G.hand.cards) do
            if v:get_seal() == "osc_dummy" then
                Oscillate.Apply_Seal({v}, "osc_golden_red")
            end
        end
    end
}

SMODS.Consumable {
    set = "osc_song",
    key = "throwback",
    atlas = "osc_w4songs",
    pos = {x = 0, y = 4},
    cost = 6,

    config = {
        cards = 2
    },

    set_badges = function(self, card, badges)
        badges[#badges+1] = Oscillate.get_song_badge("congregation")
    end,

    loc_vars = function(self,info_queue,card)
        info_queue[#info_queue+1] = G.P_SEALS.osc_dummy
        info_queue[#info_queue+1] = G.P_SEALS.osc_sleepy
        return {vars = {card.ability.cards}}
    end,

    can_use = function(self,card)
        if G.hand then 
            return true 
        end
    end,

    use = function(self,card,area,copier)
        for i,v in ipairs(G.hand.cards) do
            if v:get_seal() == "osc_dummy" then
                Oscillate.Apply_Seal({v}, "osc_sleepy")
            end
        end
    end
}

SMODS.Consumable {
    set = "osc_song",
    key = "basement_talk",
    atlas = "osc_w4songs",
    pos = {x = 9, y = 1},
    cost = 6,

    config = {
        cards = 2
    },

    set_badges = function(self, card, badges)
        badges[#badges+1] = Oscillate.get_song_badge("tapes")
    end,

    loc_vars = function(self,info_queue,card)
        info_queue[#info_queue+1] = G.P_SEALS.osc_dummy
        info_queue[#info_queue+1] = G.P_SEALS.osc_honey
        return {vars = {card.ability.cards}}
    end,

    can_use = function(self,card)
        if G.hand then 
            return true 
        end
    end,

    use = function(self,card,area,copier)
        for i,v in ipairs(G.hand.cards) do
            if v:get_seal() == "osc_dummy" then
                Oscillate.Apply_Seal({v}, "osc_honey")
            end
        end
    end
}

SMODS.Consumable {
    set = "osc_song",
    key = "lighthouse",
    atlas = "osc_w4songs",
    pos = {x = 3, y = 2},
    cost = 6,

    config = {
        cards = 2
    },

    set_badges = function(self, card, badges)
        badges[#badges+1] = Oscillate.get_song_badge("tapes")
    end,

    loc_vars = function(self,info_queue,card)
        info_queue[#info_queue+1] = G.P_SEALS.osc_dummy
        info_queue[#info_queue+1] = G.P_SEALS.osc_hell
        return {vars = {card.ability.cards}}
    end,

    can_use = function(self,card)
        if G.hand then 
            return true 
        end
    end,

    use = function(self,card,area,copier)
        for i,v in ipairs(G.hand.cards) do
            if v:get_seal() == "osc_dummy" then
                Oscillate.Apply_Seal({v}, "osc_hell")
            end
        end
    end
}

SMODS.Consumable {
    set = "osc_song",
    key = "overload",
    atlas = "osc_w4songs",
    pos = {x = 2, y = 3},
    cost = 6,

    config = {
        cards = 2
    },

    set_badges = function(self, card, badges)
        badges[#badges+1] = Oscillate.get_song_badge("congregation")
    end,

    loc_vars = function(self,info_queue,card)
        info_queue[#info_queue+1] = G.P_SEALS.osc_dummy
        info_queue[#info_queue+1] = G.P_SEALS["osc_seal?"]
        return {vars = {card.ability.cards}}
    end,

    can_use = function(self,card)
        if G.hand then 
            return true 
        end
    end,

    use = function(self,card,area,copier)
        for i,v in ipairs(G.hand.cards) do
            if v:get_seal() == "osc_dummy" then
                Oscillate.Apply_Seal({v}, "osc_seal?")
            end
        end
    end
}

SMODS.Consumable {
    set = "osc_song",
    key = "psychedelic",
    atlas = "osc_w4songs",
    pos = {x = 0, y = 3},
    cost = 6,

    set_badges = function(self, card, badges)
        badges[#badges+1] = Oscillate.get_song_badge("tapes")
    end,

    loc_vars = function(self,info_queue,card)
        info_queue[#info_queue+1] = G.P_SEALS.osc_sleepy
        return {vars = {4^2 - (4 - G.GAME.probabilities.normal)^2, 4^2}}
    end,

    can_use = function(self,card)
        return true
    end,

    use = function(self,card,area,copier)
        G.GAME.osc_seal_buffs.sleepy = true
    end
}

SMODS.Consumable {
    set = "osc_song",
    key = "stomak",
    atlas = "osc_w4songs",
    pos = {x = 3, y = 3},
    cost = 6,

    set_badges = function(self, card, badges)
        badges[#badges+1] = Oscillate.get_song_badge("tapes")
    end,

    loc_vars = function(self,info_queue,card)
        info_queue[#info_queue+1] = G.P_SEALS.osc_dummy
    end,

    can_use = function(self,card)
        return true
    end,

    use = function(self,card,area,copier)
        G.GAME.osc_seal_buffs.dummy = true
    end
}

SMODS.Consumable {
    set = "osc_song",
    key = "scawy",
    atlas = "osc_w4songs",
    pos = {x = 1, y = 4},
    cost = 6,

    set_badges = function(self, card, badges)
        badges[#badges+1] = Oscillate.get_song_badge("congregation")
    end,

    loc_vars = function(self,info_queue,card)
        info_queue[#info_queue+1] = G.P_SEALS.osc_hell
    end,

    can_use = function(self,card)
        return true
    end,

    use = function(self,card,area,copier)
        G.GAME.osc_seal_buffs.hell = true
    end
}

SMODS.Consumable {
    set = "osc_song",
    key = "faker",
    atlas = "osc_w4songs",
    pos = {x = 0, y = 1},
    cost = 6,

    set_badges = function(self, card, badges)
        badges[#badges+1] = Oscillate.get_song_badge("tapes")
    end,

    loc_vars = function(self,info_queue,card)
        info_queue[#info_queue+1] = G.P_SEALS["osc_seal?"]
    end,

    can_use = function(self,card)
        return true
    end,

    use = function(self,card,area,copier)
        G.GAME.osc_seal_buffs.sealq = true
    end
}

SMODS.Consumable {
    set = "osc_song",
    key = "lswave",
    atlas = "osc_w4songs",
    pos = {x = 4, y = 2},
    cost = 6,

    set_badges = function(self, card, badges)
        badges[#badges+1] = Oscillate.get_song_badge("congregation")
    end,

    loc_vars = function(self,info_queue,card)
        info_queue[#info_queue+1] = G.P_SEALS.osc_golden_red
    end,

    can_use = function(self,card)
        return true
    end,

    use = function(self,card,area,copier)
        G.GAME.osc_seal_buffs.golden_red = true
    end
}

SMODS.Consumable {
    set = "osc_song",
    key = "files",
    atlas = "osc_w4songs",
    pos = {x = 6, y = 3},
    cost = 6,

    set_badges = function(self, card, badges)
        badges[#badges+1] = Oscillate.get_song_badge("tapes")
    end,

    loc_vars = function(self,info_queue,card)
        info_queue[#info_queue+1] = G.P_SEALS.osc_honey
    end,

    can_use = function(self,card)
        return true
    end,

    use = function(self,card,area,copier)
        G.GAME.osc_seal_buffs.honey = true
    end
}

SMODS.Consumable {
    set = "osc_song",
    key = "shortest_violin",
    atlas = "osc_w4songs",
    pos = {x = 3, y = 4},
    cost = 6,

    config = {
        chance = 2
    },

    set_badges = function(self, card, badges)
        badges[#badges+1] = Oscillate.get_song_badge("unholyness")
    end,

    loc_vars = function(self,info_queue,card)
        return {vars = {card.ability.chance}}
    end,

    can_use = function(self,card)
        if G.hand.cards then 
            return true 
        end
    end,

    use = function(self,card,area,copier)
        for i = 1, #G.hand.cards do
            if pseudorandom("short") < G.GAME.probabilities.normal/card.ability.chance and G.hand.cards[i].seal then
                G.E_MANAGER:add_event(Event({
                func = function()
                    SMODS.add_card({set = "osc_song", area = G.consumeables})
                    card:juice_up(0.5,0.5)
                return true end
                }))  
            end
        end
    end
}

SMODS.Consumable {
    set = "osc_song",
    key = "longest_violin",
    atlas = "osc_w4songs",
    pos = {x = 2, y = 4},
    cost = 6,

    config = {
        chance = 2
    },

    set_badges = function(self, card, badges)
        badges[#badges+1] = Oscillate.get_song_badge("unholyness")
    end,

    loc_vars = function(self,info_queue,card)
        return {vars = {card.ability.chance}}
    end,

    can_use = function(self,card)
        if G.hand.cards then 
            return true 
        end
    end,

    use = function(self,card,area,copier)
        for i = 1, #G.hand.cards do
            if pseudorandom("long") < G.GAME.probabilities.normal/card.ability.chance and not G.hand.cards[i].seal then
                G.E_MANAGER:add_event(Event({
                func = function()
                    SMODS.add_card({set = "osc_song", area = G.consumeables})
                    card:juice_up(0.5,0.5)
                return true end
                }))  
            end
        end
    end
}