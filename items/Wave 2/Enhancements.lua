SMODS.Enhancement {
    key = "ghost",
    atlas = "osc_w2enhancement",
    pos = {x=0,y=0},

    calculate = function(self,card,context)
        if context.cardarea == G.play and context.destroy_card == card then
            return {remove = true}
        end
    end,
}

SMODS.Enhancement {
    key = "soggy",
    atlas = "osc_w2enhancement",
    pos = {x=1,y=0},

    calculate = function(self,card,context)
        if context.cardarea == G.play and context.main_scoring then
            local left, right
            for i,v in ipairs(G.play.cards) do
                if v == card then
                    if G.play.cards[i-1] then left = G.play.cards[i-1] end
                    if G.play.cards[i+1] then right = G.play.cards[i+1] end
                end
            end
            local chips = 0
            if left then chips = chips + left.base.nominal end
            if right then chips = chips + right.base.nominal end
            return {
                chips = chips/5
            }
        end
    end,
}