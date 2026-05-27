SMODS.Joker {
    key = "osc_more_bee_us",
    rarity = 4,
    atlas = "osc_w2bees",
    pos = {x=0,y=1},
    soul_pos = {x=1,y=1},
    config = {
        extra = {
            money = 1
        }
    },
    blueprint_compat = true,
    cost = 20,

    loc_vars = function(self,info_queue,card)
        return{vars={card.ability.extra.money}}
    end,

    calculate = function(self,card,context)
        if context.pre_discard or context.before or context.setting_blind or context.buying_card or context.reroll_shop or context.selling_card or (context.end_of_round and context.main_eval) or context.skip_blind or context.using_consumeable then
            return{dollars=card.ability.extra.money}
        end
    end,
}

SMODS.Joker {
    key = "osc_antons_guide",
    rarity = 4,
    atlas = "osc_w2legendary",
    pos = {x=0,y=0},
    soul_pos = {x=1, y=0},
    config = {
        extra = {
            bought = 0,
            can_save = true
        },
        immutable = {
            requirement = 100
        }
    },
    blueprint_compat = true,
    cost = 20,

    loc_vars = function(self,info_queue,card)
        return{ vars={card.ability.extra.bought,card.ability.immutable.requirement, (card.ability.extra.can_save and "Can prevent" or "Cannot prevent")} }
    end,

    calculate = function(self,card,context)
        if context.end_of_round and context.game_over and context.main_eval then
            if G.GAME.blind.boss and card.ability.extra.can_save then
                card.ability.extra.can_save = false
                G.E_MANAGER:add_event(Event({
                    func = function()
                        G.hand_text_area.blind_chips:juice_up()
                        G.hand_text_area.game_chips:juice_up()
                        play_sound('tarot1')
                        return true
                    end
                }))
                return {
                    message = localize('k_saved_ex'),
                    saved = 'saved_anton',
                    colour = G.C.RED
                }
            end
        end

        if context.money_altered and context.from_shop then
            card.ability.extra.bought = card.ability.extra.bought + context.amount
            if card.ability.extra.bought >= card.ability.immutable.requirement then
                card.ability.extra.can_save = true
                card.ability.extra.bought = 0
                return {
                    message = "can save!",
                    card = card
                }
            end
        end
    end
}