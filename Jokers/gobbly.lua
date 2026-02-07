
SMODS.Joker{ --Gobbly
    key = "gobbly",
    config = {
        extra = {
            cardsinhand = 1
        }
    },
    loc_txt = {
        ['name'] = 'Gobbly',
        ['text'] = {
            [1] = 'For each {C:attention}Card{} in hand gain {C:money}10${}',
            [2] = 'and give {C:planet}20 levels{} for the most',
            [3] = 'played {C:attention}Hand{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 0
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
    pools = { ["pedrosbr_upedro_jokers"] = true },
    soul_pos = {
        x = 3,
        y = 0
    },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.cardsinhand + ((#(G.hand and G.hand.cards or {}) or 0)) * 10}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            local temp_played = 0
            local temp_order = math.huge
            local target_hand
            for hand, value in pairs(G.GAME.hands) do 
                if value.played > temp_played and value.visible then
                    temp_played = value.played
                    temp_order = value.order
                    target_hand = hand
                elseif value.played == temp_played and value.visible then
                    if value.order < temp_order then
                        temp_order = value.order
                        target_hand = hand
                    end
                end
            end
            
            level_up_hand(card, target_hand, true, card.ability.extra.cardsinhand + (#(G.hand and G.hand.cards or {})) * 20)
            return {
                
                func = function()
                    
                    local current_dollars = G.GAME.dollars
                    local target_dollars = G.GAME.dollars * card.ability.extra.cardsinhand + (#(G.hand and G.hand.cards or {})) * 10
                    local dollar_value = target_dollars - current_dollars
                    ease_dollars(dollar_value)
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "X"..tostring(card.ability.extra.cardsinhand + (#(G.hand and G.hand.cards or {})) * 10), colour = G.C.MONEY})
                    return true
                end,
                extra = {
                    message = localize('k_level_up_ex'),
                    colour = G.C.RED
                }
            }
        end
    end
}