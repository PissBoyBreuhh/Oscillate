Oscillate = SMODS.current_mod
Oscillate.current_wave = 3

SMODS.Atlas {
    key = "osc_placeholders",
    path = "placeholders.png",
    px = 71,
    py = 95
}

SMODS.Atlas {
    key = "osc_w1common",
    path = "wave1common.png",
    px = 71,
    py = 95
}

SMODS.Atlas {
    key = "osc_w1uncommon",
    path = "wave1uncommon.png",
    px = 71,
    py = 95
}

SMODS.Atlas {
    key = "osc_w1rare",
    path = "wave1rare.png",
    px = 71,
    py = 95
}

SMODS.Atlas {
    key = "osc_w1legend",
    path = "wave1legend.png",
    px = 71,
    py = 95
}

SMODS.Atlas {
    key = "osc_w1candy",
    path = "wave1candy.png",
    px = 71,
    py = 95
}

SMODS.Atlas {
    key = "osc_w1blursed",
    path = "wave1blursed.png",
    px = 71,
    py = 95
}

SMODS.Atlas {
    key = "osc_w1enhancers",
    path = "wave1enhancers.png",
    px = 71,
    py = 95
}

SMODS.Atlas {
    key = "osc_w1consumables",
    path = "wave1consumables.png",
    px = 71,
    py = 95
}

SMODS.Atlas {
    key = "osc_w2common",
    path = "wave2common.png",
    px = 71,
    py = 95
}

SMODS.Atlas {
    key = "osc_w2uncommon",
    path = "wave2uncommon.png",
    px = 71,
    py = 95
}

SMODS.Atlas {
    key = "osc_w2legendary",
    path = "wave2legendary.png",
    px = 71,
    py = 95
}

SMODS.Atlas {
    key = "osc_w2blursed",
    path = "wave2blursed.png",
    px = 71,
    py = 95
}

SMODS.Atlas {
    key = "osc_w2bees",
    path = "wave2bees.png",
    px = 71,
    py = 95
}

SMODS.Atlas {
    key = "osc_w2p",
    path = "wave2p.png",
    px = 71,
    py = 95
}

SMODS.Atlas {
    key = "osc_w2plush",
    path = "wave2plush.png",
    px = 71,
    py = 95
}

SMODS.Atlas {
    key = "osc_w2wizard",
    path = "wave2wizard.png",
    px = 71,
    py = 95
}

SMODS.Atlas {
    key = "osc_w2gamering",
    path = "wave2gamering.png",
    px = 71,
    py = 95
}

SMODS.Atlas {
    key = "osc_w2consumables",
    path = "wave2consumables.png",
    px = 71,
    py = 95
}

SMODS.Atlas {
    key = "osc_w2enhancement",
    path = "wave2enhancement.png",
    px = 71,
    py = 95
}

SMODS.Atlas {
    key = "osc_w3fdj",
    path = "wave3fdj.png",
    px = 710,
    py = 950
}

SMODS.Atlas {
    key = "osc_w3common",
    path = "wave3common.png",
    px = 71,
    py = 95
}

SMODS.Atlas {
    key = "osc_w3uncommon",
    path = "wave3uncommon.png",
    px = 71,
    py = 95
}

SMODS.Atlas {
    key = "osc_w3rare",
    path = "wave3rare.png",
    px = 71,
    py = 95
}

SMODS.Atlas {
    key = "osc_w3p",
    path = "wave3p.png",
    px = 71,
    py = 95
}

SMODS.Atlas {
    key = "osc_w3crit",
    path = "wave3crit.png",
    px = 71,
    py = 95
}

SMODS.Atlas {
    key = "osc_w3plushie",
    path = "wave3plushie.png",
    px = 71,
    py = 95
}

SMODS.Atlas {
    key = "osc_w3blursed",
    path = "wave3blursed.png",
    px = 71,
    py = 95
}

SMODS.Atlas {
    key = "osc_w3legendary",
    path = "wave3legendary.png",
    px = 71,
    py = 95
}

SMODS.Atlas {
    key = "osc_w3enhancers",
    path = "wave3enhancers.png",
    px = 71,
    py = 95
}

SMODS.Atlas {
    key = "osc_w3gamering",
    path = "wave3gamering.png",
    px = 71,
    py = 95
}

