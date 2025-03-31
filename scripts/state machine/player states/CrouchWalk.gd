extends PlayerState

func enter(previous_state_path : String, data := {}) -> void:
	player.play_animation(CROUCH_WALK)


func handle_input(event: InputEvent) -> void:
	if event.is_action_pressed("crouch"):
		finished.emit(CROUCH_UP)
	if event.is_action_pressed("drink"):
		finished.emit(CROUCH_UP, {"drink" = true})


func physics_update(delta: float) -> void:
	player.handle_turn(player.crouch_speed, player.crouch_accel, player.crouch_friction, player.crouch_turn_speed, delta)
	player.velocity.y += player.gravity * delta
	player.move_and_slide()

	if not player.is_on_floor():
		finished.emit(APEX)
	elif player.jump() and not %CeilingCheck.is_colliding():
		finished.emit(JUMP)
	elif player.attack():
		finished.emit(CROUCH_UP, {"attack" = true})
	elif not player.get_input_direction() and abs(player.velocity.x) < 30:
		finished.emit(CROUCH_IDLE)
		return
