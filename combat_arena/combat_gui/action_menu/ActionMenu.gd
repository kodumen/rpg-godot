extends HBoxContainer

class_name ActionMenu


signal selected_action(action)


const ActionItem = preload("res://combat_arena/combat_gui/action_menu/ActionItem.tscn")

onready var main = $Main
onready var sub = $Sub
onready var target = $Target
onready var selected_action = $SelectedAction

var battler: Battler
var players: Array
var enemies: Array


func show():
	visible = true
	main.initialize()
	selected_action.initialize()
	sub.visible = false
	target.visible = false
	
func hide():
	visible = false
	main.focused = false
	sub.focused = false
	target.focused = false


func _on_Main_selected(action):
	if action == "skill":
		show_skill_menu()
	else:
		selected_action.action = action
		emit_signal("selected_action", selected_action)


func _on_Sub_cancelled():
	sub.focused = false
	sub.visible = false
	main.focused = true


func _on_Sub_selected(action):
	selected_action.action = action
	show_target_menu(action)


func _on_Target_cancelled():
	target.focused = false
	target.visible = false
	sub.focused = true


func _on_Target_selected(target_name):
	selected_action.targets.push_back(target_name)
	emit_signal("selected_action", selected_action)


func show_skill_menu():
	var skills = []
	
	for battler_skill in battler.skills:
		var action_item = ActionItem.instance()
		action_item.label = battler_skill.display_name
		action_item.action = "skill:" + battler_skill.skill_name
		skills.push_back(action_item)
	
	sub.items = skills
	sub.initialize()
	sub.visible = true
	main.focused = false
	
	
func show_target_menu(skill_name: String):
	skill_name = skill_name.trim_prefix("skill:")
	var skill = battler.get_skill(skill_name)
	assert(skill != null)
	
	var targets = _get_targets(skill)
	targets = _battlers_to_action_items(targets)
	
	target.items = targets
	target.initialize()
	target.visible = true
	target.focused = true
	sub.focused = false

func _get_targets(skill: LearnedSkill) -> Array:
	var targets = []
	match skill.target_type:
		"self":
			targets = [battler]
		"enemies":
			targets = enemies
		"players":
			targets = players
		"all":
			targets = players + enemies
			
	return targets
	
	
func _battlers_to_action_items(battlers: Array) -> Array:
	var items = []
	for battler_obj in battlers:
		var action_item = ActionItem.instance()
		action_item.label = battler_obj.get_name()
		action_item.action = battler_obj.get_name()
		items.push_back(action_item)
	return items
