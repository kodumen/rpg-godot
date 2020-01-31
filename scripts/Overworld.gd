extends Node2D

func _ready():
	$GUI.listen_to($Items)
	$Player.listen_to($Items)
	pass
