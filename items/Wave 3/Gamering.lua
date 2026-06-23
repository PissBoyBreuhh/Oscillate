local function osc_getrarity(num)
    if num == 1 then return 0.3
    elseif num == 2 then return 0.8
    elseif num == 3 then return 1
    elseif num == 4 then return false 
    elseif num == 5 then return "osc_wizard"
    end
end

SMODS.Consumable {
    set = "Gamering",
    key = "harharhar",
    atlas = "osc_w3gamering",
    pos = {x = 0, y = 0},
    cost = 5,



    loc_vars = function(self, card, context)
        return {vars = { colours = {HEX("3D1F38")}}}
    end,

    can_use = function(self,card)
        return true
    end,

    use = function(self,card,area,copier)
        local old_cards = G.jokers.cards
        SMODS.destroy_cards(G.jokers.cards)
        
        for i,v in ipairs(old_cards) do
            
            local rarity = v.config.center.rarity
            if type(v.config.center.rarity) == "number" then 
                rarity = osc_getrarity(v.config.center.rarity + 1)
            end

            if v.config.center.rarity == "osc_candy" then
                rarity = 1
            end

            if v.config.center.rarity == "osc_blursed" then
                rarity = pseudorandom("cupkak")
            end

            if pseudorandom("gamer") < 0.33 then rarity = "osc_blursed" end
            G.E_MANAGER:add_event(Event({
                func = function()
                    SMODS.add_card({
                        set = "Joker", 
                        area = G.jokers, 
                        rarity = rarity or nil,
                        legendary = not rarity
                    })
                return true
                end
            }))

        end

    end
}

SMODS.Consumable {
    set = "Gamering",
    key = "pphehe",
    atlas = "osc_w3gamering",
    pos = {x = 1, y = 0},
    cost = 5,



    loc_vars = function(self, card, context)
        return {vars = { colours = {HEX("3D1F38")}}}
    end,

    can_use = function(self,card)
        return #G.jokers.cards > 0
    end,

    use = function(self,card,area,copier)
        for i,v in ipairs(G.jokers.cards) do
            v.config.center.is_p_joker = true
        end
    end
}

SMODS.Consumable {
    set = "Gamering",
    key = "wombo",
    atlas = "osc_w3gamering",
    pos = {x = 0, y = 1},
    cost = 5,



    can_use = function(self,card)
        return true
    end,

    use = function(self,card,area,copier)
        Oscillate.mod_crit(10, "chance", "add", card)
    end
}

SMODS.Consumable {
    set = "Gamering",
    key = "whitehole",
    atlas = "osc_w3gamering",
    pos = {x = 1, y = 1},
    cost = 5,



    can_use = function(self,card)
        return G.GAME.blind.in_blind
    end,

    use = function(self,card,area,copier)
        for i=1, #G.GAME.osc_whitehole do
            SMODS.add_card({set = "Playing Card", enhancement = "m_osc_enhancement?", edition = "e_osc_edition?", seal = "osc_seal?"})
        end
    end
}