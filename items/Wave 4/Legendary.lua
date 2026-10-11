local function osc_shibararity(rarity)
    print(rarity, type(rarity))
    if rarity == 1 then return "osc_blursed"
    elseif rarity == "osc_blursed" then return "osc_bunny"
    elseif rarity == "osc_bunny" then return "Uncommon"
    elseif rarity == 2 then return "osc_candy"
    elseif rarity == "osc_candy" then return "Rare" end
end

Oscillate.Joker{ 
    oscillate_wave = 4,
    oscillate_info = {
        credit = "Shiba"
    },
    key = "viadr",
    rarity = 4,
    atlas = "osc_w4otherjokers",
    pos = {x=1,y=0},
    soul_pos = {x=1,y=1},
    cost = 20,

    config = {
        extra = {
            gain = 1
        }
    },

    loc_vars = function(self,info_queue,card)
            local count = 0
            if G.jokers then
                for i,v in ipairs(G.jokers.cards) do
                    if ((type(v.config.center.rarity) == "number" and v.config.center.rarity >= 3) or v.config.center.rarity == "osc_wizard") then
                        count = count + 1
                    end -- new beginnigs
                end -- new beginnigs
            end -- new beginnigs 

        return {vars = {1 + count * card.ability.extra.gain ,card.ability.extra.gain}}
    end,

    calculate = function(self,card,context)
        if context.setting_blind then
            local jokers = {}
            if G.jokers then
                for i,v in ipairs(G.jokers.cards) do
                    if not ((type(v.config.center.rarity) == "number" and v.config.center.rarity >= 3) or v.config.center.rarity == "osc_wizard") then
                        table.insert(jokers, v)
                    end -- new beginnigs
                end -- new beginnigs

                if #jokers > 0 then
                    local joker = pseudorandom_element(jokers, "hubris")

                    G.E_MANAGER:add_event(Event({
                        func = function()
                            SMODS.destroy_cards({joker})
                            SMODS.add_card({set = "Joker", rarity = osc_shibararity(joker.config.center.rarity)})
                        return true end -- new beginnigs
                    }))
                end -- new beginnigs
            end -- new beginnigs
        end -- new beginnigs

        if context.joker_main then
            if G.jokers then
                local count = 0
                for i,v in ipairs(G.jokers.cards) do
                    if ((type(v.config.center.rarity) == "number" and v.config.center.rarity >= 3) or v.config.center.rarity == "osc_wizard") then
                        count = count + 1
                    end -- new beginnigs
                end -- new beginnigs

                return {xmult = 1 + count * card.ability.extra.gain}
            end -- new beginnigs
        end -- new beginnigs
    end
} -- new beginnigs

Oscillate.Joker{
    oscillate_wave = 4,
    key = "jhhhw2",
    rarity = 4,
    atlas = "osc_w4otherjokers",
    pos = {x=0,y=0},
    soul_pos = {x=0,y=1},
    cost = 20,

    config = {
        extra = {
            money = 10
        }
    },

    loc_vars = function(self,info_queue,card)
        return {vars = {card.ability.extra.money}}
    end,

    calculate = function(self,card,context)
        if context.after then
            G.E_MANAGER:add_event(Event({
                trigger = "immediate",
                func = function() 
                    G.GAME.blind.chips = G.GAME.blind.chips - G.GAME.chips
                    G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                    card:juice_up()
                    return true
                end
            }))
        end
    end,

    calc_dollar_bonus = function(self, card)
        if G.GAME.blind.chips < 0 then
            return card.ability.extra.money
        end
    end
}

Oscillate.Joker{
    oscillate_wave = 4,
    oscillate_info = {
        crit = true
    },
    key = "d20",
    rarity = 4,
    atlas = "osc_w4crit",
    pos = {x=2,y=1},
    soul_pos = {x=3,y=1},
    cost = 20,

    calculate = function(self,card,context)
        if context.joker_main then
        local effect = function(roll, card)
            if roll == 1 then
                return {mult = 30}
            elseif roll == 2 then
                return {chips = 200}
            elseif roll == 3 then
                return {xmult = 4}
            elseif roll == 4 then
                return {xchips = 5}
            elseif roll == 5 then
                return {dollars = 8}
            elseif roll == 6 then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        SMODS.add_card({set = "Gamering", area = G.consumeables})
                        card:juice_up()
                    return true end,
                }))
            elseif roll == 7 then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        SMODS.add_card({set = "osc_song", area = G.consumeables})
                        card:juice_up()
                    return true end,
                }))
            elseif roll == 8 then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        for i=1,10 do
                            SMODS.add_card({set = "Playing Card"})
                            card:juice_up()
                        end
                    return true end,
                }))        
            elseif roll == 9 then
                return {osc_crit = 10}
            elseif roll == 10 then
                return {osc_power = 0.5}
            elseif roll == 11 then
                return {d20_repeat = true}
            elseif roll == 12 then
                local left,right = 0,0
                local switch = false

                if G.jokers then
                for i,v in ipairs(G.jokers.cards) do
                    if not switch then
                        left = left + 1
                    else
                        right = right + 1
                    end

                    if v == card then
                        switch = true
                    end
                end
                end

                return {xchips = math.max(1,left), xmult = math.max(1,right)}
            elseif roll == 13 then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        if G.jokers and G.jokers.cards[1] then
                            G.jokers.cards[1]:set_edition("e_negative")
                        end
                        card:juice_up()
                    return true end,
                }))
            elseif roll == 14 then
                for i,v in ipairs(G.play.cards) do
                    v:set_seal("osc_seal?")
                end
            elseif roll == 15 then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        if G.jokers then
                            for i,v in ipairs(G.jokers.cards) do
                                if Oscillate.CanAscend(v) then
                                    Oscillate.Ascend(v)
                                end
                            end
                        end
                        card:juice_up()
                    return true end,
                }))
            elseif roll == 16 then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        SMODS.add_card({set = "Joker", rarity = "osc_candy"})
                        card:juice_up()
                    return true end,
                }))                
            elseif roll == 17 then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        SMODS.add_card({set = "Joker", rarity = "osc_blursed"})
                        card:juice_up()
                    return true end,
                }))
            elseif roll == 18 then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        SMODS.add_card({set = "Joker", rarity = "osc_bunny"})
                        card:juice_up()
                    return true end,
                }))
            elseif roll == 19 then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        SMODS.add_card({set = "Joker", rarity = "osc_wizard"})
                        card:juice_up()
                    return true end,
                }))      
            elseif roll == 20 then
                G.E_MANAGER:add_event(Event({
                    trigger = "immediate",
                    func = function() 
                        G.GAME.blind.chips = G.GAME.blind.chips/2
                        G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                        card:juice_up()
                        return true
                    end
                }))
            end
        end

        local repetitions = 1
        local ret = {}
        while repetitions > 0 do
            local roll = pseudorandom("d20", 1, 20)
            card_eval_status_text(card, "extra", nil, nil, nil, {message = tostring(roll)})

            local result = effect(roll, card)

            if result then
                if result.d20_repeat then 
                    repetitions = repetitions + 2
                else
                    for i,v in pairs(result) do
                        ret[i] = v
                    end
                end
            end

            repetitions = repetitions - 1
        end

        return ret
        end
    end,
}