extends PanelContainer

class_name PlayerPanel


onready var player_name = $VBoxContainer/PlayerName
onready var hp_value = $VBoxContainer/HP/Value

var player: Battler setget set_player


func set_player(battler: Battler):
	player = battler
	player_name.text = player.get_name()
	hp_value.text = "%d/%d" % [player.curr_hp, player.max_hp]
