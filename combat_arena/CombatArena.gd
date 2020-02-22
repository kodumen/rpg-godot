extends Node2D

class_name CombatArena


const Battler = preload("res://combat_arena/battlers/Battler.tscn")


export var background: Texture setget set_background

onready var gui = $GUI
onready var enemy_formation = $EnemyFormation
onready var turn_queue = $TurnQueue
onready var begin_turn = $BeginTurn
onready var select_action = $SelectAction

var players: Array setget set_players
var enemies: Array setget set_enemies
# A node that must have a handle() method.
# First parameter is a CombatArena.
var before_turn: Node


func set_background(texture: Texture):
	$Background.texture = texture
	
	
func set_players(player_nodes: Array):
	for player in player_nodes:
		var battler = Battler.instance()
		battler.initialize(player)
		players.push_back(battler)
	gui.initialize_player_components(players)
	

func set_enemies(enemy_nodes: Array):
	for enemy in enemy_nodes:
		var battler = Battler.instance()
		battler.initialize(enemy)
		enemies.push_back(battler)
	enemy_formation.initialize(enemies)
	
	
# Start the combat loop.
func start():
	turn_queue.initialize(players + enemies)
	
	var states = [
		before_turn,
		begin_turn,
		select_action,
	]
	
	for state in states:
		var func_state = state.handle(gui, turn_queue)
		if func_state is GDScriptFunctionState:
			yield(func_state, "completed")
			
	print("end")
