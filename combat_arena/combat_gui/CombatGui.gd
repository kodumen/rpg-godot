extends CanvasLayer

class_name CombatGui


signal closed_textbox
signal selected_action


const PlayerPanel = preload("res://combat_arena/combat_gui/player_panel/PlayerPanel.tscn")

onready var text_box = $MarginContainer/TextBox
onready var player_panels = $MarginContainer2/VBoxContainer/PlayerPanels
onready var turn_panel = $MarginContainer2/VBoxContainer/TurnPanel
onready var action_menu = $MarginContainer2/VBoxContainer/ActionMenu


func initialize_player_components(players: Array):
	action_menu.players = players
	for player in players:
		var panel = PlayerPanel.instance()
		player_panels.add_child(panel)
		panel.player = player
	

func initialize_enemy_components(enemies: Array):
	action_menu.enemies = enemies


func show_text(message: String):
	text_box.display(message)
	turn_panel.visible = false
	player_panels.visible = false
	action_menu.hide()
	

func show_player_panels():
	player_panels.visible = true


func show_turn_panel(battler: Battler = null):
	if battler != null:
		turn_panel.battler = battler
	turn_panel.visible = true


func show_actions(battler: Battler = null):
	if battler != null:
		action_menu.battler = battler
	action_menu.show()


func _on_TextBox_closed():
	emit_signal("closed_textbox")


func _on_ActionMenu_selected_action(action):
	emit_signal("selected_action", action)
