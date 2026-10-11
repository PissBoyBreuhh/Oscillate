Oscillate.hitchance = function(pseudotext,numerator,denominator)
    return pseudorandom(pseudotext) < (G.GAME.probabilities.normal+numerator-1)/denominator
end

local old_ease_dollars = ease_dollars
function ease_dollars(mod, instant)
    local debt = G.GAME.osc_debt or 0
    if debt > 0 and mod > 0 then
        local lose = math.min(debt, mod)
        debt = debt - lose
        mod = mod - lose
    end
    G.GAME.osc_debt = debt
    if mod ~= 0 then
        old_ease_dollars(mod, instant)
    end
end

Oscillate.add_debt = function(mod)
    G.GAME.osc_debt = (G.GAME.osc_debt or 0) + mod
end

local old_pseudorandom = pseudorandom
function pseudorandom(seed, min, max)
    if G.GAME.osc_scumming then
        return old_pseudorandom((seed or "a") .. os.date("%S%M%H"), min, max)
    end
    return old_pseudorandom(seed, min, max)
end

local old_pseudorandom_element = pseudorandom_element
function pseudorandom_element(_t, seed)
    if G.GAME.osc_scumming then
        return old_pseudorandom_element(_t, (seed or "a") .. os.date("%S%M%H"))
    end
    return old_pseudorandom_element(_t, seed)
end

G.C.OSC_CRIT = HEX("edcb93")
G.C.OSC_POWER = HEX("ba885f")

local old_loc_colour = loc_colour
function loc_colour(_c, _default)
  if _c == "osc_crit" then return G.C.OSC_CRIT end
  if _c == "osc_power" then return G.C.OSC_POWER end
  if _c == "osc_song" then return G.C.OSC_SONG end
  return old_loc_colour(_c, _default)
end

Oscillate.effects = {"osc_crit","osc_power"}
for k, v in pairs(Oscillate.effects) do
	table.insert(SMODS.scoring_parameter_keys or SMODS.calculation_keys, v)
end

local old_scie = SMODS.calculate_individual_effect
function SMODS.calculate_individual_effect(effect, scored_card, key, amount, from_edition) 
    local is_scoring = false
	for k in pairs(SMODS.Scoring_Parameters) do
		if key:find(k) then
			is_scoring = true
			break
		end
	end

    local ret = old_scie(effect, scored_card, key, amount, from_edition)
    if ret then return ret end

    if (key == "osc_crit") and amount ~= 0 then
        if effect.card then juice_card(effect.card) end
        G.GAME.osc_critchance = G.GAME.osc_critchance + amount/100

        if not effect.remove_default_message then
            card_eval_status_text(effect.message_card or effect.juice_card or scored_card or effect.card or effect.focus, "extra", nil, nil, nil, {message = effect.crit_message or ((amount > 0 and "+" or "-") .. math.abs(amount) .. "%"), colour = G.C.OSC_CRIT})
        end
    end

    if (key == "osc_power") and amount ~= 0 then
        if effect.card then juice_card(effect.card) end
        G.GAME.osc_critamount = G.GAME.osc_critamount + amount

        if not effect.remove_default_message then
            card_eval_status_text(effect.message_card or effect.juice_card or scored_card or effect.card or effect.focus, "extra", nil, nil, nil, {message = effect.crit_message or ((amount > 0 and "+" or "-") .. math.abs(amount)), colour = G.C.OSC_POWER})
        end
    end

    if is_scoring and G.GAME.osc_critchance > pseudorandom("OscillateCrit") then -- crit taken from Eris' mod "Hypernova" and changed slightly for my usage
        amount = amount * G.GAME.osc_critamount
	end

    return true
end

Oscillate.reset_game_globals = function(run_start)
    if run_start then
        G.GAME.osc_critchance, G.GAME.osc_critamount = 0, 2
        G.GAME.osc_whitehole = {}
        G.GAME.osc_seal_buffs = {}
    end
