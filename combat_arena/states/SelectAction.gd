extends Node


func handle(gui: CombatGui, turn_queue: TurnQueue):
	var battler = turn_queue.get_current()
	
	gui.show_actions(battler)
	var selected_action = yield(gui, "selected_action")
	
	if selected_action.action == "run":
		gui.show_text("Got away safely!")
