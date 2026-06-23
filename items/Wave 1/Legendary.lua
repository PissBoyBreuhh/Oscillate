Oscillate.Joker {
    oscillate_wave = 1,
    key = "quantum",
    rarity = 4,
    atlas = "osc_w1legend",
    pos = {x=0,y=0},
    soul_pos = {x=0,y=1},
    config = {
        extra = {
            xmult = 1,
            gain = 0.3,
        },
    },
    blueprint_compat = true,
    cost = 20,

    loc_vars = function(self,info_queue,card)
        return {
            vars = {card.ability.extra.xmult,card.ability.extra.gain},
        }
    end,

    calculate = function(self,card,context)
        if context.selling_card or context.buying_card and not context.blueprint then  card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.gain end
        if context.joker_main then
            return {xmult = card.ability.extra.xmult}
        end
    end,
}

Oscillate.Joker {
    oscillate_wave = 1,
    key = "turkiet",
    rarity = 4,
    atlas = "osc_w1legend",
    pos = {x=1,y=0},
    soul_pos = {x=1,y=1},
    immutable = true,
    config = {
        extra = {
            xchips = 1,
            gain = 0.2
        },
    },
    blueprint_compat = true,
    cost = 20,

    loc_vars = function(self,info_queue,card)
        return {
            vars = {card.ability.extra.xchips,card.ability.extra.gain},
        }
    end,

	calculate = function(self,card,context)
        if context.joker_main then
            return{
                xchips = card.ability.extra.xchips
            }
        end

        if context.end_of_round and context.cardarea == G.jokers then
            card.ability.extra.xchips = card.ability.extra.xchips+(G.GAME.dollars*card.ability.extra.gain)
            return{
                message = localize("k_upgrade_ex"),
                message_card=card
            }
        end
    end
}

Oscillate.Joker {
    oscillate_wave = 1,
    key = "moneycorp",
    rarity = 4,
    atlas = "osc_w1legend",
    pos = {x=2,y=0},
    soul_pos = {x=2,y=1},
    config = {
        extra = {
            money = 2,
        },
    },
    blueprint_compat = true,
    cost = 20,

    loc_vars = function(self,info_queue,card)
        return {
            vars = {card.ability.extra.money},
        }
    end,

	calculate = function(self,card,context)
        if context.individual and context.cardarea == G.play then
            return{
                dollars=card.ability.extra.money
            }
        end
    end
}

Oscillate.Joker {
    oscillate_wave = 1,
    key = "dadproud",
    rarity = 4,
    atlas = "osc_w1legend",
    pos = {x=3,y=0},
    soul_pos = {x=3,y=1},
    immutable = true,
    config = {
        immutable = {
            gain = 1
        }
    },
    blueprint_compat = true,
    cost = 20,

    loc_vars = function(self,info_queue,card)
        card.ability.blueprint_compat_ui = card.ability.blueprint_compat_ui or ""
		card.ability.blueprint_compat_check = nil
		return {
            loc_vars = {card.ability.immutable.gain},
			main_end = (card.area and card.area == G.jokers) and {
				{
					n = G.UIT.C,
					config = { align = "bm", minh = 0.4 },
					nodes = {
						{
							n = G.UIT.C,
							config = {
								ref_table = card,
								align = "m",
								colour = G.C.JOKER_GREY,
								r = 0.05,
								padding = 0.06,
								func = "blueprint_compat",
							},
							nodes = {
								{
									n = G.UIT.T,
									config = {
										ref_table = card.ability,
										ref_value = "blueprint_compat_ui",
										colour = G.C.UI.TEXT_LIGHT,
										scale = 0.32 * 0.8,
									},
								},
							},
						},
					},
				},
			} or nil,
		}
    end,
    update = function(self, card, front)
		if G.STAGE == G.STAGES.RUN then
			local other_joker = G.jokers.cards[1]
			if other_joker and other_joker ~= card and not other_joker.immutable then
				card.ability.blueprint_compat = "compatible"
			else
				card.ability.blueprint_compat = "incompatible"
			end
		end
	end,

	calculate = function(self,card,context)
        if context.end_of_round and context.cardarea == G.jokers then

            function changevals(tbl, firstchildofability)
                for key, value in pairs(tbl) do
                    if type(value) == "table" and key ~= "immutable" then
                        changevals(value,false)
                    elseif type(value) == "number" and not firstchildofability then
                        tbl[key] = value + 1
                    end
                end
                return{tbl}
            end

            if G.jokers.cards[1] ~= self and not G.jokers.cards[1].immutable then
                local ability = G.jokers.cards[1].ability
                G.jokers.cards[1].ability = changevals(ability,true)[1]
                G.E_MANAGER:add_event(Event({
                    trigger = "after",
                    card:juice_up(1,1),
                    G.jokers.cards[1]:juice_up(0.5,0.5)
                }))
                return{
                    message=localize("k_upgrade_ex"),
                    message_card = G.jokers.cards[1]
                }
            end
        end
    end
}