SMODS.Atlas {
    key = "osc_w3boosters",
    path = "wave3boosters.png",
    px = 71,
    py = 95
}

NFS.load(Oscillate.path.."lib/utils.lua")()

NFS.load(Oscillate.path.."items/Wave 1/misc.lua")()
NFS.load(Oscillate.path.."items/Wave 1/common.lua")()
NFS.load(Oscillate.path.."items/Wave 1/uncommon.lua")()
NFS.load(Oscillate.path.."items/Wave 1/rare.lua")()
NFS.load(Oscillate.path.."items/Wave 1/candy.lua")()
NFS.load(Oscillate.path.."items/Wave 1/blursed.lua")()
NFS.load(Oscillate.path.."items/Wave 1/legendary.lua")()

NFS.load(Oscillate.path.."items/Wave 2/misc.lua")()
NFS.load(Oscillate.path.."items/Wave 2/gamering.lua")()
NFS.load(Oscillate.path.."items/Wave 2/enhancements.lua")()
NFS.load(Oscillate.path.."items/Wave 2/common.lua")()
NFS.load(Oscillate.path.."items/Wave 2/uncommon.lua")()
NFS.load(Oscillate.path.."items/Wave 2/rare.lua")()
NFS.load(Oscillate.path.."items/Wave 2/p.lua")()
NFS.load(Oscillate.path.."items/Wave 2/plushies.lua")()
NFS.load(Oscillate.path.."items/Wave 2/blursed.lua")()
NFS.load(Oscillate.path.."items/Wave 2/legendary.lua")()
NFS.load(Oscillate.path.."items/Wave 2/wizard.lua")()

NFS.load(Oscillate.path.."items/Wave 3/boosters.lua")()
NFS.load(Oscillate.path.."items/Wave 3/enhancers.lua")()
NFS.load(Oscillate.path.."items/Wave 3/common.lua")()
NFS.load(Oscillate.path.."items/Wave 3/uncommon.lua")()
NFS.load(Oscillate.path.."items/Wave 3/rare.lua")()
NFS.load(Oscillate.path.."items/Wave 3/candy.lua")()
NFS.load(Oscillate.path.."items/Wave 3/crit.lua")()
NFS.load(Oscillate.path.."items/Wave 3/p.lua")()
NFS.load(Oscillate.path.."items/Wave 3/plushie.lua")()
NFS.load(Oscillate.path.."items/Wave 3/blursed.lua")()
NFS.load(Oscillate.path.."items/Wave 3/gamering.lua")()
NFS.load(Oscillate.path.."items/Wave 3/legendary.lua")()

SMODS.current_mod.optional_features = {
    retrigger_joker = true,
}

Osc_config = SMODS.current_mod.config 
SMODS.current_mod.config_tab = function()
    return {
        n = G.UIT.ROOT,
        config = { r = 0.1, minw = 8, align = "tm", padding = 0.2, colour = G.C.BLACK },
        nodes = {
            {
                n = G.UIT.R,
                config = { padding = 0.2 },
                nodes = {
                    {
                        n = G.UIT.C,
                        config = { align = "cm" },
                        nodes = {
                            {
                                n = G.UIT.R,
                                config = { align = "cm", padding = 0.01 },
                                nodes = {
                                    create_toggle({
                                        label = "Swears",
                                        ref_table = Osc_config,
                                        ref_value = 'swears'
                                    })
                                }
                            }
                        }
                    }
                }
            }
        }
    }
end

SMODS.Joker:take_ownership('brainstorm',{
    loc_txt = {
        name = "#1#",
        text={
            "Copies the ability",
        "of leftmost {C:attention}Joker",
        },
    },

    loc_vars = function(self,info_queue,card)
        return {
            vars = {
                pseudorandom("brainstorm") <= 0.5 and "Green Needle" or "Brainstorm"
            }
        }
    end
})

SMODS.ScreenShader {
    key = "mexico",
    path = "mexico.fs",
    should_apply = function()
        return G.GAME.osc_mexico
    end
}

SMODS.ScreenShader {
    key = "neon",
    path = "neon.fs",
    should_apply = function()
        return G.GAME.osc_neon
    end
}