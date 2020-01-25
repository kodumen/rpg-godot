extends Node2D

func _on_Stick_body_entered(body):
	if (body.get_name() == 'Player'):
		$GUI.show()


func _on_Stick_body_exited(body):
	if (body.get_name() == 'Player'):
		$GUI.hide()
