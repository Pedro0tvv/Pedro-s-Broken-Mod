
SMODS.Joker{ --Tayeb
    key = "tayeb",
    config = {
        extra = {
            hands0 = 1,
            hyperchips_n0 = 4,
            hyperchips_arrows0 = 2,
            hypermult_n0 = 4,
            hypermult_arrows0 = 2
        }
    },
    loc_txt = {
        ['name'] = 'Tayeb',
        ['text'] = {
            [1] = 'When any {C:attention}Card{} is {C:attention}Scored{} Set {C:blue}Hands{}',
            [2] = 'To {C:attention}1{} and apply {X:edition,C:blue}^^4{} and{X:edition,C:red}^^4{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 1
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
        x = 1,
        y = 1
    },
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            return {
                
                func = function()
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Set to "..tostring(1).." Hands", colour = G.C.BLUE})
                    
                    G.GAME.round_resets.hands = 1
                    ease_hands_played(1 - G.GAME.current_round.hands_left)
                    
                    return true
                end,
                extra = {
                    hyperchips = {
                        2,
                        4
                    },
                    colour = G.C.DARK_EDITION,
                    extra = {
                        hypermult = {
                            2,
                            4
                        },
                        colour = G.C.DARK_EDITION
                    }
                }
            }
        end
    end
}