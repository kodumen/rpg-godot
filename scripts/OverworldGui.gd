extends CanvasLayer

func _ready():
	$ActionSection.visible = false
	
func _on_player_entered(item, player):
	$ActionSection.show_interaction(
		item.get_item_interaction(),
		item.get_item_image()
	)
	
func _on_player_exited(item, player):
	$ActionSection.reset_interaction()

func _on_player_interacted(item, player):
	$NotificationBox.push(item.get_item_name(), item.get_item_image())
	
func listen_to(node):
	for item in node.get_children():
		item.connect("player_entered", self, "_on_player_entered")
		item.connect("player_exited", self, "_on_player_exited")
		item.connect("player_interacted", self, "_on_player_interacted")
