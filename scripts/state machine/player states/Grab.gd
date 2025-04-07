extends PlayerState

func enter(previous_state_path : String, data := {}) -> void:
	player.play_animation(PlayerStates.GRAB)


func handle_input(event: InputEvent) -> void:
	if event.is_action_pressed("move_up") or event.is_action_pressed("jump"):
		finished.emit(get_state_name(PlayerStates.LEDGE_GRAB).to_pascal_case())
	if event.is_action_pressed("move_down") or event.is_action_pressed("crouch"):
		player.ledge_collision.disabled = true
		player.position.y += 10
		finished.emit(get_state_name(PlayerStates.APEX).to_pascal_case())


func physics_update(delta: float) -> void:
	player.velocity.x = 0.0
	player.velocity.y += player.gravity * delta
	
	player.sprite.flip_h = %WallCheck.get_collision_normal(0).x != -1
	
	
	player.move_and_slide()
