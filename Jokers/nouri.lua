
SMODS.Joker{ --Nouri
    key = "nouri",
    config = {
        extra = {
            repetitions0 = 6,
            hyperchips_n0 = 1.01,
            hyperchips_arrows0 = 10
        }
    },
    loc_txt = {
        ['name'] = 'Nouri',
        ['text'] = {
            [1] = 'When a {C:attention}Card{} is {C:attention}Scored{} Retrigger',
            [2] = 'it {C:attention}6{} Times and give {X:edition,C:blue}^^^^^^^^^^1.01{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["pedrosbr_pedrosbr_jokers"] = true },
    soul_pos = {
        x = 3,
        y = 1
    },
    
    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play  then
            return {
                repetitions = 6,
                message = localize('k_again_ex'),
                extra = {
                    hyperchips = {
                        10,
                        1.01
                    },
                    colour = G.C.DARK_EDITION
                }
            }
        end
    end
}