extends Node2D

class_name CombatArena


signal closed_textbox


const Battler = preload("res://combat_arena/battlers/Battler.tscn")


export var background: Texture setget set_background

onready var gui = $GUI
onready var begin_turn = $BeginTurn
onready var enemy_formation = $EnemyFormation

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
	var states = [
		before_turn,
		begin_turn,
	]
	
	for state in states:
		var func_state = state.handle(self)
		if func_state is GDScriptFunctionState:
			yield(func_state, "completed")
			
	print("end")
	
	
func show_text(message: String):
	gui.show_text(message)
	

func show_player_panels():
	gui.show_player_panels()


func _on_GUI_closed_textbox():
	emit_signal("closed_textbox")
