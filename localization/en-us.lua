-- How old are you? I'm 4 years old!
return {
    descriptions = {
        Joker = {
            osc_traffic0 = {
                name = "Trafficlight",
                text = {
                "nothing",
                "{C:inactive}oscillates every second"
                }
            },

            osc_traffic1 = {
                name = "Trafficlight",
                text = {
                "{C:mult}+4{} mult",
                "{C:inactive}oscillates every second"
                }
            },

            osc_traffic2 = {
                name = "Trafficlight",
                text = {
                "{X:mult,C:white}X4{} mult",
                "{C:inactive}oscillates every second"
                }
            },

            osc_rps0 = {
                name = "Rock paper scissors",
                text = {
                "{C:money}+$#1#{}",
                "{C:green,E:1}#2# in 3{C:inactive} chance to oscillate",
                "{C:inactive}when card is scored"
                }
            },

            osc_rps1 = {
                name = "Rock paper scissors",
                text = {
                "{C:chips}+#1#{} chips",
                "{C:green,E:1}#2# in 3{C:inactive} chance to oscillate",
                "{C:inactive}when card is scored"
                }
            },

            osc_rps2 = {
                name = "Rock paper scissors",
                text = {
                "{C:mult}+#1#{} mult",
                "{C:green,E:1}#2# in 3{C:inactive} chance to oscillate",
                "{C:inactive}when card is scored"
                }
            },

            j_osc_testest = {
                name = "Logic System",
                text = {
                "takes 2 random {C:attention}bits{} and puts them",
                "through a random {C:attention}logic gate{}",
                "gain {C:mult}+#2#{} mult based of result",
                "{C:inactive}currently {C:mult}+#1#{C:inactive} mult"
                }
            },

            j_osc_quantum = {
                name = "Quantum System",
                text = {
                "{X:mult,C:white}X#1#{} mult",
                "gain {X:mult,C:white}+X#2#{} mult when",
                "{C:attention}buying or selling{} a card"
                }
            },

            j_osc_workdays = {
                name = "Workdays",
                text = {
                "{C:chips}+#1#{} chips",
                "change chips depending on",
                "which {C:attention}workday{} it is.", 
                "{C:inactive}(currently #2#)"
                }
            },

            j_osc_weakness = {
                name = "Jag har hittat hans weakness",
                text = {
                "{C:attention}Disables{} boss blind for ",
                "the {C:attention}first{} played {C:blue}hand",
                }
            },

            j_osc_turkiet = {
                name = "Turkiet Pengar",
                text = {
                "{X:chips,C:white}X#1#{} chips",
                "gains {X:chips,C:white}+X#2#{} chips",
                "for every {C:attention}dollar{}",
                "at the {C:attention}end of round"
                }
            },

            j_osc_moneycorp = {
                name = "Money Corp",
                text = {
                "Every scored card gives {C:money}#1#${}"
                }
            },
            
            j_osc_pigeon = {
                name = "Pigeon",
                text = {
                "add a {C:attention}stone card{} if played hand",
                "exceeds {X:attention,C:white}X#1#{} {C:attention}required score",
                "gains {C:mult}+#2#{} mult for every", 
                "{C:attention}stone card{} in deck"
                }
            },

            j_osc_lilith = {
                name = "Low Quality Lilith Plush",
                text = {
                    "Every {C:attention}played{} and {C:attention}scored{} card gains",
                    "the {C:red,T:osc_incubus}Incubus seal{} before scoring",
                }
            },

            j_osc_new_world = {
                name = "I <3 my new world",
                text = {
                    "{C:chips}+#1#{} chips for",
                    "every {C:spades}spades{} in", 
                    "{C:attention}hand{} and {C:attention}played hand"
                }
            },

            j_osc_bees = {
                name = "{s:3}BEES",
                text = {
                    "{C:money}+#1#${} every {C:red}discard"
                }
            },

            j_osc_more_bees = {
                name = "{s:3}MORE BEES",
                text = {
                    "{C:money}+#1#${} every {C:red}discard{} and {C:blue}hand"
                }
            },

            j_osc_even_more_bees = {
                name = "{s:3}EVEN MORE BEES",
                text = {
                    "{C:money}+#1#${} every {C:red}discard{}, {C:blue}hand{} and {C:attention}blind"
                }
            },

            j_osc_8_bees = {
                name = "{s:3}EIGHT " .. (Osc_config.swears and "FUCKING" or "GOSH DARN") .. " BEES",
                text = {
                    "{C:money}+#1#${} every {C:red}discard{}, {C:blue}hand{}, {C:attention}blind",
                    "and when {C:attention}buying"
                }
            },

            j_osc_omg_so_many_bees = {
                name = {"{s:3}OH MY GOD","{s:3}SO MANY BEES"},
                text = {
                    "{C:money}+#1#${} every {C:red}discard{}, {C:blue}hand{}, {C:attention}blind",
                    "and when {C:attention}buying{} or {C:green}rerolling"
                }
            },

            j_osc_more_bee_us = {
                name = "{s:3}MORE BEE-US",
                text = {
                    "{C:inactive}It's morbin time",
                    "{C:money}+#1#${} every {C:red}discard{}, {C:blue}hand{}, {C:attention}blind{},",
                    "when {C:attention}buying{}, {C:green}rerolling{}, {C:attention}selling,",
                    "at the {C:attention}end of round{}, skipping a {C:attention}blind{},", 
                    "and lastly, using a {C:attention}consumable"
                }
            },

            j_osc_plague = {
                name = "Bubonic Plague",
                text = {
                    "debuff all {C:attention}face{} cards",
                    "{X:mult,C:white}X#1#{} mult"
                }
            },

            j_osc_damocles = {
                name = "Damocles",
                text = {
                    "{C:attention}Doubles{} the amount of",
                    "{C:attention}Joker{} slots in the {C:attention}Shop",
                    "{C:green,E:1}#4# in #1#{} chance to lose",
                    "every frame"
                }
            },

            j_osc_heat_death = {
                name = "HEAT DEATH OF THE UNIVERSE",
                text = {
                    "{X:mult,C:white}X3{} mult",
                    "sets {C:blue}hands{} to {C:attention}1{} and gives",
                    "{C:red}+3 discards{} when {C:attention}obtained",
                    "resets back when {C:attention}sold"
                }
            },

            j_osc_epicenter = {
                name = "Epicenter of a montage",
                text = {
                    "retriggers the {C:attention}middlemost{} played card",
                    "equal to the {C:attention}amount{} of played cards",
                    "only works if this joker is in the {C:attention}middle",
                    "{C:inactive}(#1#)"
                }
            },

            j_osc_silksong = {
                name = "Silksong when?",
                text = {
                    "{C:chips}+#1#{} chips and {C:mult}+#2#{} mult",
                }
            },

            j_osc_oblobbles = {
                name = "Oblobbles",
                text = {
                    "{X:chips,C:white}X#1#{} chips every 3 {C:blue}hands",
                    "{C:inactive}(#2#/3)"
                }
            },

            j_osc_prime = {
                name = "Prime Time",
                text = {
                    "Each played {C:attention}Ace{},",
                    "{C:attention}2{}, {C:attention}3{}, {C:attention}5{} or {C:attention}7{} gives",
                    "{C:chips}+#1#{} chips when scored"
                }
            },

            j_osc_tribonacci = {
                name = "Tribonacci",
                text = {
                    "Each played {C:attention}Ace{},",
                    "{C:attention}2{}, {C:attention}4{} or {C:attention}7{} gives",
                    "{C:mult}+#1#{} mult when scored"
                }
            },

            j_osc_rekoj = {
                name = "rekoJ",
                text = {
                    "{C:mult}-#1#{} mult",
                    "{X:mult,C:white}X#2#{} mult instead ",
                    "if you have a {C:attention}Joker"
                }
            },

            j_osc_azazel_plush = {
                name = "Azazel Plush",
                text = {
                    "Every card with",
                    "an {C:red}incubus seal{}",
                    "gives {C:mult}+#1#{} mult"
                }
            },

            j_osc_aussie_lamb = {
                name = "Aussie Lamb",
                text = {
                    "{X:mult,C:white}X#1#{} mult, gain {X:mult,C:white}+X#2#{}", 
                    "every scored {C:attention}hearts"
                }
            },

            j_osc_canadian_rhino = {
                name = "Canadian Rhino",
                text = {
                    "{X:mult,C:white}X#1#{} mult, gain {X:mult,C:white}+X#2#{}", 
                    "every scored {C:attention}clubs"
                }
            },

            j_osc_korean_salmon = {
                name = "Korean Salmon",
                text = {
                    "{X:mult,C:white}X#1#{} mult, gain {X:mult,C:white}+X#2#{}", 
                    "every scored {C:attention}diamonds"
                }
            },

            j_osc_british_cow = {
                name = "British Cow",
                text = {
                    "{X:mult,C:white}X#1#{} mult, gain {X:mult,C:white}+X#2#{}", 
                    "every scored {C:attention}spades"
                }
            },

            j_osc_longname = {
                name = {
                    "{S:2}Joker with a long ass name like who even decided",
                    "{S:2}that this joker was gonna have a name this long",
                    "{S:2}like " .. (Osc_config.swears and "holy fuck" or "damn") .. " does this name ever stop hello",
                    "{S:2}it barely even does anything it's literally",
                    "{S:2}just +1 chips like why would you ever buy",
                    "{S:2}something like this like are you stupid like come",
                    "{S:2}on just buy the one to the right its miles better",
                    "{S:2}than this joker just please buy the other one this",
                    "{S:2}joker name is still not even done like bro when does",
                    "{S:2}it end hello Breuhh also known as the creator of this",
                    "{S:2}mod does this description ever stop like oh wait its",
                    "{S:2}soon finished just one more line well then buh bye"
                },
                text = {
                    "{C:chips}+1{} chips",
                }
            },

            j_osc_cool_joker = {
                name = "Cool Joker",
                text = {
                    "if scored card is a",
                    "{C:attention}#2#{} or {C:attention}#3#",
                    "give {C:chips}+#1#{} chips",
                    "{C:inactive}(rerolls at the end of round)"
                }
            },

            j_osc_jokahh = {
                name = "JokaAAAAAAAAAHHHHHHHHHH",
                text = {
                    "{C:attention}screams{} upon {C:red}discard",
                    "{C:inactive}(likes being italian)"
                }
            },

            j_osc_french = {
                name = "French Joker",
                text = {
                    "{C:mult}#1##3#{} mult and {C:chips}#1##2#{} chips",
                    "{C:inactive}(likes being french)"
                }
            },

            j_osc_congregation = {
                name = "Congregation",
                text = {
                    "every {C:attention}joker{} gives {C:mult}+#1#{} mult"
                }
            },

            j_osc_trimmed = {
                name = "Trimmed Joker",
                text = {
                    "{C:red}Destroys{} every {C:attention}2{},",
                    "{C:attention}3{} and {C:attention}4{} in {C:blue}hand"
                }
            },

            j_osc_amazon_package = {
                name = "Amazon Package",
                text = {
                    "creates {C:attention}1{} {C:legendary}legendary{} joker after 2 {C:attention}antes{},", 
                    "{C:red}destroys{} itself afterwards",
                    "{C:red}destroys{} itself if played",
                    "{C:blue}hand{} {C:attention}exceeds{} required score",
                    "{C:inactive}(#1#/2 antes)"
                }
            },

            j_osc_git_gud = {
                name = "Git Gud",
                text = {
                    "gives {C:chips}+#1#{} chips",
                    "for every {C:attention}ante",
                    "{C:inactive}(Currently {C:chips}+#2#{C:inactive} chips)"
                }
            },

            j_osc_jellybean = {
                name = "Jelly Bean",
                text = {
                    "{C:money}+#1#${} for every", 
                    "{C:attention}empty{} joker slot",
                    "{C:inactive}(currently {C:money}+#2#${C:inactive})"
                }
            },

            j_osc_lozenge = {
                name = "Lozenge",
                text = {
                    "Create #1# {V:1}candy crush{}", 
                    "{C:attention}joker#2#{} when sold",
                    "{C:inactive}(Must have room)"
                }
            },

            j_osc_lemondrop = {
                name = "Lemon Drop",
                text = {
                    "if scored card has an {C:attention}edition{}, {C:attention}seal{} or",
                    "{C:attention}enhancement{}. Then give {C:chips}+10{} chips"
                }
            },

            j_osc_gumsquare = {
                name = "Gum Square",
                text = {
                    "{C:mult}+#1#{} mult for every {C:attention}joker",
                    "{C:inactive}(currently {C:mult}+#2#{C:inactive} mult)"
                }
            },

            j_osc_lollipophead = {
                name = "Lollipop Head",
                text = {
                    "{C:chips}+#1#{} chips"
                }
            },

            j_osc_jujubecluster = {
                name = "Jujube cluster",
                text = {
                    "{C:attention}retrigger{} a random",
                    "joker {C:attention}#1#{} time#2#"
                }
            },

            j_osc_striped = {
                name = "Striped Candy",
                text = {
                    "{C:attention}retrigger{} all", 
                    "scored cards",
                    "{C:attention}#1#{} time#2#"
                }
            },

            j_osc_wrapped = {
                name = "Wrapped Candy",
                text = {
                    "{C:attention}jokers{} have a",
                    "{C:green,E:1}#3# in #2#{} chance",
                    "into giving {C:money}+#1#$"
                }
            },

            j_osc_colorbomb = {
                name = "Color Bomb",
                text = {
                    "{C:attention}Randomize{} suits of all",
                    "{C:attention}played{} cards after {C:attention}scoring"
                }
            },

            j_osc_jellyfish = {
                name = "Jelly Fish",
                text = {
                    "A {C:attention}random played card{} gains",
                    "the {C:attention}Jelly Fish enhancement"
                }
            },

            j_osc_candycrush = {
                name = "Candy Crush",
                text = {
                    "Create #1# {V:1}candy crush{} {C:attention}Joker#2#{}",
                    "at the end of {C:attention}round",
                    "{C:inactive}(must have room)"
                }
            },

            j_osc_pristineblade = {
                name = "Pristine Blade",
                text = {
                    "{C:attention}Divine{} cards doesn't",
                    "{C:attention}lose{} {X:chips,C:white}Xchips",
                }
            },

            j_osc_child = {
                name = "Child Labour",
                text = {
                    "{C:green,E:1} #2# in #1#{} chance", 
                    "for {C:attention}played{} and {C:attention}scoring{} cards",
                    "to become {C:attention}steel{} cards",
                    "{C:attention}increases{} numerator by 1 if it {C:attention}fails",
                    "{C:attention}resets{} numerator to 1 when is {C:attention}succeeds"
                },
            },

            j_osc_blursed_eye = {
                name = "Blursed Eye",
                text = {
                    "Create {C:attention}#1#{} {V:1}Blursed{} {C:attention}Joker#2#{}",
                    "upon entering a {C:attention}Blind",
                    "{C:inactive}(must have room)"
                }
            },

            j_osc_dadproud = {
                name = "I'm Proud Of You Son",
                text = {
                    "{C:attention}increases{} values of the",
                    "{C:attention}leftmost{} joker by {C:attention}1",
                    "at the end of {C:attention}round",
                    "{C:inactive}(excluding I'm proud of you son)"
                }
            },

            j_osc_chaos = {
                name = "CHAOS CHAOS!",
                text = {
                    "gives {C:chips}chips{}, {C:mult}mult{},",
                    "and {C:money}${} each between",
                    "{C:attention}-#1#{} and {C:attention}#1#"
                }
            },

            j_osc_he = {
                name = "{s:5}HE",
                text = {
                    "{C:dark_edition,E:1}He knows what you did back in '84",
                    "{C:inactive}({X:mult,C:white}X0.1{C:inactive} Mult)"
                }
            },

            j_osc_expired_milk = {
                name = "Expired Milk",
                text = {
                    "{C:chips}+#1#{} Chips",
                    "Loses {C:chips}#2#{} Chip",
                    "every {C:attention}round"
                }
            },

            j_osc_kakorrhapiaphobia = {
                name = "Kakorrhapiaphobia",
                text = {
                    "Prevents Death",
                    "if the current",
                    "{C:attention}Blind{} is a",
                    "{C:attention}Big Blind",
                    "{C:red,E:2}self destructs"
                }
            },

            j_osc_claustrophobia = {
                name = "Claustrophobia",
                text = {
                    "{C:attention}+2{C:green} Selection limit",
                    "{C:attention}-2{C:green} Hand size"
                }
            },

            j_osc_scumming = {
                name = "Save Scumming",
                text = {
                    "{C:green,E:1}Probabilities {C:attention}becomes",
                    "actually {C:green,E:1}random"
                }
            },

            j_osc_freaky = {
                name = "Freaky Joker",
                text = {
                    "{C:mult}+#1#{} Mult if played hand",
                    "is a {C:attention}Pair{} or {C:attention}Two Pair"
                }
            },

            j_osc_p = {
                name = "{s:0.5}p",
                text = {
                    "{s:0.5,C:mult}+1 {s:0.5}Mult"
                }
            },
         
            j_osc_pp = {
                name = "{s:0.5}pp",
                text = {
                    "{X:mult,C:white}+X#1#{} Mult for",
                    "every p {C:attention}Joker",
                    "{C:inactive}(currently {X:mult,C:white}X#2# {C:inactive} Mult)"
                }
            },

            j_osc_ppp = {
                name = "{s:0.5}ppp",
                text = {
                    "{C:attention}Retrigger{} every",
                    "p {C:attention}Joker #1#{} time#2#"
                }
            },

            j_osc_pppp = {
                name = "{s:0.5}pppp",
                text = {
                    {"{X:mult,C:white}XX#1#{} Mult for",
                    "every p {C:attention}Joker",
                    "{C:inactive}(currently {X:mult,C:white}X#2# {C:inactive} Mult)"},
                    {"When a p {C:attention}Joker{} is {C:attention}obtained{}:",
                    "fixed {C:green,E:1}1 in 2{} chance to",
                    "Make it {C:dark_edition}Negative"}
                }
            },

            j_osc_pea = {
                name = "{s:0.5}pea",
                text = {
                    "Every {C:attention}Joker{} is",
                    "considered a",
                    "p {C:attention}Joker"
                }
            },

            j_osc_pee = {
                name = "{s:0.5}pee",
                text = {
                    "Creates {C:attention}#1# {C:dark_edition}Negative {C:attention}p#2#{} at",
                    "the {C:attention}end of round",
                }
            },

            j_osc_tetranacci = {
                name = "Tetranacci",
                text = {
                    "Each played {C:attention}Ace{},",
                    "{C:attention}2{}, {C:attention}4{} or {C:attention}8{} gives",
                    "{X:chips,C:white}X#1#{} Chips when scored"
                }
            },

            j_osc_metal_sonic = {
                name = "Metal Sonic Plushie",
                text = {
                    "{X:chips,C:white}+X#2#{} Chips for every",
                    "{C:attention}playing{} card with a {C:attention}seal",
                    "in the {C:attention}deck",
                    "{C:inactive}(currently {X:chips,C:white}X#1#{C:inactive})"
                }
            },

            j_osc_kurzgesagt_duck = {
                name = "Kurzgesagt Duck Plushie",
                text = {
                    "Scored {C:attention}cards{} with",
                    "{C:attention}seals{} gives an extra",
                    "{X:attention,C:white}#1#x{} of its {C:chips}+Chips"
                }
            },

            j_osc_long_kurzgesagt_duck = {
                name = {
                    "Kurzgesagt Long Neck",
                    "Duck Plushie"
                },
                text = {
                    "Scored {C:attention}cards{} with",
                    "{C:attention}seals{} gives an extra",
                    "{X:attention,C:white}#1#x{} of its {C:chips}+Chips"
                }
            },

            j_osc_20_hornet = {
                name = "#2# Hornet Plushies",
                text = {
                    "Gains {C:chips}+#2#{} Chips every",
                    "time a {C:attention}card{} with a {C:attention}seal",
                    "is {C:attention}scored",
                    "{C:inactive}(Currently {C:chips}+#1# {C:inactive}Chips)"
                }
            },

            j_osc_dementia = {
                name = "Dementia",
                text = { 
                    {
                        "Forgets {C:attention}one{} effect",
                        "at the {C:attention}end of round"
                    },
                    {
                        "{C:chips}#1#{} Chips",
                        "{C:mult}#2#{} Mult",
                        "{C:money}#3#",
                        "{X:chips,C:white}#4#{} Chips",
                        "{X:mult,C:white}#5#{} Mult"
                    },
                }
            },

            j_osc_antons_guide = {
                name = {"Anton's Guide To", "Not Get " .. (Osc_config.swears and "molested" or "touched")},
                text = {
                    "{E:1,C:inactive}(#3#)",
                    "Prevents Death",
                    "if current {C:attention}Blind",
                    "is a {C:attention}Boss Blind",
                    "{C:attention}loses{} ability to",
                    "prevent afterwards",
                    " ",
                    "To {C:attention}replenish{} the ability",
                    "buy {C:money}$#2#{} worth of items",
                    "in the {C:attention}Shop",
                    "{C:inactive}({C:money}#1#/#2#{C:inactive})"
                }
            },

            j_osc_a_timer = {
                name = "A Timer",
                text = {
                    "{C:attention}Loses {X:mult,C:white}+X#2#{} Mult every",
                    "{C:attention}Second{} when in a {C:attention}Blind",
                    "Resets at the {C:attention}end of round"
                }
            },

            j_osc_ghost_hunter = {
                name = "Ghost Hunter",
                text = {
                    "{C:chips}+#1#{} chips for",
                    "every {E:2}Ghost Card{} in", 
                    "the {C:attention}Deck"
                }
            },

            j_osc_wet_joker = {
                name = "Wet Joker",
                text = {
                    "{C:chips}+#1#{} Chips",
                    "When a {C:attention}Soggy Card{} is scored:",
                    "{C:attention}Add{} its {C:chips}+Chips{} to", 
                    "this {C:attention}Card's{} {C:chips}+Chips"
                }
            },

            j_osc_schizophrenia = {
                name = "Schizophrenia",
                text = {
                    "{C:attention}Copies{} unscoring {C:attention}cards",
                    "and applies {E:2}Ghost{} onto",
                    "them before putting",
                    "them in the {C:attention}Deck"
                }
            },

            j_osc_deep_fry = {
                name = "Deep Fried Joker",
                text = {
                    "{E:1}Deep Fries{} scoring {C:attention}Cards",
                }
            },

            j_osc_orb_great = {
                name = "Orb of The Great",
                text = {
                    "Beat {C:attention}#2# Blinds",
                    "{s:2,E:1,X:attention,C:white}#1#/#2#"
                }
            },

            j_osc_orb_great_ready = {
                name = "Orb of The Great",
                text = {
                    "{s:2,E:1,X:attention,C:white}Sell"
                }
            },

            j_osc_great_wizard = {
                name = "{s:1.6}GREAT WIZARD",
                text = {
                    "Reduces {C:attention}Blind{} size",
                    "by {X:attention,C:white}#1#%"
                }
            },

            j_osc_orb_nunchucks = {
                name = "Orb of The Ninja",
                text = {
                    "Earn {C:attention}#2#$",
                    "{s:2,E:1,X:attention,C:white}#1#/#2#"
                }
            },

            j_osc_orb_nunchucks_ready = {
                name = "Orb of The Ninja",
                text = {
                    "{s:2,E:1,X:attention,C:white}Sell"
                }
            },

            j_osc_nunchucks_wizard = {
                name = "{s:1.6}NUNCHUCKS WIZARD",
                text = {
                    "{C:attention}Doubles money{} at",
                    "the {C:attention}end of round"
                }
            },

            j_osc_orb_gun = {
                name = "Orb of The American",
                text = {
                    "Score {C:attention}#2#",
                    "{s:2,E:1,X:attention,C:white}#1#/#2#"
                }
            },

            j_osc_orb_gun_ready = {
                name = "Orb of The American",
                text = {
                    "{s:2,E:1,X:attention,C:white}Sell"
                }
            },

            j_osc_gun_wizard = {
                name = "{s:1.6}GUN WIZARD",
                text = {
                    "Adds {C:chips}+Chips{} of scored {C:attention}Cards",
                    "to {X:mult,C:white}Xmult{}, {C:attention}reset{} after the {C:blue}hand{} is {C:attention}played"
                }
            },

            j_osc_orb_p = {
                name = "Orb of The p",
                text = {
                    "Have {C:attention}#2#{} p {C:attention}Jokers",
                    "{s:2,E:1,X:attention,C:white}#1#/#2#"
                }
            },

            j_osc_orb_p_ready = {
                name = "Orb of The p",
                text = {
                    "{s:2,E:1,X:attention,C:white}Sell"
                }
            },

            j_osc_p_wizard = {
                name = "{s:1.6}P WIZARD",
                text = {
                    "p {C:attention}Jokers{} gives {X:mult,C:white}X#1#{} Mult",
                    "{s:0.5}p{} gives {X:mult,C:white,E:1}^#2#{} Mult instead"
                }
            },

        },
        Edition = {
            e_osc_deep_fry = {
                name = "Deep Fry",
                text =  {
                    "{X:chips,C:white}X#1#{} Chips",
                }
            }
        },

        Enhanced = {
            m_osc_jellyfish = {
                name = "Jelly Fish card",
                text = {
                    "{C:mult}+#1#{} mult if on",
                    "{C:attention}boss{} blind",
                    "{C:attention}regardless{} of",
                    "{C:attention}where{} it is"
                }
            },

            m_osc_divine = {
                name = "Divine card",
                text = {
                    "{X:chips,C:white}X#1#{} chips",
                    "{C:attention}spreads{} to nearby {C:attention}cards{}",
                    " when in {C:blue}hand{} but with",
                    "{X:chips,C:white}-X#2#{} less chips",
                    "{C:inactive}(if other card doesnt",
                    "{C:inactive}have an enhancement)"
                }
            },

            m_osc_ghost = {
                name = "Ghost card",
                text = {
                    "{C:red}Self destructs",
                }
            },

            m_osc_soggy = {
                name = "Soggy card",
                text = {
                    "Gives an extra {C:attention}fifth",
                    "of the sum of {C:attention}adjacent",
                    "played cards' {C:chips}+Chips"
                }
            }
        },

        Other = {
            osc_true_p = {
                name = "True p Jokers",
                text = {
                    "{C:attention}Jokers{} that are {C:attention}always",
                    "considered p {C:attention}Jokers.",
                    "{C:attention}Identified{} by the orange",
                    'badge "p Joker"'                
                }
            },

            osc_incubus_seal = {
                name = "Incubus Seal",
                text = {
                    "{C:green,E:1}#1# in #2#{} chance to",
                    "create a {C:attention}copy",
                    "of {C:attention}itself{} with",
                    "{E:2}Ghost{} applied"
                }
            }
        },

        Spectral = {
            c_osc_blursed = {
                name = "Blessed Curse",
                text = {
                    "{C:attention}Create{} a random",
                    "{V:1,E:1}Blursed {C:attention}joker"
                }
            },

            c_osc_candy = {
                name = "Yummy Candy",
                text = {
                    "{C:attention}Create{} a random",
                    "{V:1,E:1}Candy {C:attention}joker"
                }
            }
        },

        Gamering = {
            c_osc_mama_mega = {
                name = "Mama Mega",
                text = {
                    "{C:attention}Instantly{} beat",
                    "the current {C:attention}Blind"
                }
            },

            c_osc_papa_pega = {
                name = "Papa Pega",
                text = {
                    "{C:attention}Pinstantly{} peat",
                    "phe purrent {C:attention}Plind"
                }
            },

            c_osc_cube_shape = {
                name = {"Suspiciously cube",
                        "shaped card"},
                text = {
                    "Creates {C:attention}#1# {C:gamering}Gamering",
                    "{C:attention}Cards",
                    "{C:inactive}(must have room)"
                }
            },

            c_osc_so_peak = {
                name = "So Peak...",
                text = {
                    "Creates a {C:attention}random",
                    "{E:1,C:inactive}(True){} p {C:attention}Joker"
                }
            },

            c_osc_student_loans = {
                name = "Student Loans",
                text = {
                    "Earn {C:money}$#1#{} {C:attention}immediately",
                    "{C:red}Don't{} earn the next {C:money}$#2#"
                }
            },

            c_osc_life_or_bath = {
                name = {"Life or Bath", "for Dry Cat?"},
                text = {
                    "Select up to {C:attention}#1#",
                    "{C:attention}Cards{} to become {C:attention}Soggy"
                }
            },

            c_osc_orb = {
                name = {"Orb of knowledge"},
                text = {
                    "{C:attention}Create{} a random",
                    "{C:attention}Orb"
                }
            },
        }
    },

    misc = {
        dictionary = {
            saved_kakorrhapiaphobia = "Saved by Kakorrhapiaphobia",
            saved_anton = (Osc_config.swears and "Fuck" or "Screw") .." you (Saved by Anton's guide to not get " .. (Osc_config.swears and "molested" or "touched") .. ")",

            k_gamering = "Gamering",
            b_gamering_cards = "Gamering Cards",

            k_osc_p = "p Joker"
        },
        labels = {
            osc_incubus_seal = "Incubus Seal",
            osc_deep_fry = "Deep Fry"
        }
    }
}