extends PanelContainer


onready var label = $VBoxContainer/Text
onready var tween = $Tween
onready var next_indicator = $VBoxContainer/NextIndicator
var ignore_input = true


signal closed


func _process(delta):
	if interacted():
		clear()
		emit_signal("closed")


func display(message: String):
	visible = true
	ignore_input = true
	hide_indicator()
	label.text = message
	label.percent_visible = 0
	tween.interpolate_property(
		label, "percent_visible", 
		label.percent_visible, 1, 
		1)
	tween.start()


func clear():
	hide_indicator()
	ignore_input = true
	label.text = ""
	visible = false
	

func show_indicator():
	next_indicator.modulate.a = 1
	
	
func hide_indicator():
	next_indicator.modulate.a = 0


func _on_Tween_tween_all_completed():
	show_indicator()
	tween.remove_all()
	ignore_input = false


func interacted():
	return not ignore_input and Input.is_action_pressed("interact")
