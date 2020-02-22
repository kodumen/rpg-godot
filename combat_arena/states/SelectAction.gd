extends Node


func handle(gui: CombatGui, turn_queue: TurnQueue):
	var battler = turn_queue.get_current()
	gui.show_actions(battler)
