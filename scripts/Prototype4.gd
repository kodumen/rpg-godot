extends Node2D

func _ready():
	$BattleScene.set_monsters(get_tree().get_nodes_in_group('opponents'))
	$GUI.set_players(get_tree().get_nodes_in_group('players'))
	$GUI.set_turn_order($Store.get_turn_order())
