extends PanelContainer


var player setget set_player


func set_player(new_player: Node):
	$VBoxContainer/Name.text = new_player.get_name()
	$VBoxContainer/HP/Value.text = "%d/%d" % [
		new_player.stats.max_hp,
		new_player.stats.max_hp
		]
