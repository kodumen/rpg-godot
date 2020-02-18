extends Node


const Player = preload("res://characters/Player.tscn")
const Stats = preload("res://scripts/stats.gd")


func _ready():
	var p1 = Player.instance()
	p1.name = "p1"
	p1.stats = Stats.new()
	p1.stats.max_hp = 100
	p1.stats.spd = 8
	p1.stats.atk = 8
	p1.stats.def = 4
	
	var p2 = Player.instance()
	p2.name = "p2"
	p2.stats = Stats.new()
	p2.stats.max_hp = 100
	p2.stats.spd = 9
	p2.stats.atk = 6
	p2.stats.def = 5
	
	add_child(p1)
	add_child(p2)
	

func get(name: String) -> Node:
	return get_node(name)
