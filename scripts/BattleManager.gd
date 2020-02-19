extends Node


signal setup_finished
signal started


var players: Array = []
var enemies: Array = []
var turn_order: Array = []


func add_player(player: Node):
	players.push_back(player)
	
	
func add_enemy(enemy: Node):
	enemies.push_back(enemy)


func setup_finished():
	emit_signal("setup_finished")


func start():
	determine_turn_order()
	emit_signal("started")
	

func determine_turn_order():
	turn_order = (players + enemies)
	turn_order.sort_custom(self, "_sort_by_fastest")
	

func get_curr_turn() -> Node:
	if turn_order.empty():
		return null
	
	return turn_order[0]


func _sort_by_fastest(a, b):
	return a.stats.spd > b.stats.spd
	
	
