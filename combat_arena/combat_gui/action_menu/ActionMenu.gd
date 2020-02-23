extends HBoxContainer

class_name ActionMenu


signal selected_action


const ActionItem = preload("res://combat_arena/combat_gui/action_menu/ActionItem.tscn")

onready var main = $Main
onready var sub = $Sub

var battler: Battler


func show():
	visible = true
	main.initialize()
	sub.visible = false


func _on_Main_selected(action):
	match action:
		"skill":
			show_skill_menu()
		"item":
			print("alsdkfsd")
		"run":
			print("sdfsdf")


func show_skill_menu():
	var skills = []
	
	for battler_skill in battler.skills:
		var action_item = ActionItem.instance()
		action_item.label = battler_skill.display_name
		action_item.action = battler_skill.skill_name
		skills.push_back(action_item)
	
	sub.items = skills
	sub.initialize()
	sub.visible = true
	main.focused = false


func _on_Sub_cancelled():
	sub.focused = false
	sub.visible = false
	main.focused = true
