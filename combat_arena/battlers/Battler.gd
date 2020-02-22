extends Node2D

class_name Battler


var stats: Node
var max_hp: int setget , get_max_hp
var curr_hp: int setget , get_curr_hp


func initialize(node: Node):
	name = node.get_name()
	stats = node.get_node("Stats")
	initialize_sprite(node)
	

func initialize_sprite(node: Node):
	if not node.has_node("Sprite"):
		return
	var sprite_node = node.get_node("Sprite")
	$Sprite.texture = sprite_node.texture


func get_max_hp() -> int:
	return stats.max_hp


func get_curr_hp() -> int:
	return stats.curr_hp
