extends Node2D


func _ready():
	BattleManager.add_player(PcManager.get("p1"))
	BattleManager.add_player(PcManager.get("p2"))
	
	BattleManager.add_enemy($Enemy1)
	
	Messenger.queue(["A monster appeared!"], funcref(self, "start_battle"))


func start_battle():
	BattleManager.start()
