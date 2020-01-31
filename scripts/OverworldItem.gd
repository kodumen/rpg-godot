extends Area2D

signal player_entered
signal player_exited
signal player_interacted

export var item: Resource

func _ready():
	if item:
		$Sprite.texture = item.image

func _on_OverworldItem_body_entered(body):
	if body.get_name() == 'Player':
		emit_signal("player_entered", self, body)
		

func _on_OverworldItem_body_exited(body):
	if body.get_name() == 'Player':
		emit_signal("player_exited", self, body)

func interact(player):
	emit_signal("player_interacted", self, player)
	queue_free()
	
func get_item_name():
	return item.name
	
func get_item_image():
	return item.image
	
func get_item_interaction():
	return item.interaction_message
