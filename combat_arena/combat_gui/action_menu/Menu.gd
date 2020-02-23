extends PanelContainer


signal selected(action)
signal cancelled


onready var timer: Timer = $Timer
onready var container: Node = $VBoxContainer

var focused = false
var accept_input = false
var items: Array setget set_items
var curr_item: int = 0 setget set_curr_item


func _ready():
	for child in get_children():
		if child is ActionItem:
			remove_child(child)
			container.add_child(child)
	
	items = container.get_children()


func _process(delta):
	if not focused:
		return
	
	if pressed_up():
		self.curr_item -= 1
	if pressed_down():
		self.curr_item += 1
	
	if just_released():
		accept_input = true
		timer.stop()
		
	if pressed_interact():
		emit_signal("selected", items[curr_item].action)
		
	if pressed_cancel():
		self.curr_item = 0
		emit_signal("cancelled")


func initialize():
	focused = true
	if items.size() > 0:
		self.curr_item = 0


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


func set_items(new_items: Array):
	_remove_children()
	for item in new_items:
		container.add_child(item)
	items = new_items


func _remove_children():
	for item in container.get_children():
		item.queue_free()


func pressed_up() -> bool:
	return accept_input and Input.is_action_pressed("up")


func pressed_down() -> bool:
	return accept_input and Input.is_action_pressed("down")


func just_released() -> bool:
	return not accept_input and (
		Input.is_action_just_released("up")
		or Input.is_action_just_released("down")
	)
	
	
func pressed_interact() -> bool:
	return accept_input and Input.is_action_just_pressed("interact")
	
	
func pressed_cancel() -> bool:
	return accept_input and Input.is_action_just_pressed("cancel")


func _on_Timer_timeout():
	accept_input = true
