extends Node

var _turn_order: Array

func _ready():
	init_turn_order()
	
func init_turn_order():
	_turn_order = get_children()
	_turn_order.sort_custom(self, "_sort_by_speed")

func get_turn_order():
	return _turn_order

func _sort_by_speed(a, b):
	return a.spd > b.spd
