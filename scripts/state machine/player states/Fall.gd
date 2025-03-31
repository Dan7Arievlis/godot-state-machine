extends PlayerState

func enter(previous_state_path : String, data := {}) -> void:
	player.play_animation(FALL)


func physics_update(delta: float) -> void:
	player.velocity.y += player.gravity * delta * player.gravity_modifier
	player.velocity.y = min(player.velocity.y, player.terminal_velocity)
	player.handle_turn(player.walk_speed, player.air_accel, player.air_friction, player.air_turn_speed, delta)
	player.move_and_slide()
	
	if player.is_on_floor():
		finished.emit(LAND)
