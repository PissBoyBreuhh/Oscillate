SMODS.Seal {
    key = "incubus",
    atlas = "osc_w1enhancers",
    pos = {x=2,y=0},
    config = { extra = { chance = 3 } },
    badge_colour = HEX("921A42"),

    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(self, 1, self.config.extra.chance, 'incubus')
        return { vars = { numerator, denominator } }
    end,

    calculate = function(self, card, context)
        if context.repetition and SMODS.pseudorandom_probability(self, 'incubus', 1, self.config.extra.chance) then
            local othercard = card
            G.E_MANAGER:add_event(Event({
                trigger = "after",
                func = function()
                    G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                    local _card = copy_card(othercard)
                    _card:set_ability("m_osc_ghost")
                    _card:add_to_deck()
                    G.deck.config.card_limit = G.deck.config.card_limit + 1
                    G.deck:emplace(_card)
                    table.insert(G.playing_cards,_card)
                    card:juice_up(0.5,0.5)
                    return true
                end
            }))
        end
    end,
}

SMODS.Sound {
    key = "scream",
    path = {
        ['default']="scream.ogg",
        ['it']="august.ogg"
    }
}

SMODS.Sound {
    key = "purgatori music",
    path = "music_purgatori.ogg",
    pitch = 1,
    
    select_music_track = function(self)
        for _,c in ipairs((G.jokers or {cards = {}}).cards) do
            if c.ability.name == "j_osc_congregation" then return {100} end
        end
    end
}

SMODS.Rarity {
    key = "candy",
    loc_txt = {name="Candy Crush"},
    default_weight = 1,
    pools = {
        ["Joker"] = {weight=0.01},
        ["Candies"] = true
    },
    badge_colour = HEX("FDA9FC") 
}

SMODS.Rarity {
    key = "blursed",
    loc_txt = {name="Blursed"},
    default_weight = 1,
    pools = {
        ["Joker"] = false,
    },
    badge_colour = HEX("3D1F38")
}

SMODS.Enhancement {
    key = "jellyfish",
    atlas = "osc_w1enhancers",
    pos = {x=0,y=0},
    config = {
        extra = {
            mult = 5,
        }
    },

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.mult}}
    end,

    calculate = function(self, card, context)
        if context.main_scoring then
            if G.GAME.blind.boss then return {
                mult = card.ability.extra.mult
            }
            end
        end
    end,
}

SMODS.Enhancement {
    key = "divine",
    atlas = "osc_w1enhancers",
    pos = {x=1,y=0},
    config = {
        cantrigger = true,
        extra = {
            xchips = 1.5,
            gain = 0.05
        },
    },

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.xchips,card.ability.extra.gain}}
    end,

    calculate = function(self, card, context)
        if context.before and context.cardarea == G.play and not card.ability.cantrigger then card.ability.cantrigger = true end
        if context.after and context.cardarea == G.hand and card.ability.cantrigger then
            card.ability.cantrigger = false
            local right,left
            for i,c in ipairs(G.hand.cards) do
                if c == card then
                    right = G.hand.cards[i+1]
                    left = G.hand.cards[i-1]
                end
            end
            G.E_MANAGER:add_event(Event {
                trigger = "after",
                func = function()
                    local didspread = false
                    if left and left.ability.set == 'Default' then
                        left:set_ability(self)
                        left.ability.extra.xchips = card.ability.extra.xchips - card.ability.extra.gain
                        left:juice_up(0.5,0.5)
                        didspread = true
                    end
                    if right and right.ability.set == 'Default' then
                        right:set_ability(self)
                        right.ability.extra.xchips = card.ability.extra.xchips - card.ability.extra.gain
                        right:juice_up(0.5,0.5)
                        didspread = true
                    end
                    if didspread then card:juice_up(1,1) end
                    return true
                 end,
            })
        end
        if context.cardarea == G.play and context.main_scoring then
            return {xchips = card.ability.extra.xchips}
        end
    end,
}

SMODS.Consumable {
    key = "blursed",
    set = "Spectral",
    atlas = "osc_w1consumables",
    pos = {x=0,y=0},

    loc_vars = function(self, info_queue, card)
        return {vars = { colours = {HEX("3D1F38")}}}
    end,

    can_use = function(self,card)
        if G.jokers.config.card_limit - #G.jokers.cards >= 1 then return true else return false end
    end,
    use = function(self,card,area,copier)
        G.E_MANAGER:add_event(Event({
            func = function() 
                    local newcard = create_card('Joker', G.jokers, nil, "osc_blursed", nil, nil, nil, 'blursed'..G.GAME.round_resets.ante)
                    newcard:add_to_deck()
                    G.jokers:emplace(newcard)
                    newcard:start_materialize()
                    G.GAME.joker_buffer = 0
                return true
            end
        }))
    end
}

SMODS.Sound {
    key = "candycrushvoice1",
    path = "Voice_Divine.ogg",
}
SMODS.Sound {
    key = "candycrushvoice2",
    path = "Voice_Juicy.ogg",
}
SMODS.Sound {
    key = "candycrushvoice3",
    path = "Voice_soda_crush.ogg",
}
SMODS.Sound {
    key = "candycrushvoice4",
    path = "Voice_Sodalicious.ogg",
}
SMODS.Sound {
    key = "candycrushvoice5",
    path = "Voice_Tasty.ogg",
}
