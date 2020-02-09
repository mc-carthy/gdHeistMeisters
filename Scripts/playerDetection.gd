extends "res://Scripts/character.gd"

const FOV_TOLERANCE = 22.5
const RED = Color(0.75, 0, 0)
const WHITE = Color(1, 1, 1)
const GREEN = Color(0, 0.75, 0)


onready var Player = get_node("/root/level1/player")

func _process(delta):
	if Player_is_in_FOV_TOLERANCE():
		$Torch.color = RED
	else:
		$Torch.color = WHITE

func Player_is_in_FOV_TOLERANCE():
	var npc_facing_direction = Vector2(1, 0).rotated(global_rotation)
	var direction_to_player = (Player.position - global_position).normalized()
	if abs(direction_to_player.angle_to(npc_facing_direction)) < deg2rad(FOV_TOLERANCE):
		return true
	else:
		return false