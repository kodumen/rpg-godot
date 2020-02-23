extends Node

class_name TurnQueue


var queue: Array = []
var curr_index: int = -1


func initialize(battlers: Array):
	battlers.sort_custom(self, "sort_by_spd")
	queue = battlers


func sort_by_spd(a: Node, b: Node):
	return a.spd >= b.spd


func next():
	if curr_index < queue.size():
		curr_index += 1
	else:
		curr_index = 0
		
		
func get_current() -> Battler:
	return queue[curr_index]
	
	
func get_battlers(battler_names: Array) -> Array:
	var battlers = []
	for battler in queue:
		if battler_names.has(battler.get_name()):
			battlers.push_back(battler)
	return battlers
