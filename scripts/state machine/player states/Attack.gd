extends PlayerState

var can_attack : bool = false

func enter(previous_state_path : String, data := {}) -> void:
	can_attack = false
	player.play_animation(ATTACK_1)


func handle_input(event: InputEvent) -> void:
	if event.is_action_pressed("attack") and can_attack:
		#TODO combo string!! see doc for link
		pass


func physics_update(delta: float) -> void:
	player.velocity.x = 0
	player.velocity.y += player.gravity * delta
	player.move_and_slide()

	await player.animation_player.animation_finished
	finished.emit(IDLE)


func on_can_attack():
	can_attack = true 
