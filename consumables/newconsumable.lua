
SMODS.Consumable {
    key = 'newconsumable',
    set = 'Tarot',
    pos = { x = 0, y = 0 },
    loc_txt = {
        name = 'New Consumable',
        text = {
            [1] = 'A {C:purple}custom{} consumable with {C:blue}unique{} effects.'
        }
    },
    cost = 3,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'CustomConsumables',
    can_use = function(self, card)
        return true
    end
}