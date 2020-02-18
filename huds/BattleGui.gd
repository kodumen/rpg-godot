extends MarginContainer


func _ready():
	Messenger.connect("said", self, "hide")
	Messenger.connect("queue_ended", self, "show")


func hide():
	visible = false

	
func show():
	visible = true
