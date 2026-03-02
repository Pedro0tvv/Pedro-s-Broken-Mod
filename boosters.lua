
SMODS.Booster {
    key = 'leboostermax',
    loc_txt = {
        name = "Le booster Max",
        text = {
            [1] = 'A {C:purple}custom{} booster pack with {C:blue}unique{} cards.'
        },
        group_name = "pedrosbr_boosters"
    },
    config = { extra = 5, choose = 1 },
    cost = 56,
    weight = 2,
    atlas = "CustomBoosters",
    pos = { x = 0, y = 0 },
    group_key = "pedrosbr_boosters",
    discovered = true,
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra }
        }
    end,
    create_card = function(self, card, i)
        return {
            set = "pedrosbr_pedrosbr_jokers",
            area = G.pack_cards,
            skip_materialize = true,
            soulable = true,
            key_append = "pedrosbr_leboostermax"
        }
    end,
    particles = function(self)
        -- No particles for joker packs
        end,
    }
    