end

Oscillate.versions = {
    "Release!",
    "P Galore!",
    "Gambling!",
    "Musical!",
    "Inclusive!"
}

Oscillate.get_badge = function(wave)
    if wave == "omega" then return create_badge("OSCILLATION", Oscillate.badge_colour, G.C.WHITE, 2) end

    local color = Oscillate.badge_colour
    if wave == 2 then color = HEX("45de3a") end
    if wave == 3 then color = HEX("ff9333") end
    if wave == 4 then color = HEX("e683e2") end
    if wave == 5 then color = HEX("888888") end

    Osc_config.mod_badge_names = math.floor(Osc_config.mod_badge_names + 0.5)
    return 
        (Osc_config.mod_badge_names == 4 and create_badge("Oscillate Wave " .. wave .. ": " .. Oscillate.versions[wave], color, G.C.WHITE)) or 
        (Osc_config.mod_badge_names == 3 and create_badge("Oscillate W" .. wave .. ": " .. Oscillate.versions[wave], color, G.C.WHITE)) or
        (Osc_config.mod_badge_names == 2 and create_badge("Oscillate Wave " .. wave, color, G.C.WHITE)) or 
        (create_badge("Oscillate W" .. wave, color, G.C.WHITE))
end

Oscillate.Joker = SMODS.Joker:extend {
    no_mod_badges = true,
    from_oscillate = true,
    inject = function(self)
        SMODS.Joker.inject(self)
        
        local old_sb = self.set_badges or function() end
        self.set_badges = function(_self, _card, badges)
            old_sb(_self, _card, badges)
 		    badges[#badges+1] = Oscillate.get_badge(_card.config.center.oscillate_wave)
 	    end

        local old_lv = self.loc_vars or function() end
        self.loc_vars = function(_self, info_queue, _card)
            local info
            if _card.config then
                info = _card.config.center.oscillate_info
            end
            if info then
                if info.credit then
                    info_queue[#info_queue+1] = {set = "Other", key = "osc_" .. info.credit:lower()}
                end

                if info.crit then
 		            info_queue[#info_queue+1] = {set = "Other", key = "osc_crit_info", vars = {math.floor((G.GAME.osc_critchance or 0)*1000)/10, math.floor((G.GAME.osc_critamount or 2)*100)/100}}
                end
            end

            return old_lv(_self, info_queue, _card)
 	    end
    end,
}

Oscillate.albums = {
    unholyness = {pos = {x = 0, y = 0}, name = "Unholyness: The Collective"},
    tapes = {pos = {x = 1, y = 0}, name = "Tapes of The Unholy"},
    congregation = {pos = {x = 0, y = 1}, name = "A Congregation of Unholyness"},
    jane = {pos = {x = 1, y = 1}, name = "Jane Keyboard Night"}
}

Oscillate.get_song_badge = function(album)
    local selection = Oscillate.albums[album]
    return {n=G.UIT.R, config={align = "cm"}, nodes={
      {n=G.UIT.C, config={align = "cm", r = 10, colour = HEX("ffffff"), minw = 2, minh = 0.4, emboss = 0.05, padding = 0.1}, nodes={
        {n=G.UIT.R, config={align = "cm"}, nodes = {
            {n=G.UIT.T, config={text = "Album:", colour = G.C.UI.TEXT_DARK, scale = 0.4}},
        }},
        {n=G.UIT.R, config={align = "cm"}, nodes = {
            {n=G.UIT.T, config={text = selection.name, colour = G.C.UI.TEXT_DARK, scale = 0.2}},
        }},
        {n=G.UIT.R, config={align = "cm"}, nodes = {
            {n=G.UIT.O, config={object = SMODS.create_sprite(0, 0, 2, 2, "osc_w4covers", selection.pos)}},
        }},
      }}
    }}
end

SMODS.draw_ignore_keys.oscillate_layer = true
SMODS.DrawStep {
    key = 'oscillate_layer',
    order = 55,
    func = function(self)
        if self.config.center.oscillate_layer and (self.config.center.discovered or self.bypass_discovery_center) then
            local scale_mod = 0.01*math.sin(1.3*G.TIMERS.REAL) + 0.03*math.sin(0.93*G.TIMERS.REAL - math.cos(G.TIMERS.REAL)) - 0.02*math.cos(0.83*G.TIMERS.REAL + 0.2*math.sin(G.TIMERS.REAL))^2
            local rotate_mod = 0.01*math.cos(0.83*G.TIMERS.REAL) + 0.03*math.sin(1.2*G.TIMERS.REAL + math.abs(math.cos(0.66*G.TIMERS.REAL))) - 0.02*math.sin(1.22*G.TIMERS.REAL + 0.3*math.cos(G.TIMERS.REAL))

            if type(self.config.center.oscillate_layer.draw) == 'function' then
                self.config.center.oscillate_layer.draw(self, scale_mod, rotate_mod)
            elseif self.children.oscillate_layer then
                self.children.oscillate_layer:draw_shader('dissolve',0, nil, nil, self.children.center,scale_mod, rotate_mod,nil, 0.1 + 0.03*math.sin(1.8*G.TIMERS.REAL),nil, 0.6)
                self.children.oscillate_layer:draw_shader('dissolve', nil, nil, nil, self.children.center, scale_mod, rotate_mod)
            end
            if self.edition then 
                local edition = G.P_CENTERS[self.edition.key]
                if edition.apply_to_float and self.children.oscillate_layer then
                    self.children.oscillate_layer:draw_shader(edition.shader, nil, nil, nil, self.children.center, scale_mod, rotate_mod)                    
                end
            end
        end
    end,
    conditions = { vortex = false, facing = 'front' },
} 

local old_set_sprites = Card.set_sprites
function Card:set_sprites(_center, _front)
    old_set_sprites(self, _center, _front)

    if _center then
        if _center.oscillate_layer or _center[G.SETTINGS.colourblind_option and 'hc_osc_atlas' or 'lc_osc_atlas'] or _center.osc_atlas then
			if self.children.oscillate_layer then self.children.oscillate_layer:remove() end
            local atlas_key = _center[G.SETTINGS.colourblind_option and 'hc_osc_atlas' or 'lc_osc_atlas'] or _center.osc_atlas or _center[G.SETTINGS.colourblind_option and 'hc_atlas' or 'lc_atlas'] or _center.atlas or _center.set
            self.children.oscillate_layer = SMODS.create_sprite(self.T.x, self.T.y, self.T.w, self.T.h, atlas_key, _center.oscillate_layer or { x = 0, y = 0 })
            self.children.oscillate_layer.role.draw_major = self
            self.children.oscillate_layer.states.hover.can = false
            self.children.oscillate_layer.states.click.can = false
        end
    end
end

Oscillate.CanAscend = function(card)
    if Oscillate.Ascension[card.config.center.key] or Oscillate.Ascension[card.config.center.rarity] then
        return true
    end

    return false
end

Oscillate.Ascend = function(card)
    if Oscillate.Ascension[card.config.center.key] then
        SMODS.destroy_cards(card)
        SMODS.add_card({key = Oscillate.Ascension[card.config.center.key]})
    end

    if Oscillate.Ascension[card.config.center.rarity] then
        SMODS.destroy_cards(card)
        SMODS.add_card({key = Oscillate.Ascension[card.config.center.rarity]})
    end
end

Oscillate.CountBees = function()
    if G.hand and G.hand.cards then
        local count = 0
        for i,v in ipairs(G.hand.cards) do
            if v:get_seal() == "osc_honey" then count = count + (G.GAME.osc_seal_buffs.honey and 2 or 1) end
        end

        return count
    end
    return 0
end