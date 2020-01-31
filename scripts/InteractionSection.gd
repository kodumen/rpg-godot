extends CenterContainer

var label: Label
var texture: TextureRect

func _ready():
	label = $HBoxContainer/Label
	texture = $HBoxContainer/TextureRect
	
func show_interaction(message: String, image: Texture):
	label.text = message
	texture.texture = image
	visible = true

func reset_interaction():
	visible = false
