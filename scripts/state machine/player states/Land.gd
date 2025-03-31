extends PlayerState

func enter(previous_state_path : String, data := {}) -> void:
	player.play_animation(LAND)


func physics_update(delta: float) -> void:
	player.velocity.x = 0.0
	player.velocity.y += player.gravity * delta
	player.move_and_slide()
	
	await player.animation_player.animation_finished
	finished.emit(IDLE)
