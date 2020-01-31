extends HBoxContainer

export var text: String = ""
export var time_to_live: float = 3
export var image: Texture

func _ready():
	$Label.text = text
	$TextureRect.texture = image
	$Timer.wait_time = time_to_live
	$Timer.start()

func _on_Timer_timeout():
	queue_free()
