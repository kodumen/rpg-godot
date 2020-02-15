extends CanvasLayer

var PlayerStat = preload("res://huds/PlayerStat.tscn")

onready var playerList = $MarginContainer/VBoxContainer/PlayerList

func set_players(players: Array):
	pass
	#for player in players:
	#	var playerStat = PlayerStat.instance()
	#	playerStat.set_player(player)
	#	playerList.add_child(playerStat)

func set_turn_order(players: Array):
	pass
	#$MarginContainer/VBoxContainer/MarginContainer/PanelContainer/CurrTurn.text = "Turn: %s" % players[0].get_name()
