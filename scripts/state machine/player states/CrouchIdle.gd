extends PlayerState

func enter(previous_state_path : String, data := {}) -> void:
	player.play_animation(CROUCH_IDLE)


func handle_input(event: InputEvent) -> void:
	if event.is_action_pressed("crouch"):
		finished.emit(CROUCH_UP)
	if event.is_action_pressed("drink"):
		finished.emit(CROUCH_UP, {"drink" = true})


func physics_update(delta: float) -> void:
	player.velocity.x = lerp(player.velocity.x, 0.0, player.friction * delta)
	player.velocity.y += player.gravity * delta
	player.move_and_slide()

	if not player.is_on_floor():
		finished.emit(APEX)
	elif player.jump() and not %CeilingCheck.is_colliding():
		finished.emit(JUMP)
	elif player.get_input_direction():
		finished.emit(CROUCH_WALK)
	elif player.attack():
		finished.emit(CROUCH_UP, {"attack" = true})
