
SMODS.Joker{ --Myssyli 
    key = "myssyli",
    config = {
        extra = {
            jokercount = 0
        }
    },
    loc_txt = {
        ['name'] = 'Myssyli ',
        ['text'] = {
            [1] = 'When any {C:attention}Card{} is {C:attention}Scored{}',
            [2] = 'and more than {C:attention}2{} cards Were {C:spectral}Played{}',
            [3] = '{C:default}Retrigger{} the card by the amount',
            [4] = 'of {C:attention}Jokers{} You have'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 0
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
        x = 5,
        y = 0
    },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {#(G.jokers and (G.jokers and G.jokers.cards or {}) or {})}}
    end,
    
    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play  then
            if to_big(#context.scoring_hand) >= to_big(2) then
                return {
                    repetitions = #(G.jokers and G.jokers.cards or {}),
                    message = localize('k_again_ex')
                }
            end
        end
    end
}