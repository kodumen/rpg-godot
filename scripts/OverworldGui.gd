extends CanvasLayer

func _ready():
	$ActionSection.visible = false
	
func on_player_entered(item, player):
	$ActionSection.visible = true
	
func on_player_exited(item, player):
	$ActionSection.visible = false
	
func listenTo(node):
	for item in node.get_children():
		item.connect("player_entered", self, "on_player_entered")
		item.connect("player_exited", self, "on_player_exited")