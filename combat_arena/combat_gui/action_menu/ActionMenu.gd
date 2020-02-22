extends PanelContainer

class_name ActionMenu


onready var timer: Timer = $Timer

var battler: Battler
var accept_input = false
var items: Array
var curr_item: int = 0 setget set_curr_item


func _ready():
	items = $VBoxContainer.get_children()


func _process(delta):
	if pressed_up():
		self.curr_item -= 1
	if pressed_down():
		self.curr_item += 1
	
	if just_released():
		accept_input = true
		timer.stop()


func show():
	visible = true
	self.curr_item = 0
	accept_input = true


func set_curr_item(new_curr_item: int):
	items[curr_item].unfocus()
	
	if new_curr_item < 0:
		curr_item = items.size() - 1
	elif new_curr_item >= items.size():
		curr_item = 0
	else:
		curr_item = new_curr_item
	
	items[curr_item].focus()
	accept_input = false
	timer.start()


func pressed_up() -> bool:
	return accept_input and Input.is_action_pressed("up")


func pressed_down() -> bool:
	return accept_input and Input.is_action_pressed("down")


func just_released() -> bool:
	return not accept_input and (
		Input.is_action_just_released("up")
		or Input.is_action_just_released("down")
	)


func _on_Timer_timeout():
	accept_input = true
