extends Node2D

class_name EnemyFormation


func initialize(enemies: Array):
	var positions = get_children()
	for x in positions.size():
		positions[x].add_child(enemies[x])
