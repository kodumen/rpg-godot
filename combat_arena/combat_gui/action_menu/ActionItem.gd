extends HBoxContainer

class_name ActionItem


export var label: String
export (String, MULTILINE) var action

onready var indicator: TextureRect = $Indicator


func _ready():
	$Label.text = label
	unfocus()


func focus():
	indicator.modulate.a = 1
	
	
func unfocus():
	indicator.modulate.a = 0
