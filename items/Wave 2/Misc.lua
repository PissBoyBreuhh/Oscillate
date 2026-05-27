SMODS.Consumable {
    key = "candy",
    set = "Spectral",
    atlas = "w2consumables",
    pos = {x=0,y=0},

    loc_vars = function(self, info_queue, card)
        return {vars = { colours = {HEX("FDA9FC")}}}
    end,

    can_use = function(self,card)
        if G.jokers.config.card_limit - #G.jokers.cards >= 1 then return true else return false end
    end,
    use = function(self,card,area,copier)
        G.E_MANAGER:add_event(Event({
            func = function() 
                    local newcard = create_card('Joker', G.jokers, nil, "osc_candy", nil, nil, nil, 'candy'..G.GAME.round_resets.ante)
                    newcard:add_to_deck()
                    G.jokers:emplace(newcard)
                    newcard:start_materialize()
                    G.GAME.joker_buffer = 0
                return true
            end
        }))
    end
}