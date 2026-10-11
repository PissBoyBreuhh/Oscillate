Oscillate.Joker{ 
    oscillate_wave = 4,
    key = "weekends",
    rarity = 1,
    atlas = "osc_w4common",
    pos = {x=0, y=0},
    cost = 4,

    config = {
        extra = {
            mult = 3
        }
    },    
    
    loc_vars = function(self,info_queue,card)
        if 0 == tonumber(os.date("%w")) or tonumber(os.date("%w")) == 6 then
            return {vars = {tonumber(os.date("%w"))*card.ability.extra.mult,os.date("%A")}}
        else return {vars = {0,os.date("%A")}}
        end
    end,

    calculate = function(self,card,context)
        if 0 == tonumber(os.date("%w")) or tonumber(os.date("%w")) == 6 and context.joker_main then
            return {chips = tonumber(os.date("%w"))*card.ability.extra.mult}
        end
    end,
}

Oscillate.Joker{ 
    oscillate_wave = 4,
    key = "release",
    rarity = 1,
    atlas = "osc_w4common",
    pos = {x=1, y=0},
    cost = 5,

    config = {
        extra = {
            chips = 5
        }
    },    
    
    loc_vars = function(self,info_queue,card)
        return {vars = {card.ability.extra.chips}}
    end,

    calculate = function(self,card,context)
        if context.joker_main and G.jokers and G.jokers.cards then
            local count = 0
            for i,v in ipairs(G.jokers.cards) do
                count = count + (card.config.center.oscillate_wave or 0)
            end
            return {chips = count*card.ability.extra.chips}
        end
    end,
}

Oscillate.Joker{ 
    oscillate_wave = 4,
    key = "jokeh",
    rarity = 1,
    atlas = "osc_w4common",
    pos = {x=0, y=1},
    cost = 4,

    config = {
        extra = {
            mult = 4,
            deviate = 1
        }
    },    
    
    loc_vars = function(self,info_queue,card)
        return {vars = {card.ability.extra.mult}}
    end,

    calculate = function(self,card,context)
        if context.joker_main then
            return{mult = card.ability.extra.mult + (pseudorandom("Wakinda?",-card.ability.extra.deviate,card.ability.extra.deviate))}
        end
    end,
}

Oscillate.Joker {
    oscillate_wave = 4,
    key = "milk",
    rarity = 1,
    atlas = (Osc_config.gisen and "osc_w4gisenmode" or "osc_w4common"),
    pos = (Osc_config.gisen and {x=0,y=0} or {x=1,y=1}),
    config = {
        extra = {
            chips = 30,
            gain = 1,
        }
    },
    blueprint_compat = true,
    cost = 5,

    loc_vars = function(self,info_queue,card)
        return {vars = {card.ability.extra.chips, card.ability.extra.gain}}
    end,

    calculate = function(self,card,context)
        if context.joker_main then
            card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.gain
            return { chips = card.ability.extra.chips }
        end
    end
}