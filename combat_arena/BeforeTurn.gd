extends Node


func handle(combat_arena: CombatArena):
	combat_arena.show_text("A monster appeared!")
	yield(combat_arena, "closed_textbox")
	combat_arena.show_text("Please defeat it!")
	yield(combat_arena, "closed_textbox")
