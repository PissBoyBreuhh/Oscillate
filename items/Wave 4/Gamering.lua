SMODS.Consumable {
    set = "Gamering",
    key = "book_virtues",
    atlas = "osc_w4misc",
    pos = {x = 0, y = 0},
    cost = 5,

    config = {
        book_timer = 0
    },

    loc_vars = function(self, card, context)
        local ascend = false
        if G.jokers and G.jokers.highlighted and #G.jokers.highlighted == 1 then
            ascend = Oscillate.CanAscend(G.jokers.highlighted[1])
        end
        return {vars = {ascend and "Can Ascend" or "Cannot Ascend"}}
    end,

    can_use = function(self,card)
        if G.jokers.highlighted and #G.jokers.highlighted == 1 then
            return Oscillate.CanAscend(G.jokers.highlighted[1])
        end

        return false
    end,

    use = function(self,card,area,copier)
        Oscillate.Ascend(G.jokers.highlighted[1])
    end,
}