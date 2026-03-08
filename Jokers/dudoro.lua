
SMODS.Joker{ --Dudoro
    key = "dudoro",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Dudoro',
        ['text'] = {
            [1] = 'When a {C:attention}Card{} is {C:attention}Bought{}',
            [2] = 'redeem 3 random {C:enhanced}Vouchers{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 2
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
        x = 5,
        y = 2
    },
    
    calculate = function(self, card, context)
        if context.buying_card  then
            local voucher_key = pseudorandom_element(G.P_CENTER_POOLS.Voucher, "5ff437f3").key
            local voucher_card = SMODS.create_card{area = G.play, key = voucher_key}
            voucher_card:start_materialize()
            voucher_card.cost = 0
            G.play:emplace(voucher_card)
            delay(0.8)
            voucher_card:redeem()
            
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.5,
                func = function()
                    voucher_card:start_dissolve()                
                    return true
                end
            }))
            local voucher_key = pseudorandom_element(G.P_CENTER_POOLS.Voucher, "0e0cdac8").key
            local voucher_card = SMODS.create_card{area = G.play, key = voucher_key}
            voucher_card:start_materialize()
            voucher_card.cost = 0
            G.play:emplace(voucher_card)
            delay(0.8)
            voucher_card:redeem()
            
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.5,
                func = function()
                    voucher_card:start_dissolve()                
                    return true
                end
            }))
            local voucher_key = pseudorandom_element(G.P_CENTER_POOLS.Voucher, "1011d0ae").key
            local voucher_card = SMODS.create_card{area = G.play, key = voucher_key}
            voucher_card:start_materialize()
            voucher_card.cost = 0
            G.play:emplace(voucher_card)
            delay(0.8)
            voucher_card:redeem()
            
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.5,
                func = function()
                    voucher_card:start_dissolve()                
                    return true
                end
            }))
            return {
                message = nil,
                extra = {
                    message = nil,
                    colour = G.C.RED,
                    extra = {
                        message = nil,
                        colour = G.C.RED
                    }
                }
            }
        end
    end
}