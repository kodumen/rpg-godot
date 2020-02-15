extends PanelContainer

func set_player(player: Node):
	$VBoxContainer/Name.text = player.get_name()
	$VBoxContainer/HP/Value.text = "%d/%d" % [player.curr_hp, player.max_hp]
