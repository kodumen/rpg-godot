extends Control

onready var textBox = $TextBox


func _ready():
	Messenger.queue([
		"Adventure Time!",
		"Come on grab your friends",
		"We're going to very distant lands",
		"Jake the dog",
		"and Finn the Human",
		"The fun never ends",
		"It's Adventure Time!",
	])
