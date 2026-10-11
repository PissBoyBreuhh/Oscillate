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
                "{C:mult}+4{} Mult",
                "{C:inactive}oscillates every second"
                }
            },

            osc_traffic2 = {
                name = "Trafficlight",
                text = {
                "{X:mult,C:white}X4{} Mult",
                "{C:inactive}oscillates every second"
                }
            },

            osc_rps0 = {
                name = "Rock paper scissors",
                text = {
                "{C:money}+$#1#{}",
                "{C:green,E:1}#2# in 3{C:inactive} chance to oscillate",
                "{C:inactive}when card is played and scored"
                }
            },

            osc_rps1 = {
                name = "Rock paper scissors",
                text = {
                "{C:chips}+#1#{} Chips",
                "{C:green,E:1}#2# in 3{C:inactive} chance to oscillate",
                "{C:inactive}when card is played and scored"
                }
            },

            osc_rps2 = {
                name = "Rock paper scissors",
                text = {
                "{C:mult}+#1#{} Mult",
                "{C:green,E:1}#2# in 3{C:inactive} chance to oscillate",
                "{C:inactive}when card is played and scored"
                }
            },

            j_osc_testest = {
                name = "Logic System",
                text = {
                "takes 2 random {C:attention}bits{} and puts them",
                "through a random {C:attention}logic gate{}",
                "gain {C:mult}+#2#{} Mult based if the result is 1",
                "{C:inactive}currently {C:mult}+#1#{C:inactive} Mult"
                }
            },

            j_osc_quantum = {
                name = "Quantum System",
                text = {
                "{X:mult,C:white}X#1#{} Mult",
                "gain {X:mult,C:white}+X#2#{} Mult when",
                "{C:attention}buying or selling{} a card"
                }
            },

            j_osc_workdays = {
                name = "Workdays",
                text = {
                "{C:chips}+#1#{} Chips",
                "change Chips depending on",
                "which {C:attention}Workday{} it is.", 
                "{C:inactive}(currently #2#)"
                }
            },

            j_osc_weekends = {
                name = "Weekends",
                text = {
                "{C:mult}+#1#{} Mult",
                "change {C:mult}Mult{} depending on",
                "which {C:attention}Weekend{} it is.", 
                "{C:inactive}(currently #2#)"
                }
            },

            j_osc_weakness = {
                name = "Jag Har Hittat Hans Weakness",
                text = {
                "{C:red}Disables {C:attention}Boss Blind{} for ",
                "the {C:attention}first{} played {C:blue}hand",
                }
            },

            j_osc_turkiet = {
                name = "Turkiet Pengar",
                text = {
                "{X:chips,C:white}X#1#{} Chips",
                "gains {X:chips,C:white}+X#2#{} Chips",
                "for every {C:attention}dollar{}",
                "at the {C:attention}end of round"
                }
            },

            j_osc_moneycorp = {
                name = "Money Corp",
                text = {
                "Every played and scored",
                "card gives {C:money}#1#${}"
                }
            },
            
            j_osc_pigeon = {
                name = "Pigeon",
                text = {
                "Add a {C:attention}stone card{} if played hand",
                "exceeds {X:attention,C:white}X#1#{} {C:attention}required score",
                "{C:mult}+#2#{} Mult for every", 
                "{C:attention}stone card{} in deck"
                }
            },

            j_osc_lilith = {
                name = "Low Quality Lilith Plush",
                text = {
                    "Before {C:attention}Scoring{}, applies {C:red,E:1}Incubus Seal",
                    "to every {C:attention}played card "
                }
            },

            j_osc_new_world = {
                name = "I <3 my new world",
                text = {
                    "{C:chips}+#1#{} Chips for",
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
                    "{C:red}Debuff{} all {C:attention}face{} cards",
                    "{X:mult,C:white}X#1#{} Mult"
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
                    "{X:mult,C:white}X3{} Mult",
                    "sets {C:blue}hands{} to {C:attention}1{} and gives",
                    "{C:red}+3 discards{} when {C:attention}obtained",
                    "resets when {C:attention}sold"
                }
            },

            j_osc_epicenter = {
                name = "Epicenter Of A Montage",
                text = {
                    "retriggers the {C:attention}middlemost{} played card",
                    "equal to the {C:attention}amount{} of played cards",
                    "only works if this joker is in the {C:attention}middle",
                    "{C:inactive}(#1#)"
                }
            },

            j_osc_silksong = {
                name = "Silksong When?",
                text = {
                    "{C:chips}+#1#{} Chips and {C:mult}+#2#{} Mult",
                }
            },

            j_osc_oblobbles = {
                name = "Oblobbles",
                text = {
                    "{X:chips,C:white}X#1#{} Chips every 3 {C:blue}hands",
                    "{C:inactive}(#2#/3)"
                }
            },

            j_osc_ascended_oblobbles = {
                name = {"Ascended","Oblobbles"},
                text = {
                    "{X:chips,C:white}X#1#{} Chips"
                }
            },

            j_osc_prime = {
                name = "Prime Time",
                text = {
                    "Each played {C:attention}Ace{},",
                    "{C:attention}2{}, {C:attention}3{}, {C:attention}5{} or {C:attention}7{} gives",
                    "{C:chips}+#1#{} Chips when played and scored"
                }
            },

            j_osc_tribonacci = {
                name = "Tribonacci",
                text = {
                    "Each played {C:attention}Ace{},",
                    "{C:attention}2{}, {C:attention}4{} or {C:attention}7{} gives",
                    "{C:mult}+#1#{} Mult when played and scored"
                }
            },

            j_osc_rekoj = {
                name = "rekoJ",
                text = {
                    "{C:mult}-#1#{} Mult",
                    "{X:mult,C:white}X#2#{} Mult instead ",
                    "if you have a {C:attention}Joker"
                }
            },

            j_osc_azazel_plush = {
                name = "Azazel Plush",
                text = {
                    "Every card with",
                    "an {C:red}incubus seal{}",
                    "gives {C:mult}+#1#{} Mult"
                }
            },

            j_osc_aussie_lamb = {
                name = "Aussie Lamb",
                text = {
                    "{X:mult,C:white}X#1#{} Mult, gain {X:mult,C:white}+X#2#{}", 
                    "every played and scored {C:attention}hearts"
                }
            },

            j_osc_canadian_rhino = {
                name = "Canadian Rhino",
                text = {
                    "{X:mult,C:white}X#1#{} Mult, gain {X:mult,C:white}+X#2#{}", 
                    "every played and scored {C:attention}clubs"
                }
            },

            j_osc_korean_salmon = {
                name = "Korean Salmon",
                text = {
                    "{X:mult,C:white}X#1#{} Mult, gain {X:mult,C:white}+X#2#{}", 
                    "every played and scored {C:attention}diamonds"
                }
            },

            j_osc_british_cow = {
                name = "British Cow",
                text = {
                    "{X:mult,C:white}X#1#{} Mult, gain {X:mult,C:white}+X#2#{}", 
                    "every played and scored {C:attention}spades"
                }
            },

            j_osc_longname = {
                name = {
                    "{S:2}Joker with a long ass name like who even decided",
                    "{S:2}that this joker was gonna have a name this long",
                    "{S:2}like " .. (Osc_config.swears and "holy fuck" or "damn") .. " does this name ever stop hello",
                    "{S:2}it barely even does anything it's literally",
                    "{S:2}just +1 Chips like why would you ever buy",
                    "{S:2}something like this like are you stupid like come",
                    "{S:2}on just buy the one to the right its miles better",
                    "{S:2}than this joker just please buy the other one this",
                    "{S:2}Joker name is still not even done like bro when does",
                    "{S:2}it end hello Breuhh also known as the creator of this",
                    "{S:2}mod does this description ever stop like oh wait its",
                    "{S:2}soon finished just one more line well then buh bye"
                },
                text = {
                    "{C:chips}+1{} Chips",
                }
            },

            j_osc_cool_joker = {
                name = "Cool Joker",
                text = {
                    "If scored card is a",
                    "{C:attention}#2#{} or {C:attention}#3#",
                    "give {C:chips}+#1#{} Chips",
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
                    "{C:mult}#1##3#{} Mult and {C:chips}#1##2#{} Chips",
                    "{C:inactive}(likes being french)"
                }
            },

            j_osc_congregation = {
                name = "Congregation",
                text = {
                    "every {C:attention}Joker{} gives {C:mult}+#1#{} Mult"
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
                    "Gives {C:chips}+#1#{} Chips",
                    "based on current {C:attention}Ante",
                    "{C:inactive}(Currently {C:chips}+#2#{C:inactive} Chips)"
                }
            },

            j_osc_jellybean = {
                name = "Jelly Bean",
                text = {
                    "{C:money}+#1#${} for every", 
                    "{C:attention}empty{} Joker slot",
                    "{C:inactive}(currently {C:money}+#2#${C:inactive})"
                }
            },

            j_osc_lozenge = {
                name = "Lozenge",
                text = {
                    "Create #1# {V:1}Candy Crush{}", 
                    "{C:attention}Joker#2#{} when sold",
                    "{C:inactive}(Must have room)"
                }
            },

            j_osc_lemondrop = {
                name = "Lemon Drop",
                text = {
                    "If scored card has an {C:attention}edition{}, {C:attention}seal{} or",
                    "{C:attention}enhancement{}. Then give {C:chips}+10{} Chips"
                }
            },

            j_osc_gumsquare = {
                name = "Gum Square",
                text = {
                    "{C:mult}+#1#{} Mult for every {C:attention}Joker",
                    "{C:inactive}(currently {C:mult}+#2#{C:inactive} Mult)"
                }
            },

            j_osc_lollipophead = {
                name = "Lollipop Head",
                text = {
                    "{C:chips}+#1#{} Chips"
                }
            },

            j_osc_jujubecluster = {
                name = "Jujube cluster",
                text = {
                    "{C:attention}Retrigger{} a random",
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
                    "{C:attention}Jokers{} have a",
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

            j_osc_coloring = {
                name = "Coloring Candy",
                text = {
                    "Sets the suit of {C:attention}all{} played {C:attention}Cards",
                    "to the same as the {C:attention}leftmost{} played {C:attention}Card"
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
                    "Create #1# {V:1}Candy Crush{} {C:attention}Joker#2#{}",
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
                    "{C:attention}Increases{} values of the",
                    "{C:attention}leftmost{} joker by {C:attention}1",
                    "at the end of {C:attention}round",
                    "{C:inactive}(excluding I'm proud of you son)"
                }
            },

            j_osc_chaos = {
                name = "CHAOS CHAOS!",
                text = {
                    "gives {C:chips}Chips{}, {C:mult}Mult{},",
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

            j_osc_milk = {
                name = "Milk",
                text = {
                    "{C:chips}+#1#{} Chips",
                    "Gains {C:chips}#2#{} Chip",
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
                    "{C:green,E:1}Probabilities{} becomes",
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

            j_osc_q = {
                name = "{s:0.5}q",
                text = {
                    "{C:mult}+#1#{} Mult for every {s:0.5,C:attention}p",
                    "Counts as a {s:0.5,C:attention}p"
                }
            },

            j_osc_d = {
                name = "{s:0.5}d",
                text = {
                    "Every {s:0.5,C:attention}p{} gives {C:chips}+#1#{} Chips",
                    "Counts as a {s:0.5,C:attention}p"
                }
            },

            j_osc_b = {
                name = "{s:0.5}b",
                text = {
                    "Every {s:0.5,C:attention}p{} gives {X:mult,C:white}X#1#{} Mult",
                    "Counts as a {s:0.5,C:attention}p"
                }
            },

            j_osc_pree = {
                name = "{s:0.5}pree",
                text = {
                    "Every p {C:attention}Joker",
                    "counts as a {s:0.5,C:attention}p"
                }
            },

            j_osc_payee = {
                name = "{s:0.5}payee",
                text = {
                    {
                    "{C:attention}Gains{} more effects based",
                    "on the {C:attention}amount{} of {s:0.5,C:attention}p{} present:"
                    },
                    {
                    "{C:attention}1:{} {C:mult}+#1#{} Mult",
                    "{C:attention}2:{} {X:mult,C:white}X#2#{} Mult",
                    "{C:attention}4:{} {C:mult}+#3#{} Mult per {s:0.5,C:attention}p",
                    "{C:attention}5:{} {X:mult,C:white}+X#4#{} Mult per {s:0.5,C:attention}p",
                    }
                }
            },

            j_osc_prix = {
                name = "{s:0.5}prix",
                text = {
                    "When a p {C:attention}Joker{} is triggered",
                    "Give {C:osc_crit}+#1#%{} Crit Chance {C:attention}permanently"
                }
            },

            j_osc_plea = {
                name = "{s:0.5}plea",
                text = {
                    "If at least {C:attention}5 Jokers",
                    "are a p {C:attention}Joker",
                    "{C:attention}Create #1# {C:edition}Negative",
                    "true p {C:attention}Jokers{} and",
                    "{E:2,C:red}self destruct"
                }
            },

            j_osc_p_bee = {
                name = "{s:0.5}bee",
                text = {
                    "{C:chips}+#1#{} Chips for every",
                    "{s:3}BEE{} and p {C:attention}Joker"
                }
            },

            j_osc_balloon_boy = {
                name = "{s:0.5}BB",
                text = {
                    "{C:mult}+#1#{} Mult when a {s:0.5,C:attention}p{} triggers and",
                    "gains {C:mult}+#2#{} Mult",
                    "reset {C:mult}Mult{} if it {C:attention}exceeds",
                    "{C:mult}+#3#{} Mult"
                }
            },

            j_osc_dd = {
                name = "{s:0.5}dee dee",
                text = {
                    "Every p {C:attention}Joker{} gives",
                    "either {C:mult}#2#{} or {C:mult}+#1#{} Mult"
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
                    "in the deck",
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
                    "{C:chips}+#1#{} Chips for",
                    "every {E:2}Ghost Card{} in", 
                    "the deck"
                }
            },

            j_osc_wet_joker = {
                name = "Wet Joker",
                text = {
                    "{C:chips}+#1#{} Chips",
                    "When a {C:attention}Soggy Card{} is scored:",
                    "{C:attention}Add{} its {C:chips}+Chips{} to", 
                    "this card's {C:chips}+Chips"
                }
            },

            j_osc_schizophrenia = {
                name = "Schizophrenia",
                text = {
                    "{C:attention}Copies{} unscoring {C:attention}cards",
                    "and applies {E:2}Ghost{} onto",
                    "them before putting",
                    "them in the deck"
                }
            },

            j_osc_deep_fry = {
                name = "Deep Fried Joker",
                text = {
                    "{E:1}Deep Fries{} scoring cards",
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

            j_osc_123 = {
                name = "One Two Three!",
                text = {
                    "{C:osc_crit}+#1#%{} Crit Chance when {C:attention}Triggered",
                    "{C:attention}resets{} at the {C:attention}end of round"
                }
            },

            j_osc_gambling_god = {
                name = "Gambling God",
                text = {
                    "{C:osc_power}+#1#{} Crit Power"
                }
            },

            j_osc_crit_joker = {
                name = "Crit Joker",
                text = {
                    "{C:osc_crit}+#1#%{} Crit Chance",
                }
            },

            j_osc_IShowGambling = {
                name = "IShowGambling",
                text = {
                    "{C:osc_crit}+#1#%{} Crit Chance every scored card",
                    "{C:attention}resets{} at the end of the {C:attention}ante"
                }
            },

            j_osc_FourClover = {
                name = "Four Clover",
                text = {
                    "{C:osc_crit}+#1#%{} Crit Chance"
                }
            },

            j_osc_boomshakalaka = {
                name = "Boom Shakalaka!",
                text = {
                    "{C:osc_power}+#1#{} Crit Power when {C:attention}Triggered",
                    "{C:attention}resets{} at the end of the {C:attention}ante"
                }
            },

            j_osc_d2 = {
                name = "D2",
                text = {
                    "Either {C:osc_crit}+#1#%{} Crit Chance or {C:osc_power}+#2#{} Crit Power",
                    "{C:attention}resets{} at the end of {C:attention}round"
                }
            },

            j_osc_d4 = {
                name = "D4",
                text = {
                    "{C:osc_crit}+SideX#1#%{} Crit Chance",
                    "{C:attention}resets{} at the end of {C:attention}round"
                }
            },

            j_osc_d6 = {
                name = "D6",
                text = {
                    "{C:osc_power}+Side/#1#{} Crit Power",
                    "{C:attention}resets{} at the end of {C:attention}round"
                }
            },

            j_osc_d8 = {
                name = "D8",
                text = {
                    "{C:osc_crit}+Side%{} Crit Chance",
                    "{C:osc_power}+Side/10{} Crit Power",
                    "{C:attention}resets{} at the end of {C:attention}round"
                }
            },

            j_osc_d10 = {
                name = "D10",
                text = {
                    "Gives {C:white,X:mult}XMult{C:attention} equal{} to {C:osc_power}Crit Power",
                    "{C:osc_power}+Side/#1#{} Crit Power",
                    "{C:attention}resets{} at the end of {C:attention}round"
                }
            },

            j_osc_d12 = {
                name = "D12",
                text = {
                    "Gives {C:white,X:chips}XChips{C:attention} equal{} to {C:osc_crit}Crit Chance",
                    "{C:osc_crit}+Side%{} Crit Chance",
                    "{C:attention}resets{} at the end of {C:attention}round"
                }
            },

            j_osc_capitalism = {
                name = "Capitalism",
                text = {
                    "{C:inactive}What's your sell value",
                    "{C:inactive}is {C:attention}my {C:inactive}sell value"
                }
            },

            j_osc_scam = {
                name = "Scam Artist",
                text = {
                    "Takes all your {C:attention}money",
                    "and {E:2}invests{} it in",
                    "{E:1,C:white,X:attention}JimboCoin{}. Gives it all",
                    "back at the {C:attention}end of round",
                    "{C:inactive}(Currently {C:money}$#1#{C:inactive})"
                }
            },

            j_osc_blackhole = {
                name = {"A Literal " .. (Osc_config.swears and "Fucking" or "Damn"), "Blackhole"},
                text = {
                    "Just sucks",
                    "alllll {C:attention}playing",
                    "{C:attention}cards{} in"
                }
            },

            j_osc_communism = {
                name = "Communism",
                text = {
                    "{C:inactive}What's my sell value",
                    "{C:inactive}is {C:attention}our {C:inactive}sell value"
                }
            },

            j_osc_jkr = {
                name = "Jkr",
                text = {
                    "{C:chips}+#1#{} Chps fr vry {C:attention}rw",
                    " n ll {C:attention}Jkrs'{} dscrptns"
                }
            },

            j_osc_fdj = {
                name = "{f:6}High Fidelity Joker",
                text = {
                    "{C:mult,f:6}+#1#{f:6} Mult"
                }
            },

            j_osc_neon = {
                name = "Neon Joker",
                text = {
                    {
                    "Played and Scored", 
                    "{C:attention}Cards{} give {X:chips,C:white}X#1#{} Chips"
                    },
                    {
                    "{E:1}Neonizes{} the",
                    "{C:attention}Screen"
                    }
                }
            },

            j_osc_badge = {
                name = "Badge Joker",
                text = {
                    "{C:inactive}(Currently {C:chips}+#2# {C:inactive}Chips)",
                    "{C:chips}+#1#{} Chips for every {C:attention}badge",
                    "this {C:attention}Joker{} has",
                    "{C:attention}Gains{} a new {C:attention}badge",
                    "when {C:attention}Hovered over"
                }
            },

            j_osc_jokerback = {
                name = {"The Back Of", "The Joker"},
                text = {
                    "{E:1}Oscillates{} between {C:mult}#1#{} and {C:mult}+#2#{} Mult",
                    "for every {C:attention}played{} and {C:attention}scored{} card"
                }

            },

            j_osc_radiance = {
                name = "The Radiance",
                text = {
                    " {C:mult}+#1#{} Mult for every",
                    "{C:attention}played{} and {C:attention}scored{} card"
                }
            },

            j_osc_ascended_grus = {
                name = {"Ascended", "Grus Mother"},
                text = {
                    "{X:mult,C:white}X#3#{} Mult",
                    "{E:1}Oscillates{} between {C:chips}+#1#{} Chips and",
                    "{C:mult}+#2#{} Mult for every {C:attention}played",
                    "and {C:attention}scored{} card",
                }
            },

            j_osc_gradient_grus = {
                name = {"Gradient", "Grus Mother"},
                text = {
                    "{X:mult,C:white}X#3#{} Mult",
                    "Every played and scored",
                    "card gives {C:mult}+#2#{} Mult and {C:chips}+#1#{} Chips"
                }
            },

            j_osc_mexico = {
                name = "Mexico",
                text = {
                    {
                    "{X:mult,C:white}X#1#{} Mult, gains",
                    "{X:mult,C:white}+X#2#{} Mult every",
                    "{C:attention}Boss Blind"
                    },
                    {
                    "{C:attention}Tints{} the",
                    "screen {C:attention,E:1}Yellow"
                    }
                }
            },

            j_osc_relentless = {
                name = {"Relentless Recurrence","Of Expressions"},
                text = {
                    "{C:green,E:1}#2# in 2{} chance to",
                    "give {X:mult,C:white}X2{} Mult {C:attention}repeatedly",
                    "until {C:green,E:1}failing"
                }
            },

            j_osc_red_plushie = {
                name = "Red Seal Plushie",
                text = {
                    "{C:mult}+#1#{} Mult",
                    "{C:attention}Retriggers{} itself",
                    "if a {C:attention}Card{} with", 
                    "a {C:red}Red Seal{} scored",
                    "this {C:blue}Hand"
                }
            },

            j_osc_skeletal = {
                name = {"Skeletal Extremigans", "Plushies"},
                text = {
                    {
                        "{C:attention}Played{} and {C:attention}Scored",
                        "{C:attention}Cards{} with a {C:attention}Seal",
                        "can give:"
                    },
                    {
                        "{C:green,E:1}#1# in #2#{} chance for {C:mult}+#3#{} Mult",
                        "{C:green,E:1}#1# in #4#{} chance for {C:mult}+#5#{} Mult",
                        "{C:green,E:1}#1# in #6#{} chance for {C:mult}+#7#{} Mult",
                        "{C:green,E:1}#1# in #8#{} chance for {C:mult}+#9#{} Mult"
                    }
                }
            },

            j_osc_blahaj = {
                name = "Blahaj",
                text = {
                    "{C:attention}Applies{} either Blue,",
                    "Pink or White {C:attention}Seal{} to",
                    "{C:attention}Played{} and {C:attention}Unscoring Cards"
                }
            },

            j_osc_large_blahaj = {
                name = "Large Blahaj",
                text = {
                    "{C:attention}Applies{} either Blue,",
                    "Pink or White {C:attention}Seal{} to",
                    "{C:red}Discarded{} cards if {C:attention}3",
                    "or less are {C:red}discarded"
                }
            },

            j_osc_djungelskog = {
                name = "Djungelskog",
                text = {
                    "{C:attention}Applies{} Sleepy Seal",
                    "to the {C:attention}leftmost{}",
                    "card in {C:blue}hand"
                }
            },

            j_osc_huggy_wuggy = {
                name = "Huggy Wuggy Plushie",
                text = {
                    "Gives {C:mult}+#1#{} Mult for",
                    "every {C:attention}Dummy sealed",
                    "card in deck"
                }
            },

            j_osc_dealer = {
                name = "Dealer Plushie",
                text = {
                    "{C:green,E:1}#1# in #2#{} chance to",
                    "{C:red}destroy{} cards in",
                    "{C:attention}played hand{}. Then",
                    "applies {E:1}Seal?{} to",
                    "every card in {C:blue}hand"
                    
                }
            },

            j_osc_legend_joker = {
                name = "Legendary Joker",
                text = {
                    "{C:mult}+#1#{} Mult",
                }
            },

            j_osc_oscillate = {
                name = "OSCILLATE",
                text = {
                    {
                        "{E:1}Oscillates{} effects when a {C:attention}played{} and {C:attention}scored{} card {C:attention}scores",
                        "{C:attention}Activates{} a new effect when a card is {C:attention}sold",
                        "{C:attention}Upgrades{} its active effects at the {C:attention}end of round",
                    },
                    {
                    "{C:mult}+#1#{} Mult, gains {C:mult}+#2#{} Mult {C:inactive}#3#",
                    "{X:mult,C:white}X#4#{} Mult, gains {X:mult,C:white}+X#5#{} Mult {C:inactive}#6#",
                    "{C:chips}+#7#{} Chips, gains {C:chips}+#8#{} Chips {C:inactive}#9#",
                    "{X:chips,C:white}X#10#{} Chips, gains {X:chips,C:white}+X#11#{} Chips {C:inactive}#12#",
                    "{C:money}$#13#{}, gains {C:money}+$#14# {C:inactive}#15#",
                    "{C:attention}+#16#{} Joker Slots, gains {C:attention}+#17#{} Joker Slots {C:inactive}#18#",
                    "{C:attention}+#19#{} Consumable Slots, gains {C:attention}+#20#{} Consumable Slots {C:inactive}#21#",
                    },
                    {
                        "Fixed {C:green,E:1}1 in 2{} chance to {C:attention}Retrigger{} itself",
                        "{C:inactive}(stacks up to the amount of active effects)"
                    }
                }
            },

            j_osc_samuksapo = {
                name = "Samuksapo",
                text = {
                    "{element:1}o"
                }
            },

            j_osc_2_eggs = {
                name = "2 Eggs",
                text = {
                    "All {C:attention}Jokers{} gain",
                    "{C:money}$#1# {C:attention}sell value",
                    "at the end of round"
                }
            },

            j_osc_jokeh = {
                name = "Jok-eh?",
                text = {
                    "Gives about",
                    "{C:mult}+4{} Mult or so"
                }
            },

            j_osc_polaroid = {
                name = "Polaroid",
                text = {
                    "Played and scored",
                    "{C:attention}face cards{} give", 
                    "{X:mult,C:white}X1.5{} Mult"
                }
            },

            j_osc_4th_wall = {
                name = "4th Wall Joker",
                text = {
                    "Gives {C:white,X:mult}Xmult{} equal",
                    "to the current",
                    "{E:1,C:attention}Oscillate Wave"
                }
            },

            j_osc_meta_joker = {
                name = "Meta Joker",
                text = {
                    {
                    "Does an effect based",
                    "on a random {E:1,C:attention}Oscillate Wave"
                    },
                    {
                    "{s:2,V:1}WAVE 1:",
                    "{C:mult}+#1#{} Mult",
                    " ",
                    "{s:2,V:2}WAVE 2:",
                    "{C:attention}Create{} a random p {C:attention}Joker",
                    "{C:inactive}(requires room)",
                    " ",
                    "{s:2,V:3}WAVE 3:",
                    "{C:osc_crit}+#2#%{} Crit Chance",
                    " ",
                    "{s:2,V:4}WAVE 4:",
                    "Create a {C:osc_song}Song"
                    }
                }
            },

            j_osc_commatose = {
                name = "Commatose",
                text = {
                    "{C:red}Debuff{} adjacent {C:attention}Jokers",
                    "{C:green}Retrigger{} all {C:attention}Jokers"
                }
            },

            j_osc_black_death = {
                name = "Black Death",
                text = {
                    "{X:mult,C:white}X#1#{} Mult",
                    "Gains {X:mult,C:white}+X#2#{} Mult when",
                    "a {C:attention}playing card{} gets",
                    "{C:red}destroyed{}, {C:attention}applies",
                    "plague to played cards"
                }
            },

            j_osc_release = {
                name = "Release!",
                text = {
                    "Gives {C:chips}+Chips{} equal",
                    "to {C:attention}#1#X{} the {C:attention}sum{} of",
                    "all {C:attention}Jokers'",
                    "{E:1,C:attention}Oscillate Waves"
                }
            },

            j_osc_blockophobia = {
                name = "Blockophobia",
                text = {
                    "{X:chips,C:white}X#1#{} Chips {C:attention}if{} played and", 
                    "scored {C:attention}card{} either gives", 
                    "a {C:attention}square{} or {C:attention}cubic{} number as {C:chips}+Chips"
                }
            },

            j_osc_bunny = {
                name = "Bunny",
                text = {
                    "{C:green,E:1}1 in #1#{} chance",
                    "to give {C:mult}+#2#{} Mult"
                }
            },

            j_osc_bnuuy = {
                name = "Bnuuy",
                text = {
                    "{C:green,E:1}1 in #1#{} chance",
                    "to give {C:chips}+#2#{} Chips"
                }
            },

            j_osc_black_bunny = {
                name = "Black Bunny",
                text = {
                    "{C:green,E:1}1 in #1#{} chance",
                    "to give {C:chips}+#2#{} Chips",
                    "and {C:mult}+#3#{} Mult"
                }
            },

            j_osc_tortoiseshell_bunny = {
                name = "Tortoiseshell Bunny",
                text = {
                    "{C:green,E:1}1 in #1#{} chance",
                    "to give {C:money}$#2#"
                }
            },

            j_osc_lilac_bunny = {
                name = "Lilac Bunny",
                text = {
                    "{C:green,E:1}1 in #1#{} chance",
                    "to give {X:mult,C:white}X#2#{} Mult"
                }
            },

            j_osc_orange_bunny = {
                name = "Orange Bunny",
                text = {
                    "{C:green,E:1}1 in #1#{} chance",
                    "to give {X:chips,C:white}X#2#{} Chips"
                }
            },

            j_osc_cinnamon_bunny = {
                name = "Cinnamon Bunny",
                text = {
                    "{C:green,E:1}1 in #1#{} chance",
                    "to give {X:money,C:white}X#2#$"
                }
            },

            j_osc_blue_bunny = {
                name = "Blue Bunny",
                text = {
                    "{C:green,E:1}1 in #1#{} chance",
                    "to give {C:chips}+#2#{} and",
                    "{X:chips,C:white}X#3#{} Chips"
                }
            },

            j_osc_red_bunny = {
                name = "Red Bunny",
                text = {
                    "{C:green,E:1}1 in #1#{} chance",
                    "to give {C:mult}+#2#{} and",
                    "{X:mult,C:white}X#3#{} Mult"
                }
            },

            j_osc_viadr = {
                name = "Viadrs Hubris",
                text = {
                    {
                    "{X:mult,C:white}X#1#{} Mult, {X:mult,C:white}+X#2#{} Mult for each",
                    "{C:attention}Joker{} thats {C:rare}Rare{} or above"
                    },
                    {
                    "When selecting a {C:attention}Blind{}",
                    "{C:red}destroys{} a random {C:attention}Joker{} that",
                    "is {C:uncommon}Uncommon{} or below and {C:attention}creates",
                    "A new {C:attention}Joker{} of one {E:1}rarity{} higher"
                    },
                    {
                    "{C:inactive}(Doesn't work with",
                    "{C:inactive}non-Oscillate modded rarities)"
                    }
                }
            },

            j_osc_jhhhw2 = {
                name = {"Jag Har Hittat Hans Weakness:","Electric Boogaloo"},
                text = {
                    {
                    "After scoring, {C:attention}subtracts",
                    "current {C:red}blind{} by",
                    "the current {C:attention}score"
                    },
                    {
                    "At the end of round",
                    "if the {C:red}blind size{} is",
                    "{C:dark_edition}negative{}, give {C:money}#1#$"
                    }
                }
            },

            j_osc_d20 = {
                name = "D20",
                text = {
                    {
                    "{C:inactive,E:1}Unique effects for each side...",
                    },
                    {
                    "1: {C:mult}+30{} Mult",
                    "2: {C:chips}+200{} Chips",
                    "3: {X:mult,C:white}X4{} Mult",
                    "4: {X:chips,C:white}X5{} Chips",
                    "5: {C:money}+8$",
                    "6: {C:attention}Create{} a Gamering card",
                    "7: {C:attention}Create{} a Song card",
                    "8: {C:attention}Create 10 {C:green,E:1}random{} Playing cards",
                    "9: {C:osc_crit}+10%{} Crit Chance",
                    "10: {C:osc_power}+0.5{} Crit Power",
                    "11: Reroll {C:attention}2{} times",
                    "12: {X:chips,C:white}XChips{} = {C:attention}Jokers{} to the {C:attention}left,{} {X:mult,C:white}XMult{} = {C:attention}Jokers{} to the {C:attention}right",
                    "13: {C:attention}Applies {C:dark_edition}negative{} to {C:attention}leftmost Joker",
                    "14: {C:attention}Applies{} Seal? to played cards",
                    "15: {C:attention}Ascends{} all {C:attention}Jokers {C:inactive}(if possible)",
                    "16: {C:attention}Create{} a Candy Joker",
                    "17: {C:attention}Create{} a Blursed Joker",
                    "18: {C:attention}Create{} a Bunny Joker",
                    "19: {C:attention}Create{} a WIZARD Joker",
                    "20: Half {C:red}Blind size"
                    }
                }
            }
        },

        Edition = {
            e_osc_deep_fry = {
                name = "Deep Fry",
                text =  {
                    "{X:chips,C:white}X#1#{} Chips",
                }
            },

            ["e_osc_edition?"] = {
                name = "Edition?",
                text =  {
                    "Randomizes {C:attention}Edition",
                    "upon Scoring"
                }
            },

            e_osc_first = {
                name = "First Edition",
                text =  {
                    "{C:money}+#1#$",
                    "Gains {C:money}+#2#$"
                }
            },
        },

        Back = {
            b_osc_queen = {
                name = "Queen Bee Deck",
                text = {
                    "Every card {C:attention}starts{} with",
                    "Honey seal applied"
                }
            }
        },

        Blind = {
            bl_osc_stamp = {
                name = "The Stamp",
                text = {
                    "Debuff cards",
                    "with Seals"
                }
            },

            bl_osc_toilet = {
                name = "The Toilet",
                text = {
                    "Debuff p Jokers",
                }
            },

            bl_osc_break = {
                name = "The Breaks",
                text = {
                    "Debuff Jokers that",
                    "are from {E:1,C:white}Oscillate"
                }
            }
        },

        Enhanced = {
            m_osc_jellyfish = {
                name = "Jelly Fish card",
                text = {
                    "{C:mult}+#1#{} Mult if on",
                    "{C:attention}boss{} blind",
                    "{C:attention}regardless{} of",
                    "{C:attention}where{} it is"
                }
            },

            m_osc_divine = {
                name = "Divine card",
                text = {
                    "{X:chips,C:white}X#1#{} Chips",
                    "{C:attention}spreads{} to nearby {C:attention}cards{}",
                    " when in {C:blue}hand{} but with",
                    "{X:chips,C:white}-X#2#{} less Chips",
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

            m_osc_plague = {
                name = "Plagued card",
                text = {
                    "{C:red}Self destructs{} after",
                    "3 Rounds",
                    "{C:inactive}(#1# left)"
                }
            },

            m_osc_soggy = {
                name = "Soggy card",
                text = {
                    "Gives an extra {C:attention}fifth",
                    "of the sum of {C:attention}adjacent",
                    "played cards' {C:chips}+Chips"
                }
            },

            ["m_osc_enhancement?"] = {
                name = "Enhanced Card?",
                text = {
                    "Randomizes {C:attention}Enhancement",
                    "upon Scoring"
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

            osc_crit_info = {
                name = "Crits",
                text = {
                    "{C:osc_crit}#1#%{} Crit Chance, {C:osc_power}#2#{} Crit Power",
                    " ",
                    "{C:osc_crit}Crits{} are a {C:attention}feature{} where when",
                    "something scores {C:inactive}(e.g. Jokers){},",
                    "it has a chance to {C:osc_crit}\"Crit\"{},",
                    "Which {C:attention}multiplies{} its value by",
                    "the {C:osc_power}Crit Power",
                    " ",
                    "Examples:",
                    "{C:mult}+3{} Mult -> {C:mult}+6{} Mult",
                    "{X:chips,C:white}X2{} Chips -> {X:chips,C:white}X4{} Chips"
                }
            },

            osc_anton = {
                name = "Atonhak12",
                text = {
                    "Atonhak12 came up",
                    "with this Joker"
                }
            },

            osc_shiba = {
                name = "Shibaboi2000",
                text = {
                    "Shibaboi2000 came up",
                    "with this Joker"
                }
            },

            osc_incubus_seal = {
                name = "Incubus Seal",
                text = {
                    "Gives a {C:attention}#1#th{} of the",
                    "{C:attention}Card's{C:chips} +Chips{} as",
                    "{C:mult}+Mult{}. Gains {C:chips}+#2#{} Chips"
                }
            },

            osc_pink_seal = {
                name = "Pink Seal",
                text = {
                    "Creates a {V:1}Candy Crush {C:attention}Joker",
                    "if played {C:attention}alone{} on the first {C:blue}Hand"
                }
            },

            osc_white_seal = {
                name = "White Seal",
                text = {
                    "{C:green,E:1}#1# in #2#{} Chance to",
                    "{C:attention}Level up{} played {C:blue}Hand",
                    "if {C:attention}Played{} and {C:attention}Unscoring"
                }
            },

            ["osc_seal?_seal"] = {
                name = "Seal?",
                text = {
                    "Randomizes {C:attention}Seal",
                    "upon Scoring"
                }
            },

            osc_sleepy_seal = {
                name = "Sleepy Seal",
                text = {
                    "{C:green,E:1}#1# in #2#{} Chance to",
                    "{C:attention}retrigger{} itself",
                    "{C:attention}#3#{} times"
                }
            },

            osc_dummy_seal = {
                name = "Dummy Seal",
                text = {
                    "No effect",
                }
            },

            osc_golden_red_seal = {
                name = "Golden Red Seal",
                text = {
                    "{C:attention}Retriggers{} itself {C:attention}once",
                    "for every {C:money}$#1#{} owned"
                }
            },

            osc_honey_seal = {
                name = "Honey Seal",
                text = {
                    "{s:3,E:1}BEES{} give an extra {C:money}1$",
                    "when in {C:blue}hand"
                }
            },

            osc_hell_seal = {
                name = "Hell Seal",
                text = {
                    "{C:green,E:1}1 in 3{} chance to {C:red}destroy",
                    "{C:attention}adjacent{} cards when in {C:blue}hand",
                    "{C:green,E:1}1 in 2{} chance to {C:attention}create{} a {C:osc_song}Song",
                    "when {C:red}destroying{} a card"
                }
            },

            p_osc_normal_gamering={
                name="Gamering Pack",
                text={
                    "Choose {C:attention}#1#{} of up to",
                    "{C:attention}#2# {C:gamering}Gamering{} cards to",
                    "keep",
                }, 
            },

            p_osc_jumbo_gamering={
                name="Jumbo Gamering Pack",
                text={
                    "Choose {C:attention}#1#{} of up to",
                    "{C:attention}#2# {C:gamering}Gamering{} cards to",
                    "keep",
                },
            },

            p_osc_mega_gamering={
                name="Mega Gamering Pack",
                text={
                    "Choose {C:attention}#1#{} of up to",
                    "{C:attention}#2# {C:gamering}Gamering{} cards to",
                    "keep",
                },
            },

            p_osc_normal_oscillate={
                name="Oscillate Pack",
                text={
                    "Choose {C:attention}#1#{} of up to",
                    "{C:attention}#2# {E:1}Oscillate{} cards to",
                    "keep",
                },
            },

            p_osc_jumbo_oscillate={
                name="Jumbo Oscillate Pack",
                text={
                    "Choose {C:attention}#1#{} of up to",
                    "{C:attention}#2# {E:1}Oscillate{} cards to",
                    "keep",
                },
            },

            p_osc_mega_oscillate={
                name="Mega Oscillate Pack",
                text={
                    "Choose {C:attention}#1#{} of up to",
                    "{C:attention}#2# {E:1}Oscillate{} cards to",
                    "keep",
                },
            },

            p_osc_normal_blursed={
                name="Blursed Pack",
                text={
                    "Choose {C:attention}#1#{} of up to",
                    "{C:attention}#2# {E:1}Blursed{} cards to",
                    "keep",
                },
            },

            p_osc_jumbo_blursed={
                name="Jumbo Blursed Pack",
                text={
                    "Choose {C:attention}#1#{} of up to",
                    "{C:attention}#2# {E:1}Blursed{} cards to",
                    "keep",
                },
            },

            p_osc_mega_blursed={
                name="Mega Blursed Pack",
                text={
                    "Choose {C:attention}#1#{} of up to",
                    "{C:attention}#2# {E:1}Blursed{} cards to",
                    "keep",
                },
            },
        },

        Spectral = {
            c_osc_blursed = {
                name = "Blessed Curse",
                text = {
                    "{C:attention}Create{} a random",
                    "{V:1,E:1}Blursed {C:attention}Joker"
                }
            },

            c_osc_candy = {
                name = "Yummy Candy",
                text = {
                    "{C:attention}Create{} a random",
                    "{V:1,E:1}Candy {C:attention}Joker"
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

            c_osc_harharhar = {
                name = {"har","har","har"},
                text = {
                    "{C:attention}Replaces{} every {C:attention}Joker",
                    "with one of a {E:1}rarity",
                    "higher, {E:1,C:green}1 in 3{} chance",
                    "to instead replace",
                    "with a {V:1,E:1}blursed {C:attention}Joker"
                }
            },

            c_osc_pphehe = {
                name = "pp hehe",
                text = {
                    "{C:attention}Every{} current {C:attention}Joker",
                    "counts as a p {C:attention}Joker"
                }
            },

            c_osc_wombo = {
                name = "Wombo Combo",
                text = {
                    "{C:osc_crit}+10%{} Crit Chance",
                    "{C:inactive,E:2}Yeah, that's it"
                }
            },

            c_osc_whitehole= {
                name = {"A Literal " .. (Osc_config.swears and "Fucking" or "Damn"), "Whitehole"},
                text = {
                    "Just creates",
                    "alllll {C:attention}playing",
                    "{C:attention}cards{} sucked in",
                    "by A Literal " .. (Osc_config.swears and "Fucking" or "Damn") .. " Blackhole,",
                    "But lost in {E:1}translation{}, a bit..."
                }
            },

            c_osc_book_virtues = {
                name = "Book Of Virtues",
                text = {
                    "Ascends {C:attention}1{} selected",
                    "{C:attention}Joker{}, if possible",
                    "{C:inactive}(#1#)"
                }
            },

            c_osc_diplopia = {
                name = "Diplopia",
                text = {
                    "{E:1}Duplicate every {C:attention,E:1}Joker"
                }
            },
        },

        osc_song = {
            c_osc_badassery = {
                name = (Osc_config.swears and "Fucking" or "Flipping") .. " Badassery",
                text = {
                    "{C:attention}Applies{} Red Seal",
                    "up to {C:attention}#1#{} selected cards"
                }
            },

            c_osc_guitar_solo = {
                name = {"The Guitar Solo:","Electric Boogaloo"},
                text = {
                    "{C:attention}Applies{} Blue Seal",
                    "up to {C:attention}#1#{} selected cards"
                }
            },

            c_osc_brian_ccancer = {
                name = "Brian CCancer",
                text = {
                    "{C:attention}Applies{} Purple Seal",
                    "up to {C:attention}#1#{} selected cards"
                }
            },

            c_osc_me_and_boys = {
                name = {"Me And The Boys","Looking For Some","Subway Surfers"},
                text = {
                    "{C:attention}Applies{} Gold Seal",
                    "up to {C:attention}#1#{} selected cards"
                }
            },

            c_osc_peter_griffin = {
                name = {"GET OUT OF","MY HEAD"},
                text = {
                    "{C:attention}Applies{} Incubus Seal",
                    "up to {C:attention}#1#{} selected cards"
                }
            },

            c_osc_fall_down = {
                name =  {"Me When I","Fall Down"},
                text = {
                    "{C:attention}Applies{} Pink Seal",
                    "up to {C:attention}#1#{} selected cards"
                }
            },

            c_osc_divine = {
                name = "Divine Protection",
                text = {
                    "{C:attention}Applies{} White Seal",
                    "up to {C:attention}#1#{} selected cards"
                }
            },

            c_osc_golden_badassery = {
                name = "Golden Badassery",
                text = {
                    "{C:attention}Applies{} Red Golden Seal",
                    "up to {C:attention}#1#{} selected cards"
                }
            },

            c_osc_bedtime_story = {
                name = "Bedtime Story",
                text = {
                    "{C:attention}Applies{} Sleepy Seal",
                    "up to {C:attention}#1#{} selected cards"
                }
            },

            c_osc_hair = {
                name = {"Help! My Hairline","Is Talking To My","Ex Behind My Back","Vol.2"},
                text = {
                    "{C:attention}Applies{} Honey Seal",
                    "up to {C:attention}#1#{} selected cards"
                }
            },

            c_osc_hell_tape = {
                name = "The Hell Tape",
                text = {
                    "{C:attention}Applies{} Hell Seal",
                    "up to {C:attention}#1#{} selected cards"
                }
            },

            c_osc_culmination = {
                name = "THE CULMINATION",
                text = {
                    "{C:attention}Applies{} Seal?",
                    "up to {C:attention}#1#{} selected cards"
                }
            },

            c_osc_noisum_maximum = {
                name = "Noisum Maximum",
                text = {
                    "{C:attention}Creates{} #1# {C:osc_song}Songs",
                    "{C:inactive}(doesn't need room)"
                }
            },

            c_osc_idk = {
                name = {"I Don't Even Know", "At This Point"},
                text = {
                    "{C:attention}Applies{} Dummy Seal",
                    "to {C:attention}all{} cards in hand"
                }
            },

            c_osc_epic = {
                name = {"THE EPICEST", "DROP EVER!!!"},
                text = {
                    "{C:attention}Applies{} Seal?",
                    "to {C:attention}1 in #1#{} dummy sealed",
                    "cards in {C:attention}deck"
                }
            },

            c_osc_fuckwad = {
                name = {(Osc_config.swears and "Fucking" or "Flipping") .. " Badassery:", "Return Of " .. (Osc_config.swears and "Fuckwad" or "Flipwad")},
                text = {
                    "{C:attention}Applies{} Red Golden Seal",
                    "to {C:attention}every{} red or gold sealed",
                    "card in {C:attention}deck"
                }
            },

            c_osc_bells = {
                name = "Bells Of God",
                text = {
                    "{C:attention}Every{} Seal in hand",
                    "{C:attention}spreads{} to adjacent cards"
                }
            },

            c_osc_bells_el = {
                name = {"Bells Of God:","Electric Boogaloo"},
                text = {
                    "{C:attention}One {C:green,E:1}random{} Seal in",
                    "hand gets {C:attention}applied{} to", 
                    "all cards in hand"
                }
            },

            c_osc_blurry = {
                name = "Blurry " .. (Osc_config.swears and "Ass Shit" or "Damn Screen"),
                text = {
                    "{C:attention}Applies{} Red Seal to",
                    "every dummy sealed",
                    "card in {C:blue}hand"
                }
            },

            c_osc_guitar_song = {
                name = {"Guitar Song But","With A Squealy Piano"},
                text = {
                    "{C:attention}Applies{} Blue Seal to",
                    "every dummy sealed",
                    "card in {C:blue}hand"
                }
            },

            c_osc_abyssmal = {
                name = "Abyssmal",
                text = {
                    "{C:attention}Applies{} Purple Seal to",
                    "every dummy sealed",
                    "card in {C:blue}hand"
                }
            },

            c_osc_flight = {
                name = {"Next Available","Flight"},
                text = {
                    "{C:attention}Applies{} Gold Seal to",
                    "every dummy sealed",
                    "card in {C:blue}hand"
                }
            },

            c_osc_gleep_glorp = {
                name = {"Gleep Glorp Blast","Of Kelper 22-B"},
                text = {
                    "{C:attention}Applies{} Incubus Seal to",
                    "every dummy sealed",
                    "card in {C:blue}hand"
                }
            },

            c_osc_beat_switch = {
                name = "Beat Switch!",
                text = {
                    "{C:attention}Applies{} Pink Seal to",
                    "every dummy sealed",
                    "card in {C:blue}hand"
                }
            },

            c_osc_chairman = {
                name = {"ALL HAIL THE","CHAIRMAN"},
                text = {
                    "{C:attention}Applies{} White Seal to",
                    "every dummy sealed",
                    "card in {C:blue}hand"
                }
            },

            c_osc_6_19 = {
                name = {"What The " .. (Osc_config.swears and "Fuck?" or "Hell?"),"6:19 Cover?"},
                text = {
                    "{C:attention}Applies{} Golden Red Seal to",
                    "every dummy sealed",
                    "card in {C:blue}hand"
                }
            },

            c_osc_throwback = {
                name = "Throwback Chronicles",
                text = {
                    "{C:attention}Applies{} Sleepy Seal to",
                    "every dummy sealed",
                    "card in {C:blue}hand"
                }
            },

            c_osc_basement_talk = {
                name = {"Help! It Came Out","Of The Basement And","Its Talking To Me!","Season 2 Episode 7","Volume 3 Chapter 8"},
                text = {
                    "{C:attention}Applies{} Honey Seal to",
                    "every dummy sealed",
                    "card in {C:blue}hand"
                }
            },

            c_osc_lighthouse = {
                name = {"Lighthouse Of","Pain And Despair"},
                text = {
                    "{C:attention}Applies{} Hell Seal to",
                    "every dummy sealed",
                    "card in {C:blue}hand"
                }
            },

            c_osc_overload = {
                name = "Sensory Overload",
                text = {
                    "{C:attention}Applies{} Seal? to",
                    "every dummy sealed",
                    "card in {C:blue}hand"
                }
            },

            c_osc_scawy = {
                name = {"What The","The Scawy"},
                text = {
                    "Hell Sealed cards",
                    "are {C:green,E:1}guaranteed{} to",
                    "create a {C:osc_song}Song"
                }
            },

            c_osc_faker = {
                name = "Faker",
                text = {
                    "Seal? Sealed cards",
                    "{C:attention}triggers{} in {C:blue}hand",
                    "aswell"
                }
            },

            c_osc_stomak = {
                name = "Stomak Accke",
                text = {
                    "Dummy Sealed cards",
                    "gives {C:mult}+1{} Mult"
                }
            },

            c_osc_psychedelic = {
                name = {"Psychedelic","Purgatory"},
                text = {
                    "Sleepy Sealed cards",
                    "attempts the {C:green,E:1}probability",
                    "a {C:attention}second{} time",
                    "{C:inactive}(effectively {C:green,E:1}#1# in #2#{C:inactive})"
                }
            },

            c_osc_lswave = {
                name = "LSWave",
                text = {
                    "Golden Red Sealed cards",
                    "gives {C:money}+2${} as well"
                }
            },

            c_osc_files = {
                name = {"The File","S"},
                text = {
                    "Honey Sealed cards",
                    "makes {s:3,E:1}BEES{}", 
                    "give {C:money}+2${} instead of {C:money}+1$"
                }
            },

            c_osc_shortest_violin = {
                name = {"Worlds Shortest","Violin"},
                text = {
                    "{C:green,E:1}1 in #1#{} chance to {C:attention}create",
                    "a {C:osc_song}Song{} card for each sealed",
                    "card in {C:blue}hand"
                }
            },

            c_osc_longest_violin = {
                name = {"Worlds Longest","Violin"},
                text = {
                    "{C:green,E:1}1 in #1#{} chance to {C:attention}create",
                    "a {C:osc_song}Song{} card for each non",
                    "sealed card in {C:blue}hand"
                }
            },
        },
    },

    misc = {
        dictionary = {
            saved_kakorrhapiaphobia = "Saved by Kakorrhapiaphobia",
            saved_anton = (Osc_config.swears and "Fuck" or "Screw") .." you (Saved by Anton's guide to not get " .. (Osc_config.swears and "molested" or "touched") .. ")",

            k_gamering = "Gamering",
            b_gamering_cards = "Gamering Cards",

            k_osc_song = "Song",
            b_osc_song_cards = "Song Cards",

            k_osc_p = "p Joker",

            gamering = "Gamering Pack",
            oscillate = "Oscillate Pack",
            blursed = "Blursed Pack"
        },
        labels = {
            osc_incubus_seal = "Incubus Seal",
            osc_pink_seal = "Pink Seal",
            osc_white_seal = "White Seal",
            ["osc_seal?_seal"] = "Seal?",
            osc_sleepy_seal = "Sleepy Seal",
            osc_dummy_seal = "Dummy Seal",
            osc_golden_red_seal = "Golden Red Seal",
            osc_honey_seal = "Honey Seal",
            osc_hell_seal = "Hell Seal",
            ["osc_edition?"] = "Edition?",
            osc_deep_fry = "Deep Fry",
            osc_first = "First Edition"
        }
    }
}