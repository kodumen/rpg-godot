extends PanelContainer


class_name TurnPanel

onready var value = $Value

var battler: Battler setget set_battler


func set_battler(new_battler: Battler):
	value.text = "Turn: %s" % new_battler.get_name()
