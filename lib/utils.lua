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