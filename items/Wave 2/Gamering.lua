SMODS.ConsumableType {
    key = "Gamering",
    primary_colour = HEX("5fd459"),
	secondary_colour = HEX("33A630"),
    collection_rows = {3,3},
    shop_rate = 0.05,
    default = "c_osc_gamering",
    can_stack = true,
	can_divide = true,
}
G.C.GAMERING = HEX("5fd459")

SMODS.Consumable {
    set = "Gamering",
    key = "mama_mega",
    atlas = "w2gamering",
    pos = {x = 0, y = 0},
    cost = 5,



    can_use = function(self,card)
        return G.GAME.blind.in_blind
    end,

    use = function(self,card,area,copier)
        G.E_MANAGER:add_event(Event({
            blocking = false,
            func = function()
                if G.STATE == G.STATES.SELECTING_HAND then
                    G.GAME.chips = G.GAME.blind.chips
                    G.STATE = G.STATES.HAND_PLAYED
                    G.STATE_COMPLETE = true
                    end_round()
                    return true
                end
            end
        }))
    end
}

SMODS.Sound {
    key = "osc_p",
    path = {
        ['default']="p.ogg",
    }
}

SMODS.Consumable {
    set = "Gamering",
    key = "papa_pega",
    atlas = "w2gamering",
    pos = {x = 1, y = 0},
    cost = 5,



    can_use = function(self,card)
        return G.GAME.blind.in_blind
    end,

    use = function(self,card,area,copier)
        G.E_MANAGER:add_event(Event({
            blocking = false,
            func = function()
                if G.STATE == G.STATES.SELECTING_HAND then
                    play_sound("osc_p")
                    G.GAME.chips = G.GAME.blind.chips
                    G.STATE = G.STATES.HAND_PLAYED
                    G.STATE_COMPLETE = true
                    end_round()
                    return true
                end
            end
        }))
    end
}

SMODS.Consumable {
    set = "Gamering",
    key = "cube_shape",
    atlas = "w2gamering",
    pos = {x = 2, y = 0},
    cost = 5,

    config = {
        cards = 2
    },



    loc_vars = function(self,info_queue,card)
        return {vars = {card.ability.cards}}
    end,

    can_use = function(self,card)
        return true
    end,

    use = function(self,card,area,copier)
        for i = 1, math.min(card.ability.cards, G.consumeables.config.card_limit - #G.consumeables.cards) do
            G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
                if G.consumeables.config.card_limit > #G.consumeables.cards then
                    play_sound('timpani')
                    SMODS.add_card({set = "Gamering", area = G.consumeables})
                end
                return true end }))
        end
    end
}

SMODS.Consumable {
    set = "Gamering",
    key = "so_peak",
    atlas = "w2gamering",
    pos = {x = 3, y = 0},
    cost = 5,



    loc_vars = function(self,info_queue,card)
        info_queue[#info_queue+1] = {set = "Other", key = "osc_true_p"}
    end,

    can_use = function(self,card)
        return G.jokers.config.card_limit > #G.jokers.cards
    end,

    use = function(self,card,area,copier)
        local key = pseudorandom_element(Oscillate.true_p, "so peam")
        SMODS.add_card({key = key, allow_duplicates = true})
    end
}

SMODS.Consumable {
    set = "Gamering",
    key = "student_loans",
    atlas = "w2gamering",
    pos = {x = 0, y = 1},
    cost = 5,

    config = {
        money = 50,
        debt = 55,
    },



    loc_vars = function(self,info_queue,card)
        return {vars = {card.ability.money, card.ability.debt} }
    end,


    can_use = function(self,card)
        return true
    end,

    use = function(self,card,area,copier)
        ease_dollars(card.ability.money)
        Oscillate.add_debt(card.ability.debt)
    end
}

SMODS.Consumable {
    set = "Gamering",
    key = "life_or_bath",
    atlas = "w2gamering",
    pos = {x = 1, y = 1},
    cost = 5,

    config = {
        cards = 3
    },



    loc_vars = function(self,info_queue,card)
        --info_queue
        return {vars ={card.ability.cards}}
    end,

    can_use = function(self,card)
        if G.hand and (0 < #G.hand.highlighted and #G.hand.highlighted <= card.ability.cards) then 
            return true 
        end
    end,

    use = function(self,card,area,copier)
        for i=1, #G.hand.highlighted do
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function() 
                    G.hand.highlighted[i]:flip()
                    play_sound('card1')
                    G.hand.highlighted[i]:juice_up(0.3, 0.3)
                    return true 
                end 
            }))
        end
        for i=1, #G.hand.highlighted do
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.11,
                func = function() 
                    G.hand.highlighted[i]:set_ability("m_osc_soggy")
                    return true 
                end 
            }))
        end
        for i=1, #G.hand.highlighted do
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function() 
                    G.hand.highlighted[i]:flip()
                    play_sound('tarot2')
                    G.hand.highlighted[i]:juice_up(0.3, 0.3)
                    return true 
                end 
            }))
        end
    end
}

SMODS.Consumable {
    set = "Gamering",
    key = "orb",
    atlas = "w2gamering",
    pos = {x = 2, y = 1},
    cost = 5,

    config = {
        options = {
            "great",
            "nunchucks",
            "gun",
            "p"
        }
    },



    can_use = function(self,card)
        if #G.jokers.cards < G.jokers.config.card_limit then 
            return true 
        end
    end,

    use = function(self,card,area,copier)
        SMODS.add_card({key = "j_osc_orb_" .. pseudorandom_element(card.ability.options, "orb")})
    end
}