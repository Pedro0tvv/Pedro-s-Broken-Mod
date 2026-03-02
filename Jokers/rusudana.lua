
SMODS.Joker{ --Rusudana
    key = "rusudana",
    config = {
        extra = {
            Discovered = 0
        }
    },
    loc_txt = {
        ['name'] = 'Rusudana',
        ['text'] = {
            [1] = 'When any {C:attention}Card{} is {C:attention}Bough{} it is',
            [2] = '{X:money,C:red}Discovered{}. When any {C:attention}Card{} is',
            [3] = '{C:attention}Scored{} Apply {X:money,C:red}Discovered{}',
            [4] = 'as {X:mult,C:white}xMult{}',
            [5] = '{C:inactive} Discovered Currently at #1# {}'
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
        
        return {vars = {card.ability.extra.Discovered}}
    end,
    
    calculate = function(self, card, context)
        if context.buying_card  then
            return {
                func = function()
                    card.ability.extra.Discovered = (card.ability.extra.Discovered) + 1
                    return true
                end
            }
        end
        if context.individual and context.cardarea == G.play  then
            return {
                Xmult = card.ability.extra.Discovered
            }
        end
    end
}