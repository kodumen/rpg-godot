extends Node


signal said
signal queue_ended


var _queue: Array = []
var _on_queue_end: FuncRef


func say(message: String):
	emit_signal("said", message)


func queue(messages: Array, on_queue_end = null):
	_queue = messages
	_on_queue_end = on_queue_end
	next()


func next():
	var message = _queue.pop_front()
	if message is String:
		say(message)
	else:
		if _on_queue_end != null:
			_on_queue_end.call_func()
		emit_signal("queue_ended")
