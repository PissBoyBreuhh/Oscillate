Oscillate.Joker{ 
    oscillate_wave = 4,
    key = "ascended_oblobbles",
    rarity = 3,
    atlas = "osc_w4rare",
    pos = {x=0, y=0},
    cost = 7,

    config = {
        extra = {
            xchips = 4
        }
    },

    loc_vars = function(self,info_queue,card)
        return {vars = {card.ability.extra.xchips}}
    end,

    calculate = function(self,card,context)
        if context.joker_main then
            return {xchips = card.ability.extra.xchips}
        end
    end
}

Oscillate.Joker {
    oscillate_wave = 4,
    key = "gradient_grus",
    rarity = 3,
    atlas = "osc_w4rare",
    pos = {x=1,y=0},
    cost = 8,
    config = {
        extra = {
            chips = 30,
            mult = 6,
            xmult = 1.5,
        }
    },

    loc_vars = function(self,info_queue,card)
        return {vars = {card.ability.extra.chips,card.ability.extra.mult,card.ability.extra.xmult}}
    end,

    calculate = function(self,card,context)
        if context.individual and context.cardarea == G.play then 
            return {mult = card.ability.extra.mult,chips = card.ability.extra.chips} 
        end

        if context.joker_main then return {xmult = card.ability.extra.xmult} end
    end,
}

Oscillate.Joker{ 
    oscillate_wave = 4,
    key = "polaroid",
    rarity = 3,
    atlas = "osc_w4rare",
    pos = {x=2, y=0},
    cost = 6,

    config = {
        extra = {
            xmult = 1.5
        }
    },

    loc_vars = function(self,info_queue,card)
        return {vars = {card.ability.extra.xmult}}
    end,

    calculate = function(self,card,context)
        if context.individual and context.cardarea == G.play and context.other_card:is_face() then
            return {xmult = card.ability.extra.xmult}
        end
    end
}

Oscillate.Joker{ 
    oscillate_wave = 4,
    key = "4th_wall",
    rarity = 3,
    atlas = "osc_w4rare",
    pos = {x=0, y=1},
    cost = 6,

    calculate = function(self,card,context)
        if context.joker_main then
            return {xmult = Oscillate.current_wave}
        end
    end
}

Oscillate.Joker{ 
    oscillate_wave = 4,
    key = "commatose",
    rarity = 3,
    atlas = "osc_w4rare",
    pos = {x=1, y=1},
    cost = 8,

    config = {
        immutable = {
            left = nil,
            right = nil,
            time = -4
        }
    },

    calculate = function(self,card,context)
        if context.retrigger_joker_check then
            return {repetitions = 1}
        end
    end,

    update = function(self, card, dt)
        card.ability.immutable.time = card.ability.immutable.time + G.real_dt
        if card.ability.immutable.time > 1 and G.jokers and G.jokers.cards then
            card.ability.immutable.time = 0
            local left,right
            for i,v in ipairs(G.jokers.cards) do
                if v == card then
                    left = G.jokers.cards[i-1]
                    right = G.jokers.cards[i+1]
                end
            end

            if card.ability.immutable.left then card.ability.immutable.left:set_debuff(false) end
            if card.ability.immutable.right then card.ability.immutable.right:set_debuff(false) end

            if left then left:set_debuff(true) end
            if right then right:set_debuff(true) end

            card.ability.immutable.left = left
            card.ability.immutable.right = right       
        end
    end,
}

Oscillate.Joker{
    oscillate_wave = 4,
    key = "black_death",
    rarity = 3,
    atlas = "osc_w4rare",
    pos = {x=2,y=1},
    cost = 20,

    config = {
        extra = {
            xmult = 1,
            gain = 0.25
        }
    },

    loc_vars = function(self,info_queue,card)
        return {vars = {card.ability.extra.xmult, card.ability.extra.gain}}
    end,

    calculate = function(self,card,context)
        if context.joker_main then
            return {xmult = card.ability.extra.xmult}
        end

        if context.after then
            if G.play then
                for i,v in ipairs(G.play.cards) do
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            if v.config.center.key ~= "m_osc_plague" then
                                v:set_ability("m_osc_plague")
                                card:juice_up()
                            end
                        return true end,
                        delay = 0.4,
                    }))
                end
            end
        end

        if context.remove_playing_cards and not context.blueprint then
            card.ability.extra.xmult = card.ability.extra.xmult + #context.removed * card.ability.extra.gain
            return {message = localize("k_upgrade_ex")}
        end
    end,
}