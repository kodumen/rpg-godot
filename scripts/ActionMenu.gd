extends PanelContainer

func _ready():
	BattleManager.connect("started", self, "focus")
	

func focus():
	var items = $VBoxContainer
	if items.get_children().empty():
		return
	
	items.get_children()[0].grab_focus()
