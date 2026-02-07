
SMODS.Joker{ --Randall
    key = "randall",
    config = {
        extra = {
            dollars0 = 1.2,
            card_draw0 = 1,
            scale0 = 1.3,
            rotation0 = 1.7
        }
    },
    loc_txt = {
        ['name'] = 'Randall',
        ['text'] = {
            [1] = 'When another joker is {C:attention}Triggered{}',
            [2] = 'and You own {X:legendary,C:white}Pitied{} ,{X:money,C:white}x1.2${} and drawn',
            [3] = 'one {C:attention}Card{} to your hand'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 0
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
        x = 7,
        y = 0
    },
    
    calculate = function(self, card, context)
        if context.post_trigger  then
            if (function()
                for i, v in pairs(G.jokers.cards) do
                    if v.config.center.key == "j_pedrosbr_pitied" then 
                        return true
                    end
                end
            end)() then
                if G.hand and #G.hand.cards > 0 then
                    SMODS.draw_cards(1)
                end
                local target_card = context.other_card
                return {
                    
                    func = function()
                        
                        local current_dollars = G.GAME.dollars
                        local target_dollars = G.GAME.dollars * 1.2
                        local dollar_value = target_dollars - current_dollars
                        ease_dollars(dollar_value)
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "X"..tostring(1.2), colour = G.C.MONEY})
                        return true
                    end,
                    extra = {
                        message = "+"..tostring(1).." Cards Drawn",
                        colour = G.C.BLUE,
                        extra = {
                            func = function()
                                card:juice_up(1.3, 1.7)
                                return true
                            end,
                            colour = G.C.WHITE
                        }
                    }
                }
            end
        end
    end
}