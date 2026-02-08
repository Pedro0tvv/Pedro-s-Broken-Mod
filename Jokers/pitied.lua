
SMODS.Joker{ --Pitied
    key = "pitied",
    config = {
        extra = {
            odds = 4,
            odds2 = 16,
            odds3 = 32,
            card_draw0 = 2,
            hypermult_n0 = 2,
            hypermult_arrows0 = 5
        }
    },
    loc_txt = {
        ['name'] = 'Pitied',
        ['text'] = {
            [1] = 'When any {C:attention}Card{} is Scored',
            [2] = '{C:green}1 in 4{} of drawing 2 {C:attention}Cards{}',
            [3] = '{C:green}1 in 16{} of creating a random {C:dark_edition}Negative{} {C:attention}Joker{}',
            [4] = '{C:green}1 in 32{} of applying {X:edition,C:red}^^^^^2{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
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
    pools = { ["pedrosbr_mycustom_jokers"] = true },
    soul_pos = {
        x = 1,
        y = 0
    },
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_pedrosbr_pitied')
        local new_numerator2, new_denominator2 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds2, 'j_pedrosbr_pitied')
        local new_numerator3, new_denominator3 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds3, 'j_pedrosbr_pitied')
        return {vars = {new_numerator, new_denominator, new_numerator2, new_denominator2, new_numerator3, new_denominator3}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_6499ef85', 1, card.ability.extra.odds, 'j_pedrosbr_pitied', false) then
                    if G.hand and #G.hand.cards > 0 then
                        SMODS.draw_cards(2)
                    end
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(2).." Cards Drawn", colour = G.C.BLUE})
                end
                if SMODS.pseudorandom_probability(card, 'group_1_27200a30', 1, card.ability.extra.odds2, 'j_pedrosbr_pitied', false) then
                    local created_joker = false
                    if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                        created_joker = true
                        G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                local joker_card = SMODS.add_card({ set = 'Joker' })
                                if joker_card then
                                    joker_card:set_edition("e_negative", true)
                                    
                                end
                                G.GAME.joker_buffer = 0
                                return true
                            end
                        }))
                    end
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = created_joker and localize('k_plus_joker') or nil, colour = G.C.BLUE})
                end
                if SMODS.pseudorandom_probability(card, 'group_2_7e40ad8e', 1, card.ability.extra.odds3, 'j_pedrosbr_pitied', false) then
                    SMODS.calculate_effect({hypermult = {
                        5,
                        2
                    }}, card)
                end
            end
        end
    end
}