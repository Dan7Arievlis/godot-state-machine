extends PlayerState

func enter(previous_state_path : String, data := {}) -> void:
	player.play_animation(CROUCH)


func physics_update(delta: float) -> void:
	player.velocity.x = lerp(player.velocity.x, 0.0, player.crouch_friction * delta)
	player.velocity.y += player.gravity * delta
	player.move_and_slide()

	if not player.is_on_floor():
		finished.emit(APEX)
		return
	await  player.animation_player.animation_finished
	finished.emit(CROUCH_IDLE)
