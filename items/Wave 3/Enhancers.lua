SMODS.Seal {
    key = "seal?",
    badge_colour = HEX("333333"),
    atlas = "osc_w3enhancers",
    pos = {x=1,y=1},

    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then          
            card:set_seal(SMODS.poll_seal({type_key = "seal?", guaranteed = true}))
        end
    end,
}

SMODS.Enhancement {
    key = "enhancement?",
    badge_colour = HEX("333333"),
    atlas = "osc_w3enhancers",
    pos = {x=0,y=0},

    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then          
            card:set_ability(SMODS.poll_enhancement({type_key = "enhancement?", guaranteed = true}))
        end
    end,
}

SMODS.Edition {
    key = "edition?",
    shader = "editionq",
    badge_colour = HEX("333333"),
    weight = 6,
    extra_cost = 3,

    calculate = function(self,card,context)
        if (context.post_joker) or (context.main_scoring and context.cardarea == G.play) then
            card:set_edition(SMODS.poll_edition({type_key = "edition?", guaranteed = true}))
        end
    end
}

SMODS.Shader {
    key = "editionq",
    path = "editionq.fs"
}