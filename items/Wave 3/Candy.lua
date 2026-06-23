Oscillate.Joker {
    oscillate_wave = 3,
    key = "coloring",
    rarity = "osc_candy",
    atlas = "w1candy",
    pos = {x=2,y=2},
    cost = 5,

    calculate = function(self,card,context)
        if context.final_scoring_step and not context.blueprint then
            local suit = G.play.cards[1].base.suit or nil
            for _,c in ipairs(G.play.cards) do
                G.E_MANAGER:add_event(Event({
                    trigger = "after",
                    func = function()
                        c:change_suit(suit)
                        c:juice_up(0.5,0.5)
                        card:juice_up(1,1)
                        return true
                    end,
                }))
            end
        end
    end,
}