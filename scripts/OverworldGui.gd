extends CanvasLayer

func _ready():
	hide()
	
func show():
	$ActionSection.visible = true
	
func hide():
	$ActionSection.visible = false