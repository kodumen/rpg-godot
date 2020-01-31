extends MarginContainer

export var max_messages: int = 3

var container: VBoxContainer
var Notification = preload("res://huds/Notification.tscn")

func _ready():
	container = $VBoxContainer

func push(message: String, image: Texture):
	var notification = _make_notification(message, image)
	
	container.add_child(notification)
	container.move_child(notification, 0)
	
	var curr_count = container.get_child_count()
	if curr_count > max_messages:
		container.get_child(curr_count - 1).queue_free()

func _make_notification(message: String, image: Texture):
	var notification = Notification.instance()
	notification.text = message
	notification.image = image
	return notification
