Oscillate.Joker {
    oscillate_wave = 3,
    key = "legend_joker",
    rarity = 4,
    atlas = "w3legendary",
    pos = {x=0,y=0},
    soul_pos = {x=0,y=1},
    cost = 20,
    config = {
        extra = {
            mult = 400
        }
    },

    loc_vars = function(self,info_queue,card)
        return {vars = {card.ability.extra.mult}}
    end,

    calculate = function(self,card,context)
        if context.joker_main then
            return {mult = card.ability.extra.mult}
        end
    end,
}

Oscillate.Joker {
    oscillate_wave = "omega",
    key = "oscillate",
    rarity = 4,
    atlas = "w3legendary",
    pos = {x=1,y=0},
    oscillate_layer = {x=1,y=1},
    soul_pos = {x=1,y=2},
    cost = 20,
    config = {
        extra = {
            vals = {
            {"mult", 25, 5, false},
            {"xmult", 3, 0.4, false},
            {"chips", 150, 25, false},
            {"xchips", 3, 0.5, false},
            {"dollars", 10, 1, false},
            {"joker_slots", 0.1, 0.1, false},
            {"consumable_slots", 0.5, 0.1, false},
            },
            active = {}, 
            target = 1,
        }
    },

    loc_vars = function(self, info_queue, card)
        local vals = card.ability.extra.vals

        local ret = {}
        for i = 1, #vals do
            table.insert(ret, vals[i][2])
            table.insert(ret, vals[i][3])
            table.insert(ret, vals[i][4] and "(active)" or "(inactive)")
        end

        return {vars = ret}
        
    end,

    calculate = function(self,card,context)
        if context.selling_card and not context.retrigger_joker then
            if #card.ability.extra.active < 7 then
                local i = pseudorandom_element(card.ability.extra.vals, "oscillate")
                while i[4] do
                    i = pseudorandom_element(card.ability.extra.vals, "oscillate")
                end
                table.insert(card.ability.extra.active, i)
                i[4] = true

                return{message = localize{"k_upgrade_ex"}}
            end
        end

        if (context.individual and context.cardarea == G.play and #card.ability.extra.active > 0) or context.retrigger_joker then
            card.ability.extra.target = (card.ability.extra.target % #card.ability.extra.active) + 1
            if not context.retrigger_joker then
                G.E_MANAGER:add_event(Event({
                    trigger = "immediate",
                    func = function()   
                        card:juice_up()
                    return true end
                }))
            end
        end

        if context.joker_main then
            if #card.ability.extra.active > 0 then
                local val, ret = card.ability.extra.active[card.ability.extra.target], {}

                if val[1] == "joker_slots" then
                    G.E_MANAGER:add_event(Event({
                        trigger = "immediate",
                        func = function()
                            G.jokers.config.card_limit = G.jokers.config.card_limit + val[2]
                        return true end
                    }))
                    return {message = "+" .. val[2] .. " Joker Slots!"}
                elseif val[1] == "consumable_slots" then
                    G.E_MANAGER:add_event(Event({
                    trigger = "immediate",
                        func = function()
                            G.consumeables.config.card_limit = G.consumeables.config.card_limit + val[2]
                        return true end
                    }))
                    return {message = "+" .. val[2] .. " Consumable Slots!"}
                else
                    ret[val[1]] = val[2]
                    return ret
                end
            end
        end

        if context.end_of_round and context.main_eval and not context.retrigger_joker then
            for i,v in pairs(card.ability.extra.active) do
                v[2] = v[2] + v[3]
            end
            return{message = localize{"k_upgrade_ex"}}
        end

        if context.retrigger_joker_check then
            if context.other_card == card then
                local retriggers = 0
                for i = 1, #card.ability.extra.active - 1 do
                    if pseudorandom("oscillate") < 1/2 then
                        retriggers = retriggers + 1
                    else
                        break
                    end
                end

                if retriggers > 0 then
                    return {repetitions = retriggers}
                end
            end
        end
    end,
}