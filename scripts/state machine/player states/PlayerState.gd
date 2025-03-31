class_name PlayerState
extends State

#region states
static var IDLE = 'Idle' #DONE
static var WALK = 'Walk' #DONE
static var JUMP = 'Jump' #DONE
static var APEX = 'Apex' #DONE
static var FALL = 'Fall' #DONE
static var LAND = 'Land' #DONE
static var DASH = 'Dash' #DONE
static var ATTACK_1 = 'Attack1' #DONE
static var ATTACK_2 = 'Attack2' #TODO projeto de combo
static var ATTACK_3 = 'Attack3' #TODO projeto de combo
static var ATTACK_4 = 'Attack4' #TODO projeto de combo
static var CROUCH = 'Crouch' #DONE
static var CROUCH_IDLE = 'CrouchIdle' #DONE
static var CROUCH_WALK = 'CrouchWalk' #DONE
static var CROUCH_UP = 'CrouchUp' #DONE
static var GRAB = 'Grab' #PENDENT
static var LEDGE_GRAB = 'LedgeGrab' #PENDENT
static var DRINK = 'Drink' #FIXME projeto de cooldown inventário e UI
static var DIE = 'Die' #TODO projeto de hitbox
static var HURT = 'Hurt' #TODO projeto de hitbox
static var WIN = 'Win' #TODO projeto de colisões
static var LADDERS = 'Ladders' #TODO projeto de colisões
static var POWER_UP = 'PowerUp' #TODO projeto de cooldowns inventário e UI
static var ROLL = 'Roll' #TODO projeto de hitbox
static var SHIELD_UP = 'ShieldUp' #TODO projeto de hitbox
static var SHIELD = 'Shield' #TODO projeto de hitbox
static var SHIELD_BASH = 'ShieldBash' #TODO projeto de hitbox
static var TALK = 'Talk' #TODO projeto de colisões
static var WALL_SIDE = 'WallSide' #TODO projeto de hitbox
#region_end

var player: Player

func _ready() -> void:
	await owner.ready
	player = owner as Player
	assert(player != null, "The PlayerState state type must be used only in the player scene. It needs the owner to be a Player node.")
