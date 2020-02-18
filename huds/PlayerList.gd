extends HBoxContainer


const PlayerStat = preload("res://huds/PlayerStat.tscn")


func _ready():
# warning-ignore:return_value_discarded
	BattleManager.connect("started", self, "populate")
	

func populate():
	for player in BattleManager.players:
		var player_stat = PlayerStat.instance()
		player_stat.player = player
		
		add_child(player_stat)
