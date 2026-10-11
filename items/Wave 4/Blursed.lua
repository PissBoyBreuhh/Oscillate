Oscillate.Joker{ 
    oscillate_wave = 4,
    key = "blockophobia",
    rarity = "osc_blursed",
    atlas = "osc_w4otherjokers",
    pos = {x=2, y=0},
    cost = 0,

    loc_vars = function(self,info_queue,card)
        return {vars = {card.ability.extra.xchips}}
    end,

    config = {
        extra = {
            xchips = 2
        }
    },

    calculate = function(self,card,context)
        if context.individual and context.cardarea == G.play then
            local value = context.other_card:get_chip_bonus()

            if math.sqrt(value) % 1 == 0 or (value ^ (1/3)) % 1 == 0 then
                return{xchips = card.ability.extra.xchips}
            end
        end
    end
}