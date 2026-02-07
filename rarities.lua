SMODS.Rarity {
    key = "brotic",
    pools = {
        ["Joker"] = true
    },
    default_weight = 0.003,
    badge_colour = HEX('6e4300'),
    loc_txt = {
        name = "Brotic"
    },
    get_weight = function(self, weight, object_type)
        return weight
    end,
}