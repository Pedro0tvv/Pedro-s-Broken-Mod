
SMODS.Joker{ --Rusudana
    key = "rusudana",
    config = {
        extra = {
            odds = 4,
            odds2 = 8
        }
    },
    loc_txt = {
        ['name'] = 'Rusudana',
        ['text'] = {
            [1] = 'Before {C:attention}Hand{} starts {C:attention}Scoring{}',
            [2] = '{C:green}1 in 4{} of shuffling all {C:attention}Jokers{}',
            [3] = 'When any Card is Scored {C:green}1 in 8{}',
            [4] = 'of balancing {C:blue}Chips{} and {C:red}Mult{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
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
        x = 7,
        y = 1
    },
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_pedrosbr_rusudana')
        local new_numerator2, new_denominator2 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds2, 'j_pedrosbr_rusudana')
        return {vars = {new_numerator, new_denominator, new_numerator2, new_denominator2}}
    end,
    
    calculate = function(self, card, context)
        if context.before and context.cardarea == G.jokers  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_a5deb29b', 1, card.ability.extra.odds, 'j_pedrosbr_rusudana', false) then
                    if #G.jokers.cards > 1 then
                        G.jokers:unhighlight_all()
                        G.E_MANAGER:add_event(Event({
                            trigger = 'before',
                            func = function()
                                G.E_MANAGER:add_event(Event({
                                    func = function()
                                        G.jokers:shuffle('aajk')
                                        play_sound('cardSlide1', 0.85)
                                        return true
                                    end,
                                }))
                                delay(0.15)
                                G.E_MANAGER:add_event(Event({
                                    func = function()
                                        G.jokers:shuffle('aajk')
                                        play_sound('cardSlide1', 1.15)
                                        return true
                                    end
                                }))
                                delay(0.15)
                                G.E_MANAGER:add_event(Event({
                                    func = function()
                                        G.jokers:shuffle('aajk')
                                        play_sound('cardSlide1', 1)
                                        return true
                                    end
                                }))
                                delay(0.5)
                                return true
                            end
                        }))
                    end
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "AHHHHHHHHH", colour = G.C.ORANGE})
                end
            end
        end
        if context.individual and context.cardarea == G.play  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_c2d9fff8', 1, card.ability.extra.odds2, 'j_pedrosbr_rusudana', false) then
                    SMODS.calculate_effect({balance = true}, card)
                end
            end
        end
    end
}