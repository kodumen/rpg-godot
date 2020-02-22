extends Node


func handle(gui: CombatGui, turn_queue: TurnQueue):
	turn_queue.next()
	var battler = turn_queue.get_current()
	gui.show_turn_panel(battler)
	gui.show_player_panels()
	# TODO: Apply stats adjustments
