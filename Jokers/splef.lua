
SMODS.Joker{ --spleF
    key = "splef",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'spleF',
        ['text'] = {
            [1] = 'When a {C:attention}Card{} is {C:attention}Scored{} Swap',
            [2] = '{C:blue}Chips{} and {C:red}Mult{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["pedrosbr_pedrosbr_jokers"] = true },
    soul_pos = {
        x = 9,
        y = 1
    },
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            return {
                swap = true
            }
        end
    end
}