local tracked_units = nil
local previous_flare = nil

local function decay_biter_health(event)
	for _, surf in pairs(game.surfaces) do
		local friendly_biters = surf.find_entities_filtered{type = "unit", force = "player"}
		for _, biter in pairs(friendly_biters) do
			biter.damage(settings.global["ally-biters-decay-damage"].value, game.forces["player"])
		end
	end
end

local function kill_friendly_built_base(event)
	if event.entity.force == game.forces["player"] then
		event.entity.die()
	end
end

local function track_selected_units(event)
	if event.item == "ally-biters-ally-remote" then
		tracked_units = event.entities
	end
end

local function command_biters(event)
	local commandable = nil
	local player = game.get_player(event.player_index)

	if player.cursor_stack and player.cursor_stack.valid_for_read and player.cursor_stack.name == "ally-biters-ally-remote" then

		if previous_flare and previous_flare.valid then
			previous_flare.destroy()
		end
		previous_flare = player.surface.create_entity{name = "artillery-flare", position = event.cursor_position, force = player.force, movement = {0, 0}, height = 0, vertical_speed = 0, frame_speed = 1}

		if tracked_units then
			for _, entity in pairs(tracked_units) do
				if entity.valid and entity.commandable and entity.force == player.force and entity.type == "unit" then
					if not commandable then
						commandable = player.surface.create_unit_group{position = entity.position, force = player.force}
					end
					commandable.add_member(entity)
				end
			end
		end

		if commandable then
			commandable.set_command({type = defines.command.go_to_location, destination = event.cursor_position})
		end
	end
end

if settings.global["ally-biters-decay-damage"].value > 0 then
	script.on_nth_tick(settings.global["ally-biters-decay-frequency"].value, decay_biter_health)
end

if not settings.global["ally-biters-form-nests"].value then
	script.on_event(defines.events.on_biter_base_built, kill_friendly_built_base)
end

script.on_event(defines.events.on_player_selected_area, track_selected_units)
script.on_event("ally-biters-command", command_biters)

