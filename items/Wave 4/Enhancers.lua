SMODS.Edition {
    key = "first",
    shader = "firstedition",
    badge_colour = HEX("DBD891"),
    weight = 6,
    extra_cost = 5,

    config = {
        dollars_gain = 0.5,
        dollars = 0
    },

    loc_vars = function(self,info_queue,card)
        return {vars = {card.edition.dollars, card.edition.dollars_gain}}
    end,

    calculate = function(self,card,context)
        if (context.post_joker) or (context.main_scoring and context.cardarea == G.play)  then
            card.edition.dollars = card.edition.dollars + card.edition.dollars_gain
            return{dollars = card.edition.dollars}
        end
    end
}

SMODS.Shader {
    key = "firstedition",
    path = "firstedition.fs"
}

SMODS.Enhancement {
    key = "plague",
    atlas = "osc_w4enhancer",
    pos = {x=2,y=1},

    config = {
        time = 3,
    },

    loc_vars = function(self,info_queue,card)
        return {vars = {card.ability.time}}
    end,

    calculate = function(self,card,context)
        if context.cardarea == G.play and context.destroy_card == card then
            if card.ability.time < 0 then
                return {remove = true}
            else
                card.ability.time = card.ability.time - 1
                return {message = tostring(card.ability.time)}
            end
        end
    end,
}