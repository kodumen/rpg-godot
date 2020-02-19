extends PanelContainer


func _ready():
# warning-ignore:return_value_discarded
	BattleManager.connect("started", self, "update_text")


func update_text():
	var curr = BattleManager.get_curr_turn()
	
	if not curr == null:
		$Label.text = "Turn: %s" % curr.get_name()
