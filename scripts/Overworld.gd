extends Node2D

func _ready():
	$GUI.listen_to($Items)
	$Player.listen_to($Items)
	pass

func begin_battle(player, monster):
	get_tree().change_scene("res://maps/Battle.tscn")



func _on_Monster_body_entered(body):
	if body != $Player:
		return
	begin_battle($Player, $Monster)
