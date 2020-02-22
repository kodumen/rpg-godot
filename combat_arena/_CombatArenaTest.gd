extends Node2D

class_name _CombatArenaTest


onready var combat_arena = $CombatArena


func _ready():
	combat_arena.players = $Party.get_children()
	combat_arena.enemies = $Enemies.get_children()
	combat_arena.before_turn = $BeforeTurn
	combat_arena.start()
