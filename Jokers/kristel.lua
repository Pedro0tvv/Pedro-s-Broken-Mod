
SMODS.Joker{ --Kristel
    key = "kristel",
    config = {
        extra = {
            dollars0 = 999
        }
    },
    loc_txt = {
        ['name'] = 'Kristel',
        ['text'] = {
            [1] = 'When {C:attention}Hand{} is First {C:attention}Drawn{}',
            [2] = 'and You have more than {C:money}1000{}',
            [3] = 'set money to {C:money}999{} and',
            [4] = 'create 4 random {C:dark_edition}Negative{} {C:attention}Jokers{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
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
        x = 9,
        y = 0
    },
    
    calculate = function(self, card, context)
        if context.first_hand_drawn  then
            if to_big(G.GAME.dollars) > to_big(1000) then
                return {
                    
                    func = function()
                        
                        local current_dollars = G.GAME.dollars
                        local target_dollars = 999
                        local dollar_value = target_dollars - current_dollars
                        ease_dollars(dollar_value)
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Set to $"..tostring(999), colour = G.C.MONEY})
                        return true
                    end,
                    extra = {
                        func = function()
                            local available_jokers = {}
                            for i, joker in ipairs(G.jokers.cards) do
                                table.insert(available_jokers, joker)
                            end
                            local target_joker = #available_jokers > 0 and pseudorandom_element(available_jokers, pseudoseed('copy_joker')) or nil
                            
                            if target_joker then
                                G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                                G.E_MANAGER:add_event(Event({
                                    func = function()
                                        local copied_joker = copy_card(target_joker, nil, nil, nil, target_joker.edition and target_joker.edition.negative)
                                        copied_joker:set_edition("negative", true)
                                        
                                        copied_joker:add_to_deck()
                                        G.jokers:emplace(copied_joker)
                                        G.GAME.joker_buffer = 0
                                        return true
                                    end
                                }))
                                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_duplicated_ex'), colour = G.C.GREEN})
                            end
                            return true
                        end,
                        colour = G.C.GREEN,
                        extra = {
                            func = function()
                                local available_jokers = {}
                                for i, joker in ipairs(G.jokers.cards) do
                                    table.insert(available_jokers, joker)
                                end
                                local target_joker = #available_jokers > 0 and pseudorandom_element(available_jokers, pseudoseed('copy_joker')) or nil
                                
                                if target_joker then
                                    G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                                    G.E_MANAGER:add_event(Event({
                                        func = function()
                                            local copied_joker = copy_card(target_joker, nil, nil, nil, target_joker.edition and target_joker.edition.negative)
                                            copied_joker:set_edition("negative", true)
                                            
                                            copied_joker:add_to_deck()
                                            G.jokers:emplace(copied_joker)
                                            G.GAME.joker_buffer = 0
                                            return true
                                        end
                                    }))
                                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_duplicated_ex'), colour = G.C.GREEN})
                                end
                                return true
                            end,
                            colour = G.C.GREEN,
                            extra = {
                                func = function()
                                    local available_jokers = {}
                                    for i, joker in ipairs(G.jokers.cards) do
                                        table.insert(available_jokers, joker)
                                    end
                                    local target_joker = #available_jokers > 0 and pseudorandom_element(available_jokers, pseudoseed('copy_joker')) or nil
                                    
                                    if target_joker then
                                        G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                                        G.E_MANAGER:add_event(Event({
                                            func = function()
                                                local copied_joker = copy_card(target_joker, nil, nil, nil, target_joker.edition and target_joker.edition.negative)
                                                copied_joker:set_edition("negative", true)
                                                
                                                copied_joker:add_to_deck()
                                                G.jokers:emplace(copied_joker)
                                                G.GAME.joker_buffer = 0
                                                return true
                                            end
                                        }))
                                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_duplicated_ex'), colour = G.C.GREEN})
                                    end
                                    return true
                                end,
                                colour = G.C.GREEN,
                                extra = {
                                    func = function()
                                        local available_jokers = {}
                                        for i, joker in ipairs(G.jokers.cards) do
                                            table.insert(available_jokers, joker)
                                        end
                                        local target_joker = #available_jokers > 0 and pseudorandom_element(available_jokers, pseudoseed('copy_joker')) or nil
                                        
                                        if target_joker then
                                            G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                                            G.E_MANAGER:add_event(Event({
                                                func = function()
                                                    local copied_joker = copy_card(target_joker, nil, nil, nil, target_joker.edition and target_joker.edition.negative)
                                                    copied_joker:set_edition("negative", true)
                                                    
                                                    copied_joker:add_to_deck()
                                                    G.jokers:emplace(copied_joker)
                                                    G.GAME.joker_buffer = 0
                                                    return true
                                                end
                                            }))
                                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_duplicated_ex'), colour = G.C.GREEN})
                                        end
                                        return true
                                    end,
                                    colour = G.C.GREEN
                                }
                            }
                        }
                    }
                }
            end
        end
    end
}