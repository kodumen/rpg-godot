extends Node


signal said


var _queue: Array = []


func say(message: String):
	emit_signal("said", message)


func queue(messages: Array):
	_queue = messages
	next()


func next():
	var message = _queue.pop_front()
	if message is String:
		say(message)
