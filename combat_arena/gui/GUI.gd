extends CanvasLayer

class_name GUI


signal closed_textbox


const PlayerPanel = preload("res://combat_arena/gui/player_panel/PlayerPanel.tscn")

onready var text_box = $MarginContainer/TextBox
onready var player_panels = $MarginContainer2/VBoxContainer/PlayerPanels


func initialize_player_components(players: Array):
	for player in players:
		var panel = PlayerPanel.instance()
		player_panels.add_child(panel)
		panel.player = player


func show_text(message: String):
	text_box.display(message)
	

func show_player_panels():
	player_panels.visible = true


func _on_TextBox_closed():
	emit_signal("closed_textbox")
