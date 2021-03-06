extends PanelContainer


onready var label = $VBoxContainer/Text
onready var tween = $Tween
onready var next_indicator = $VBoxContainer/NextIndicator
var ignore_input = true


func _ready():
	visible = false
# warning-ignore:return_value_discarded
	Messenger.connect("said", self, "display")

	
func display(text: String):
	if not ControlManager.is_focused(self):
		ControlManager.focus_on(self)
	visible = true
	_set_text(text)
	hide_indicator()


func _on_Tween_tween_all_completed():
	show_indicator()
	ignore_input = false
	
	
# warning-ignore:unused_argument
func _process(delta):
	if _pressed_next():
		ignore_input = true
		visible = false
		tween.stop_all()
		Messenger.next()

		
func _pressed_next():
	return (ControlManager.is_focused(self)
		and Input.is_action_pressed("interact")
		and not ignore_input)

		
func _set_text(text: String):
	label.text = text
	label.percent_visible = 0
	tween.interpolate_property(
		label, "percent_visible", 
		label.percent_visible, 1, 1)
	if not tween.is_active:
		tween.start()

func show_indicator():
	next_indicator.modulate.a = 1
	
func hide_indicator():
	next_indicator.modulate.a = 0
