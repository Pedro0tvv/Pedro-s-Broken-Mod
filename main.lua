SMODS.Atlas({
    key = "modicon", 
    path = "ModIcon.png", 
    px = 34,
    py = 34,
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "balatro", 
    path = "balatro.png", 
    px = 333,
    py = 216,
    prefix_config = { key = false },
    atlas_table = "ASSET_ATLAS"
})


SMODS.Atlas({
    key = "CustomJokers", 
    path = "CustomJokers.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

local NFS = require("nativefs")
to_big = to_big or function(a) return a end
lenient_bignum = lenient_bignum or function(a) return a end

local jokerIndexList = {7,2,5,8,3,10,6,4,9,1}

local function load_jokers_folder()
    local mod_path = SMODS.current_mod.path
    local jokers_path = mod_path .. "/jokers"
    local files = NFS.getDirectoryItemsInfo(jokers_path)
    for i = 1, #jokerIndexList do
        local file_name = files[jokerIndexList[i]].name
        if file_name:sub(-4) == ".lua" then
            assert(SMODS.load_file("jokers/" .. file_name))()
        end
    end
end

local function load_rarities_file()
    local mod_path = SMODS.current_mod.path
    assert(SMODS.load_file("rarities.lua"))()
end

load_rarities_file()
load_jokers_folder()
SMODS.ObjectType({
    key = "pedrosbr_food",
    cards = {
        ["j_gros_michel"] = true,
        ["j_egg"] = true,
        ["j_ice_cream"] = true,
        ["j_cavendish"] = true,
        ["j_turtle_bean"] = true,
        ["j_diet_cola"] = true,
        ["j_popcorn"] = true,
        ["j_ramen"] = true,
        ["j_selzer"] = true
    },
})

SMODS.ObjectType({
    key = "pedrosbr_pedrosbr_jokers",
    cards = {
        ["j_pedrosbr_delfino"] = true,
        ["j_pedrosbr_kristel"] = true,
        ["j_pedrosbr_maximillianus"] = true,
        ["j_pedrosbr_myssyli"] = true,
        ["j_pedrosbr_nouri"] = true,
        ["j_pedrosbr_randall"] = true,
        ["j_pedrosbr_rusudana"] = true,
        ["j_pedrosbr_tayeb"] = true
    },
})

SMODS.ObjectType({
    key = "pedrosbr_upedro_jokers",
    cards = {
        ["j_pedrosbr_gobbly"] = true
    },
})

SMODS.ObjectType({
    key = "pedrosbr_mycustom_jokers",
    cards = {
        ["j_pedrosbr_pitied"] = true
    },
})


SMODS.current_mod.optional_features = function()
    return {
        cardareas = {},
        post_trigger = true 
    }
end