data:extend{
	{
		type = "custom-input",
		name = "ally-biters-give-ally-remote",
		key_sequence = "ALT + E",
		controller_key_sequence = "controller-lefttrigger + controller-x",
		block_modifiers = true,
		consuming = "game-only",
		item_to_spawn = "ally-biters-ally-remote",
		action = "spawn-item"
	},
	{
		type = "custom-input",
		name = "ally-biters-command",
		key_sequence = "mouse-button-2",
		action = "lua"
	}
}
