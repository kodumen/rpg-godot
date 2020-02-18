extends Node


signal setup_finished
signal started


var players: Array = []
var enemies: Array = []


func add_player(player: Node):
	players.push_back(player)
	
	
func add_enemy(enemy: Node):
	enemies.push_back(enemy)


func setup_finished():
	emit_signal("setup_finished")


func start():
	emit_signal("started")
