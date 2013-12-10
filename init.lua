local S
if intllib then
	S = intllib.Getter()
else
	S = function(s) return s end
end

minetest.register_craftitem("hops:hops_seed", {
	description = S("Hops Seeds"),
	inventory_image = "hops_hops_seed.png",
	on_place = function(itemstack, placer, pointed_thing)
		local above = minetest.env:get_node(pointed_thing.above)
		if above.name == "air" then
			above.name = "hops:hops_1"
			minetest.env:set_node(pointed_thing.above, above)
			itemstack:take_item(1)
			return itemstack
		end
	end
})

minetest.register_node("hops:hops_1", {
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	drawtype = "plantlike",
	drop = "",
	tiles = {"hops_hops_1.png"},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.5+6/16, 0.5}
		},
	},
	groups = {snappy=3, flammable=2, not_in_creative_inventory=1, plant=1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("hops:hops_2", {
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	drawtype = "plantlike",
	drop = "",
	tiles = {"hops_hops_2.png"},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.5+12/16, 0.5}
		},
	},
	groups = {snappy=3, flammable=2, not_in_creative_inventory=1, plant=1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("hops:hops", {
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	drawtype = "plantlike",
	tiles = {"hops_hops.png"},
	drop = {
		max_items = 6,
		items = {
			{ items = {'hops:hops_seed'} },
			{ items = {'hops:hops_seed'}, rarity = 2},
			{ items = {'hops:hops_seed'}, rarity = 5},
			{ items = {'hops:hops_cone'} },
			{ items = {'hops:hops_cone'}, rarity = 2 },
			{ items = {'hops:hops_cone'}, rarity = 5 }
		}
	},
	groups = {snappy=3, flammable=2, not_in_creative_inventory=1, plant=1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_craftitem("hops:hops_cone", {
	description = S("Hops cone"),
	inventory_image = "hops_hops_cone.png",
})

minetest.register_craftitem("hops:hops_crude_beer_mix", {
	description = S("Crude beer mix"),
	inventory_image = "hops_hops_crude_mix.png",
})

minetest.register_craftitem("hops:hops_fine_beer_mix", {
	description = S("Fine beer mix"),
	inventory_image = "hops_hops_fine_mix.png",
})

-- Craft

minetest.register_craft({
	type = "shapeless",	
	output = "hops:hops_crude_beer_mix",
	recipe = {"hops:hops_cone","bucket:bucket_water"},
	replacements = {{"bucket:bucket_water", "bucket:bucket_empty"}}
})

minetest.register_craft({
	type = "cooking",	
	output = "hops:hops_fine_beer_mix",
	recipe = "hops:hops_crude_beer_mix",
	cooktime = 10,
})

-- Link farming_plus

farming:add_plant("hops:hops", {"hops:hops_1", "hops:hops_2"}, 50, 20)
farming.seeds["hops:hops_seed"] = 60

-- Fuel
minetest.register_craft({
	type = "fuel",
	recipe = "hops:hops_seed",
	burntime = 1
})

minetest.register_craft({
	type = "fuel",
	recipe = "hops:hops_cone",
	burntime = 1
})

-- Alias
minetest.register_alias("farming_plus:hops_seed", "hops:hops_seed")
minetest.register_alias("farming_plus:hops_1", "hops:hops_1")
minetest.register_alias("farming_plus:hops_2", "hops:hops_2")
minetest.register_alias("farming_plus:hops", "hops:hops")
minetest.register_alias("farming_plus:hops_cone", "hops:hops_cone")
minetest.register_alias("farming_plus:hops_crude_beer_mix", "hops:hops_crude_beer_mix")
minetest.register_alias("farming_plus:hops_fine_beer_mix", "hops:hops_fine_beer_mix")
