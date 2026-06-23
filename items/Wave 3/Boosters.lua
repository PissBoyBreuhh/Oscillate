SMODS.Booster {
    key = "normal_gamering",
    config = {
        extra = 3,
        choose = 1
    },

    atlas = "osc_w3boosters",
    pos = {x=0,y=0},

    weight = 0.2,
    kind = "gamering",
    group_key = "gamering",
    cost = 6,
    select_card = "consumeables",

    loc_vars = function(self, info_queue, card)
        return{vars = {card.ability.choose, card.ability.extra}}
    end,

    create_card = function(self, card, i)
        return {set = "Gamering", area = G.pack_cards, skip_materialize = true, key_append = "gaymer"}
    end,
}

SMODS.Booster {
    key = "jumbo_gamering",
    config = {
        extra = 4,
        choose = 2
    },

    atlas = "osc_w3boosters",
    pos = {x=1,y=0},

    weight = 0.06,
    kind = "gamering",
    group_key = "gamering",
    cost = 10,
    select_card = "consumeables",

    loc_vars = function(self, info_queue, card)
        return{vars = {card.ability.choose, card.ability.extra}}
    end,

    create_card = function(self, card, i)
        return {set = "Gamering", area = G.pack_cards, skip_materialize = true, key_append = "gaymer"}
    end,
}

SMODS.Booster {
    key = "mega_gamering",
    config = {
        extra = 6,
        choose = 2
    },

    atlas = "osc_w3boosters",
    pos = {x=2,y=0},

    weight = 0.02,
    kind = "gamering",
    group_key = "gamering",
    cost = 18,
    select_card = "consumeables",

    loc_vars = function(self, info_queue, card)
        return{vars = {card.ability.choose, card.ability.extra}}
    end,

    create_card = function(self, card, i)
        return {set = "Gamering", area = G.pack_cards, skip_materialize = true, key_append = "gaymer"}
    end,
}

SMODS.Booster {
    key = "normal_oscillate",
    config = {
        extra = 2,
        choose = 1
    },

    atlas = "osc_w3boosters",
    pos = {x=0,y=1},

    weight = 0.4,
    kind = "oscillate",
    group_key = "oscillate",
    cost = 6,
    select_card = "jokers",

    loc_vars = function(self, info_queue, card)
        return{vars = {card.ability.choose, card.ability.extra}}
    end,

    create_card = function(self, card, i)
        local jkrs = {}
        for i,v in pairs(G.P_CENTERS) do
            if v.from_oscillate then
                table.insert(jkrs, v.key)
            end
        end


        local key = pseudorandom_element(jkrs, "oscillayt")
        return {set = "Joker", area = G.pack_cards, skip_materialize = true, key = key}
    end,
}

SMODS.Booster {
    key = "jumbo_oscillate",
    config = {
        extra = 4,
        choose = 1
    },

    atlas = "osc_w3boosters",
    pos = {x=1,y=1},

    weight = 0.2,
    kind = "oscillate",
    group_key = "oscillate",
    cost = 8,
    select_card = "jokers",

    loc_vars = function(self, info_queue, card)
        return{vars = {card.ability.choose, card.ability.extra}}
    end,

    create_card = function(self, card, i)
        local jkrs = {}
        for i,v in pairs(G.P_CENTERS) do
            if v.from_oscillate then
                table.insert(jkrs, v.key)
            end
        end


        local key = pseudorandom_element(jkrs, "oscillayt")
        return {set = "Joker", area = G.pack_cards, skip_materialize = true, key = key}
    end,
}

SMODS.Booster {
    key = "mega_oscillate",
    config = {
        extra = 5,
        choose = 2
    },

    atlas = "osc_w3boosters",
    pos = {x=2,y=1},

    weight = 0.1,
    kind = "oscillate",
    group_key = "oscillate",
    cost = 12,
    select_card = "jokers",

    loc_vars = function(self, info_queue, card)
        return{vars = {card.ability.choose, card.ability.extra}}
    end,

    create_card = function(self, card, i)
        local jkrs = {}
        for i,v in pairs(G.P_CENTERS) do
            if v.from_oscillate then
                table.insert(jkrs, v.key)
            end
        end


        local key = pseudorandom_element(jkrs, "oscillayt")
        return {set = "Joker", area = G.pack_cards, skip_materialize = true, key = key}
    end,
}

SMODS.Booster {
    key = "normal_blursed",
    config = {
        extra = 2,
        choose = 2
    },

    atlas = "osc_w3boosters",
    pos = {x=0,y=2},

    weight = 0.2,
    kind = "blursed",
    group_key = "blursed",
    cost = 3,
    select_card = "jokers",

    loc_vars = function(self, info_queue, card)
        return{vars = {card.ability.choose, card.ability.extra}}
    end,

    create_card = function(self, card, i)
        local jkrs = {}
        for i,v in pairs(G.P_CENTERS) do
            if v.rarity == "osc_blursed" then
                table.insert(jkrs, v.key)
            end
        end


        local key = pseudorandom_element(jkrs, "oscillayt")
        return {set = "Joker", area = G.pack_cards, skip_materialize = true, key = key}
    end,
}

SMODS.Booster {
    key = "jumbo_blursed",
    config = {
        extra = 4,
        choose = 2
    },

    atlas = "osc_w3boosters",
    pos = {x=1,y=2},

    weight = 0.08,
    kind = "blursed",
    group_key = "blursed",
    cost = 6,
    select_card = "jokers",

    loc_vars = function(self, info_queue, card)
        return{vars = {card.ability.choose, card.ability.extra}}
    end,

    create_card = function(self, card, i)
        local jkrs = {}
        for i,v in pairs(G.P_CENTERS) do
            if v.rarity == "osc_blursed" then
                table.insert(jkrs, v.key)
            end
        end


        local key = pseudorandom_element(jkrs, "oscillayt")
        return {set = "Joker", area = G.pack_cards, skip_materialize = true, key = key}
    end,
}

SMODS.Booster {
    key = "mega_blursed",
    config = {
        extra = 6,
        choose = 3
    },

    atlas = "osc_w3boosters",
    pos = {x=2,y=2},

    weight = 0.08,
    kind = "blursed",
    group_key = "blursed",
    cost = 10,
    select_card = "jokers",

    loc_vars = function(self, info_queue, card)
        return{vars = {card.ability.choose, card.ability.extra}}
    end,

    create_card = function(self, card, i)
        local jkrs = {}
        for i,v in pairs(G.P_CENTERS) do
            if v.rarity == "osc_blursed" then
                table.insert(jkrs, v.key)
            end
        end


        local key = pseudorandom_element(jkrs, "oscillayt")
        return {set = "Joker", area = G.pack_cards, skip_materialize = true, key = key}
    end,
}