extends Node


func handle(gui: CombatGui, turn_queue: TurnQueue):
	gui.show_text("A monster appeared!")
	yield(gui, "closed_textbox")
