class_name PlayerState
extends State

#region states
enum PlayerStates {
	IDLE, #DONE
	WALK, #DONE
	JUMP, #DONE
	APEX, #DONE
	FALL, #DONE
	LAND, #DONE
	DASH, #DONE
	ATTACK_1, #DONE
	ATTACK_2, #TODO projeto de combo
	ATTACK_3, #TODO projeto de combo
	ATTACK_4, #TODO projeto de combo
	CROUCH, #DONE
	CROUCH_IDLE, #DONE
	CROUCH_WALK, #DONE
	CROUCH_UP, #DONE
	GRAB, #DONE
	LEDGE_GRAB, #DONE
	DRINK, #FIXME projeto de cooldown inventário e UI
	DIE, #TODO projeto de hitbox
	HURT, #TODO projeto de hitbox
	WIN, #TODO projeto de colisões
	LADDERS, #TODO projeto de colisões
	POWER_UP, #TODO projeto de cooldowns inventário e UI
	ROLL, #TODO projeto de hitbox
	SHIELD_UP, #TODO projeto de hitbox
	SHIELD, #TODO projeto de hitbox
	SHIELD_BASH, #TODO projeto de hitbox
	TALK, #TODO projeto de colisões
	WALL_SIDE, #TODO projeto de hitbox
}
#region_end

var player : Player

func _ready() -> void:
	await owner.ready
	player = owner as Player
	assert(player != null, "The PlayerState state type must be used only in the player scene. It needs the owner to be a Player node.")


func get_state_name(state : PlayerStates) -> String:
	print(PlayerStates.keys()[state])
	return PlayerStates.keys()[state]
