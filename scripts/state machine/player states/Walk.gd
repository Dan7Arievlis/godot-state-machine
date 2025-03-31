extends PlayerState

func enter(previous_state_path : String, data := {}) -> void:
	player.play_animation(WALK)


func handle_input(event: InputEvent) -> void:
	if event.is_action_pressed("crouch"):
		finished.emit(CROUCH)
	if event.is_action_pressed("drink"):
		finished.emit(DRINK)


func physics_update(delta: float) -> void:
	player.handle_turn(player.walk_speed, player.accel, player.friction, player.turn_speed, delta)
	player.velocity.y += player.gravity * delta
	player.move_and_slide()

	if not player.is_on_floor():
		if player.grab():
			finished.emit(GRAB)
			return
		finished.emit(APEX)
	elif player.jump():
		finished.emit(JUMP)
	elif not player.get_input_direction() and abs(player.velocity.x) < 60:
		finished.emit(IDLE)
		return
	elif player.attack():
		finished.emit(ATTACK_1)
	else:
		if player.grab():
			finished.emit(GRAB)
