extends PlayerState

func enter(previous_state_path : String, data := {}) -> void:
	player.play_animation(IDLE)


func handle_input(event: InputEvent) -> void:
	if event.is_action_pressed("crouch"):
		finished.emit(CROUCH)
	if event.is_action_pressed("drink"):
		finished.emit(DRINK)


func physics_update(delta: float) -> void:
	player.velocity.x = lerp(player.velocity.x, 0.0, player.friction * delta)
	player.velocity.y += player.gravity * delta
	player.move_and_slide()

	if not player.is_on_floor():
		finished.emit(APEX)
	elif player.jump():
		finished.emit(JUMP)
	elif player.get_input_direction():
		finished.emit(WALK)
	elif player.attack():
		finished.emit(ATTACK_1)
	elif player.grab():
		finished.emit(GRAB)
