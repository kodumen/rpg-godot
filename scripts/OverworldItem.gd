extends Area2D

signal player_entered
signal player_exited

func _on_OverworldItem_body_entered(body):
	if body.get_name() == 'Player':
		emit_signal("player_entered", self, body)
		

func _on_OverworldItem_body_exited(body):
	if body.get_name() == 'Player':
		emit_signal("player_exited", self, body)
