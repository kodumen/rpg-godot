extends Node


signal started


var players: Array = []
var enemies: Array = []


func add_player(player: Node):
	players.push_back(player)
	
	
func add_enemy(enemy: Node):
	enemies.push_back(enemy)


func start():
	emit_signal("started")
