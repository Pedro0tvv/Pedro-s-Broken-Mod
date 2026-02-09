
SMODS.Joker{ --Delfino
    key = "delfino",
    config = {
        extra = {
            echips0 = 2
        }
    },
    loc_txt = {
        ['name'] = 'Delfino',
        ['text'] = {
            [1] = 'When a {C:attention}Card{} is {C:attention}Scored{} and its',
            [2] = 'rank is {C:attention}5{} apply {C:blue}^2{} if not',
            [3] = 'Destroy it'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
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
        x = 9,
        y = 1
    },
    
    calculate = function(self, card, context)
        if context.destroy_card and context.destroy_card.should_destroy  then
            return { remove = true }
        end
        if context.individual and context.cardarea == G.play  then
            context.other_card.should_destroy = false
            if context.other_card:is_face() then
                context.other_card.should_destroy = true
                return {
                    message = "Destroyed!"
                }
            elseif context.other_card:get_id() == 14 then
                context.other_card.should_destroy = true
                return {
                    message = "Destroyed!"
                }
            elseif context.other_card:get_id() == 3 then
                context.other_card.should_destroy = true
                return {
                    message = "Destroyed!"
                }
            elseif context.other_card:get_id() == 7 then
                context.other_card.should_destroy = true
                return {
                    message = "Destroyed!"
                }
            elseif context.other_card:get_id() == 9 then
                context.other_card.should_destroy = true
                return {
                    message = "Destroyed!"
                }
            else
                return {
                    e_chips = 2
                }
                context.other_card.should_destroy = true
                return {
                    message = "Destroyed!"
                }
            end
        end
    end
}