SMODS.Rarity {
    key = "bunny",
    loc_txt = {name="Bunny"},
    default_weight = 0.05,
    pools = {
        ["Joker"] = true,
    },
    badge_colour = HEX("EDC38C")
}

Oscillate.Joker{ 
    oscillate_wave = 4,
    key = "bunny",
    rarity = "osc_bunny",
    atlas = "osc_w4bunny",
    pos = {x=0, y=0},
    cost = 4,

    config = {
        extra = {
            mult = 25,
            chance = 4
        }
    },    
    
    loc_vars = function(self,info_queue,card)
        return{vars = {card.ability.extra.chance, card.ability.extra.mult}}
    end,

    calculate = function(self,card,context)
        if context.joker_main and pseudorandom("bunny") < G.GAME.probabilities.normal / card.ability.extra.chance then
            return{mult = card.ability.extra.mult}
        end
    end,
}

Oscillate.Joker{ 
    oscillate_wave = 4,
    key = "bnuuy",
    rarity = "osc_bunny",
    atlas = "osc_w4bunny",
    pos = {x=1, y=0},
    cost = 4,

    config = {
        extra = {
            chips = 125,
            chance = 4
        }
    },    
    
    loc_vars = function(self,info_queue,card)
        return{vars = {card.ability.extra.chance, card.ability.extra.chips}}
    end,

    calculate = function(self,card,context)
        if context.joker_main and pseudorandom("bnuuy") < G.GAME.probabilities.normal / card.ability.extra.chance then
            return{chips = card.ability.extra.chips}
        end
    end,
}

Oscillate.Joker{ 
    oscillate_wave = 4,
    key = "black_bunny",
    rarity = "osc_bunny",
    atlas = "osc_w4bunny",
    pos = {x=2, y=0},
    cost = 4,

    config = {
        extra = {
            chips = 80,
            mult = 15,
            chance = 6
        }
    },    
    
    loc_vars = function(self,info_queue,card)
        return{vars = {card.ability.extra.chance, card.ability.extra.chips, card.ability.extra.mult}}
    end,

    calculate = function(self,card,context)
        if context.joker_main and pseudorandom("black") < G.GAME.probabilities.normal / card.ability.extra.chance then
            return{chips = card.ability.extra.chips, mult = card.ability.extra.mult}
        end
    end,
}

Oscillate.Joker{ 
    oscillate_wave = 4,
    key = "tortoiseshell_bunny",
    rarity = "osc_bunny",
    atlas = "osc_w4bunny",
    pos = {x=0, y=1},
    cost = 4,

    config = {
        extra = {
            money = 2,
            chance = 3
        }
    },    
    
    loc_vars = function(self,info_queue,card)
        return{vars = {card.ability.extra.chance, card.ability.extra.money}}
    end,

    calculate = function(self,card,context)
        if context.joker_main and pseudorandom("tortoiseshell") < G.GAME.probabilities.normal / card.ability.extra.chance then
            return{dollars = card.ability.extra.money}
        end
    end,
}

Oscillate.Joker{ 
    oscillate_wave = 4,
    key = "lilac_bunny",
    rarity = "osc_bunny",
    atlas = "osc_w4bunny",
    pos = {x=1, y=1},
    cost = 4,

    config = {
        extra = {
            xmult = 3,
            chance = 5
        }
    },    
    
    loc_vars = function(self,info_queue,card)
        return{vars = {card.ability.extra.chance, card.ability.extra.xmult}}
    end,

    calculate = function(self,card,context)
        if context.joker_main and pseudorandom("lilac") < G.GAME.probabilities.normal / card.ability.extra.chance then
            return{xmult = card.ability.extra.xmult}
        end
    end,
}

Oscillate.Joker{ 
    oscillate_wave = 4,
    key = "orange_bunny",
    rarity = "osc_bunny",
    atlas = "osc_w4bunny",
    pos = {x=2, y=1},
    cost = 4,

    config = {
        extra = {
            xchips = 4,
            chance = 5
        }
    },    
    
    loc_vars = function(self,info_queue,card)
        return{vars = {card.ability.extra.chance, card.ability.extra.xchips}}
    end,

    calculate = function(self,card,context)
        if context.joker_main and pseudorandom("orange") < G.GAME.probabilities.normal / card.ability.extra.chance then
            return{xchips = card.ability.extra.xchips}
        end
    end,
}

Oscillate.Joker{ 
    oscillate_wave = 4,
    key = "cinnamon_bunny",
    rarity = "osc_bunny",
    atlas = "osc_w4bunny",
    pos = {x=0, y=2},
    cost = 4,

    config = {
        extra = {
            xdollars = 1.2,
            chance = 5
        }
    },    
    
    loc_vars = function(self,info_queue,card)
        return{vars = {card.ability.extra.chance, card.ability.extra.xdollars}}
    end,

    calculate = function(self,card,context)
        if context.joker_main and pseudorandom("cinnamon") < G.GAME.probabilities.normal / card.ability.extra.chance then
            return{dollars = G.GAME.dollars * (card.ability.extra.xdollars - 1)}
        end
    end,
}

Oscillate.Joker{ 
    oscillate_wave = 4,
    key = "blue_bunny",
    rarity = "osc_bunny",
    atlas = "osc_w4bunny",
    pos = {x=2, y=2},
    cost = 4,

    config = {
        extra = {
            chips = 40,
            xchips = 2,
            chance = 6
        }
    },    
    
    loc_vars = function(self,info_queue,card)
        return{vars = {card.ability.extra.chance, card.ability.extra.chips, card.ability.extra.xchips}}
    end,

    calculate = function(self,card,context)
        if context.joker_main and pseudorandom("ITS BLUE ITS BLUE ITS BLUE ITS BLUE") < G.GAME.probabilities.normal / card.ability.extra.chance then
            return{chips = card.ability.extra.chips, xchips = card.ability.extra.xchips}
        end
    end,
}

Oscillate.Joker{ 
    oscillate_wave = 4,
    key = "red_bunny",
    rarity = "osc_bunny",
    atlas = "osc_w4bunny",
    pos = {x=1, y=02},
    cost = 4,

    config = {
        extra = {
            mult = 5,
            xmult = 3,
            chance = 6
        }
    },    
    
    loc_vars = function(self,info_queue,card)
        return{vars = {card.ability.extra.chance, card.ability.extra.mult, card.ability.extra.xmult}}
    end,

    calculate = function(self,card,context)
        G.GAME.probabilities.normal = 2.5
        if context.joker_main and pseudorandom("red") < G.GAME.probabilities.normal / card.ability.extra.chance then
            return{mult = card.ability.extra.mult, xmult = card.ability.extra.xmult}
        end
    end,
}