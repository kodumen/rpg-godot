extends Node

class_name LearnedSkill


export var skill: Resource

var skill_name: String setget , get_skill_name
var display_name: String setget , get_display_name


func get_skill_name():
	return skill.skill_name
	
	
func get_display_name():
	return skill.display_name
