extends PlayerState

func enter(previous_state_path : String, data := {}) -> void:
	player.play_animation(APEX)


func physics_update(delta: float) -> void:
	var mod = player.apex_modifier if player.velocity.y < abs(player.apex_margin)  and Input.is_action_pressed("jump") else 1
	player.handle_turn(player.walk_speed * mod, player.air_accel, player.air_friction, player.air_turn_speed, delta)
	player.velocity.y += player.gravity * delta * player.gravity_modifier
	player.move_and_slide()
	
	if player.velocity.y > player.fall_velocity_threshold:
		finished.emit(FALL)
	if player.is_on_floor():
		finished.emit(IDLE)
	else:
		if player.grab():
			finished.emit(GRAB)
			return
		if player.jump():
			finished.emit(JUMP)
