data:extend{
	--Frequency in ticks that damage is applied to ally units
	{
		type = "int-setting",
		name = "ally-biters-decay-frequency",
		setting_type = "runtime-global",
		default_value = 60,
		minimum_value = 0
	},
	--Amount of damage to apply to ally units
	{
		type = "int-setting",
		name = "ally-biters-decay-damage",
		setting_type = "runtime-global",
		default_value = 5,
		minimum_value = 0
	},
	--Whether to allow ally units to form nests
	{
		type = "bool-setting",
		name = "ally-biters-form-nests",
		setting_type = "runtime-global",
		default_value = false
	}
}

