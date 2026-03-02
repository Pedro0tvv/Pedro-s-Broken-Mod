
SMODS.Joker{ --Unlejos
    key = "unlejos",
    config = {
        extra = {
            currentyearday = 0,
            hyperchips_arrows0 = 3
        }
    },
    loc_txt = {
        ['name'] = 'Unlejos',
        ['text'] = {
            [1] = 'When a {C:attention}Hand{} is {C:attention}Played{}',
            [2] = 'Give {X:edition,C:blue}^^{} Of {C:blue}Chips{} By',
            [3] = 'each the {C:edition}Day{} of the {C:dark_edition}Year{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = "pedrosbr_brotic",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["pedrosbr_pedrosbr_jokers"] = true },
    soul_pos = {
        x = 3,
        y = 2
    },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {os.date("*t", os.time()).yday}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                hyperchips = {
                    3,
                    os.date("*t", os.time()).yday
                }
            }
        end
    end
}