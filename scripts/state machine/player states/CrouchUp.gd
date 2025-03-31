extends PlayerState

var attack : bool
var drink : bool

func enter(previous_state_path : String, data := {}) -> void:
	if %CeilingCheck.is_colliding():
		finished.emit(previous_state_path)
		return
	player.play_animation(CROUCH_UP)
	attack = Optional.or_else(data.get("attack"), false)
	drink = Optional.or_else(data.get("drink"), false)


func physics_update(delta: float) -> void:
	player.velocity.x = lerp(player.velocity.x, 0.0, player.crouch_friction * delta)
	player.velocity.y += player.gravity * delta
	player.move_and_slide()

	if not player.is_on_floor():
		finished.emit(APEX)
		return
	await  player.animation_player.animation_finished
	if attack:
		finished.emit(ATTACK_1)
		return
	if drink:
		finished.emit(DRINK)
		return
	finished.emit(IDLE)
