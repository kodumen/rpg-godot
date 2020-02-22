extends HBoxContainer


export var text: String


onready var indicator = $FocusIndicator
var interacted = false


func _ready():
	$Label.text = text
	highlight(false)


func _process(delta):
	if pressed() and not interacted:
		interacted = true
		print(text)
	


func _on_ActionItem_focus_entered():
	highlight(true)
	ControlManager.focus_on(self)
	interacted = false


func _on_ActionItem_focus_exited():
	highlight(false)
	interacted = false


func highlight(is_highlighted: bool):
	if is_highlighted:
		indicator.modulate.a = 1
	else:
		indicator.modulate.a = 0
		
	
func pressed() -> bool:
	return (ControlManager.is_focused(self)
		and Input.is_action_pressed("interact"))
