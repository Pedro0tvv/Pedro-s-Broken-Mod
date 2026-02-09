
SMODS.Joker{ --Maximillianus
    key = "maximillianus",
    config = {
        extra = {
            days_awake = 0,
            echips0 = 2,
            xmult0 = 10
        }
    },
    loc_txt = {
        ['name'] = 'Maximillianus',
        ['text'] = {
            [1] = 'When a {C:attention}blind{} is selected',
            [2] = 'increase {C:edition}Days awake{}',
            [3] = 'by one. When a {C:attention}Hand{} is played',
            [4] = 'Drawn card to {C:attention}Hand{} to the',
            [5] = 'equivelent of Days you\'ve been',
            [6] = 'awake.',
            [7] = 'When a {C:attention}Card{} is Scored apply {X:chips,C:white}^2{} and {X:mult,C:white}^2{}',
            [8] = '{C:inactive}Current Days awake: #1# {}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
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
        x = 5,
        y = 1
    },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.days_awake}}
    end,
    
    calculate = function(self, card, context)
        if context.setting_blind  then
            return {
                func = function()
                    card.ability.extra.days_awake = (card.ability.extra.days_awake) + 1
                    return true
                end
            }
        end
        if context.cardarea == G.jokers and context.joker_main  then
            if G.hand and #G.hand.cards > 0 then
                SMODS.draw_cards(card.ability.extra.days_awake)
            end
            return {
                message = "+"..tostring(card.ability.extra.days_awake).." Cards Drawn"
            }
        end
        if context.individual and context.cardarea == G.play  then
            return {
                e_chips = 2,
                extra = {
                    Xmult = 10
                }
            }
        end
    end
}