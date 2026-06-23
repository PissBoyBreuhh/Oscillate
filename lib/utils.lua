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
  return old_loc_colour(_c, _default)
end

Oscillate.mod_crit = function(mod, crit, type, card, message, hide_message)
    if not crit then return end
    if not type then type = "add" end

    if crit == "chance" then
        if type == "add" and mod ~= 0 then
            G.GAME.osc_critchance = G.GAME.osc_critchance + mod/100
            if not hide_message then card_eval_status_text(card, "extra", nil, nil, nil, {message = message or ((mod > 0 and "+" or "-") .. math.abs(mod) .. "%"), colour = G.C.OSC_CRIT}) end
        elseif type == "mul" and mod ~= 1 then
            G.GAME.osc_critchance = G.GAME.osc_critchance * mod
            if not hide_message then card_eval_status_text(card, "extra", nil, nil, nil, {message = message or ("X" .. mod), colour = G.C.OSC_CRIT}) end
        end
    elseif crit == "amount" then
        if type == "add" and mod ~= 0 then
            G.GAME.osc_critamount = G.GAME.osc_critamount + mod
            if not hide_message then card_eval_status_text(card, "extra", nil, nil, nil, {message = message or ((mod > 0 and "+" or "-") .. math.abs(mod)), colour = G.C.OSC_POWER}) end
        elseif type == "mul" and mod ~= 1 then
            G.GAME.osc_critamount = G.GAME.osc_critamount * mod
            if not hide_message then card_eval_status_text(card, "extra", nil, nil, nil, {message = message or ("X" .. mod), colour = G.C.OSC_POWER}) end
        end
    end
end


local old_scie = SMODS.calculate_individual_effect
function SMODS.calculate_individual_effect(effect, scored_card, key, amount, from_edition) 
    local is_scoring = false
    local changed = false
	for k in pairs(SMODS.Scoring_Parameters) do
		if key:find(k) then
			is_scoring = true
			break
		end
	end

    if is_scoring and G.GAME.osc_critchance > pseudorandom("OscillateCrit") then -- crit taken from Eris' mod "Hypernova" and changed slightly for my usage
        amount = amount * G.GAME.osc_critamount
		changed = true
	end

	if changed and key:sub(-4) == "_mod" then
		key = key:sub(0,-5)
		effect.message = nil
	end

    return old_scie(effect, scored_card, key, amount, from_edition)
end

Oscillate.reset_game_globals = function(run_start)
    if run_start then
        G.GAME.osc_critchance, G.GAME.osc_critamount = 0, 2
        G.GAME.osc_whitehole = {}
    end
end

Oscillate.get_badge = function(wave)
    if wave == "omega" then return create_badge("OSCILLATION", Oscillate.badge_colour, G.C.WHITE, 2) end

    local color = Oscillate.badge_colour
    if wave == 2 then color = HEX("45de3a") end
    if wave == 3 then color = HEX("ff9333") end
    return create_badge("Oscillate W" .. wave, color, G.C.WHITE)    
    
end

Oscillate.Joker = SMODS.Joker:extend {
    no_mod_badges = true,
    from_oscillate = true,
    set_badges = function(self, card, badges)
        badges[#badges+1] = Oscillate.get_badge(card.config.center.oscillate_wave)
    end
}

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