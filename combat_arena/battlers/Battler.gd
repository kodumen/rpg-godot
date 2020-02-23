extends Node2D

class_name Battler


var stats: Node
var skills: Array
var max_hp: int setget , get_max_hp
var curr_hp: int setget , get_curr_hp
var spd: int setget , get_spd


func initialize(node: Node):
	name = node.get_name()
	stats = node.get_node("Stats")
	initialize_skills(node)
	initialize_sprite(node)
	

func initialize_sprite(node: Node):
	if not node.has_node("Sprite"):
		return
	var sprite_node = node.get_node("Sprite")
	$Sprite.texture = sprite_node.texture


func initialize_skills(node: Node):
	if not node.has_node("Skills"):
		return
	skills = node.get_node("Skills").get_children()


func get_max_hp() -> int:
	return stats.max_hp
	
	
func get_spd() -> int:
	return stats.spd


func get_curr_hp() -> int:
	return stats.curr_hp
	
	
func get_skill(skill_name: String) -> LearnedSkill:
	for skill in skills:
		if skill.skill_name == skill_name:
			return skill
	return null
