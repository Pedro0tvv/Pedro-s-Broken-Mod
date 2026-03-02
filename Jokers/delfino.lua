
SMODS.Joker{ --Delfino
    key = "delfino",
    config = {
        extra = {
            jokercount = 0
        }
    },
    loc_txt = {
        ['name'] = 'Delfino',
        ['text'] = {
            [1] = 'Before {C:attention}Hand{} starts {C:attention}Scoring{}',
            [2] = '{C:attention}Draw{} one {C:attention}Card{} per {C:attention}Joker{} owned'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 2
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
        x = 1,
        y = 2
    },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {#(G.jokers and (G.jokers and G.jokers.cards or {}) or {})}}
    end,
    
    calculate = function(self, card, context)
        if context.before and context.cardarea == G.jokers  then
            if G.hand and #G.hand.cards > 0 then
                SMODS.draw_cards(#(G.jokers and G.jokers.cards or {}))
            end
            return {
                message = "+"..tostring(#(G.jokers and G.jokers.cards or {})).." Cards Drawn"
            }
        end
    end
}