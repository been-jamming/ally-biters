data:extend{
	{
		type = "selection-tool",
		name = "ally-biters-ally-remote",
		icon = "__base__/graphics/icons/spidertron-remote.png",
		flags = {"not-stackable", "only-in-cursor", "spawnable"},
		subgroup = "spawnables",
		--inventory_move_sound = item_sounds.spidertron_inventory_move,
		--pick_sound = item_sounds.spidertron_inventory_pickup,
		--drop_sound = item_sounds.mechanical_inventory_move,
		stack_size = 1,
		select =
		{
				border_color = {71, 255, 73},
				mode = {"entity-with-health"},
				cursor_box_type = "spidertron-remote-to-be-selected",
				entity_type_filters = {"unit"},
				entity_filter_mode = "whitelist"
		},
		alt_select =
		{
				border_color = {239, 153, 34},
				mode = {"entity-with-health"},
				cursor_box_type = "spidertron-remote-to-be-selected",
				entity_type_filters = {"unit"},
				entity_filter_mode = "whitelist"
		},
	}
}
