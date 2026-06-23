Oscillate.Joker {
    oscillate_wave = 1,
    key = "osc_weakness",
    rarity = 3,
    atlas = "osc_w1rare",
    pos = {x=0,y=0},
    immutable = true,
    config = {
    },
    cost = 9,

    loc_vars = function(self,info_queue,card)
        return {}
    end,

    calculate = function(self,card,context)
        if G.GAME.current_round.hands_played == 0 and G.GAME.blind and G.GAME.blind.boss and not G.GAME.blind.disabled and not context.blueprint then
            G.GAME.blind:disable()
            play_sound('timpani')
            card_eval_status_text(self, 'extra', nil, nil, nil, {message = localize('ph_boss_disabled')})
        elseif G.GAME.current_round.hands_played == 1 and G.GAME.blind and G.GAME.blind.boss and G.GAME.blind.disabled and not context.blueprint then
            G.GAME.blind.disabled = false
            card_eval_status_text(self, 'extra', nil, nil, nil, {message = "blind enabled!"})
            G.GAME.blind:set_text()
        end
    end,
}

Oscillate.Joker {
    oscillate_wave = 1,
    key = "lilith",
    rarity = 3,
    atlas = "osc_w1rare",
    pos = {x=1,y=0},
    immutable = true,
    config = {
    },
    cost = 8,

    loc_vars = function(self,info_queue,card)
        info_queue[#info_queue+1] = G.P_SEALS.osc_incubus
    end,

    calculate = function(self,card,context)
        if context.before and not context.blueprint then
            for i,v in ipairs(context.full_hand) do
                if v:get_seal() ~= "osc_incubus" then
                v:set_seal("osc_incubus")
			    G.E_MANAGER:add_event(Event {
                    trigger = "immediate",
                    func = function()
                        v:juice_up(0.5,0.5)       
                        return true
                    end
                })
                end
            end
        end
    end,
}

Oscillate.Joker {
    oscillate_wave = 1,
    key = "plague",
    rarity = 3,
    atlas = "osc_w1rare",
    pos = {x=2,y=0},
    config = {
        extra = {
            xmult = 4
        }
    },
    blueprint_compat = true,
    cost = 9,

    loc_vars = function(self,info_queue,card)
        return{vars = {card.ability.extra.xmult}}
    end,

    calculate = function(self,card,context)
        if context.joker_main then
			return {xmult = card.ability.extra.xmult}
        end
    end,

    update = function(self, card, dt)
		if G.deck and card.added_to_deck then
			for i, v in pairs(G.deck.cards) do
				if v:is_face() then
					v:set_debuff(true)
				end
			end
		end
		if G.hand and card.added_to_deck then
			for i, v in pairs(G.hand.cards) do
				if v:is_face() then
					v:set_debuff(true)
				end
			end
		end
	end,
}

Oscillate.Joker {
    oscillate_wave = 1,
    key = "damocles",
    rarity = 3,
    atlas = "osc_w1rare",
    pos = {x=0,y=1},
    config = {
        weirdfix = 0, -- weird bug I saw about update function updating even when card isnt bought
        extra = {
            chance = 100000,
        },
        immutable = {
            delta = 0
        }
    },
    blueprint_compat = true,
    cost = 8,

    loc_vars = function(self,info_queue,card)
        return { vars = {card.ability.extra.chance,card.ability.extra.xchips,card.ability.extra.xmult,G.GAME.probabilities.normal} }
    end,

    add_to_deck = function(self, card, from_debuff)
        card.ability.immutable.delta = G.GAME.shop.joker_max
        change_shop_size(card.ability.immutable.delta)
    end,

    remove_from_deck = function(self, card, from_debuff)
        change_shop_size(-card.ability.immutable.delta)
    end,

    update = function(self,card,dt)
        if Oscillate.hitchance("damocles",1,card.ability.extra.chance) and card.ability.weirdfix == 1 then
            card_eval_status_text(self, 'card', nil, nil, nil, {message = "loser"})
            G.hand:change_size(-#G.hand.cards)
        end
    end
}

Oscillate.Joker {
    oscillate_wave = 1,
    key = "congregation",
    rarity = 3,
    atlas = "osc_w1rare",
    pos = {x=1,y=1},
    config = {
        extra = {
            mult = 5,
        }
    },
    blueprint_compat = true,
    cost = 10,

    loc_vars = function(self,info_queue,card)
        return { vars = {card.ability.extra.mult } }
    end,

    calculate = function(self,card,context)
        if context.other_joker and context.other_joker.ability.set == "Joker" then
			G.E_MANAGER:add_event(Event({
				func = function()
					context.other_joker:juice_up(0.5, 0.5)
					return true
				end,
			}))
			return {
				mult = card.ability.extra.mult,
                message_card = context.other_joker
			}
		end
    end,
}

Oscillate.Joker {
    oscillate_wave = 1,
    key = "candycrush",
    rarity = 3,
    atlas = "osc_w1rare",
    pos = {x=2,y=1},
    config = {
        extra = {
            cards = 1,
        },
        immutable = {
            maxcards = 3,
            cantrigger = true,
        }
    },
    cost = 10,

    loc_vars = function(self,info_queue,card)
        return { 
            vars = {math.min(card.ability.extra.cards,card.ability.immutable.maxcards),
                (card.ability.extra.cards == 1 and "" or "s"),
                colours = { HEX("FDA9FC") }
            },
        }
    end,
    
    calculate = function(self,card,context)
        if context.ending_shop then card.ability.immutable.cantrigger = true end
        if context.end_of_round and card.ability.immutable.cantrigger and not context.blueprint then
            if G.jokers.config.card_limit - #G.jokers.cards >= 1 then
                play_sound("osc_candycrushvoice"..math.random(5),1,1)
                card.ability.immutable.cantrigger = false
			    G.GAME.joker_buffer = G.GAME.joker_buffer+math.min(card.ability.extra.cards,card.ability.immutable.maxcards,G.jokers.config.card_limit - #G.jokers.cards)
                G.E_MANAGER:add_event(Event({
                    func = function() 
                        for i = 1, math.min(math.min(card.ability.extra.cards,card.ability.immutable.maxcards),math.max(G.jokers.config.card_limit - #G.jokers.cards,0)) do
                            local newcard = create_card('Joker', G.jokers, nil, "osc_candy", nil, nil, nil, 'candycrush')
                            newcard:add_to_deck()
                            G.jokers:emplace(newcard)
                            newcard:start_materialize()
                            G.GAME.joker_buffer = 0
                            end
                        return true
                    end
                }))
                card:juice_up(1,1)
            end
		end
    end,
}