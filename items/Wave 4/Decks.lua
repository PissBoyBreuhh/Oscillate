SMODS.Back {
    key = "queen",
    atlas = "osc_w4misc",
    pos = { x = 1, y = 0},
    unlocked = true,
    apply = function(self, back)
        G.E_MANAGER:add_event(Event({
            func = function()
                for k, v in ipairs(G.playing_cards) do
                    v:set_seal("osc_honey",true,true)
                end
                return true
            end
        }))
    end,
}