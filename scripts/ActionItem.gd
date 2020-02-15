extends HBoxContainer

export var text: String

func _ready():
	$Label.text = text
	$FocusIndicator.modulate = Color(1, 1, 1, 0)


func _on_ActionItem_focus_entered():
	$FocusIndicator.modulate = Color(1, 1, 1, 1)


func _on_ActionItem_focus_exited():
	$FocusIndicator.modulate = Color(1, 1, 1, 0)
