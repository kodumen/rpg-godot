extends Node2D


func _ready():
# warning-ignore:return_value_discarded
	BattleManager.connect("started", self, "populate")


func populate():
	var enemy_positions = get_children()
	for i in BattleManager.enemies.size():
		var sprite = Sprite.new()
		sprite.texture = BattleManager.enemies[i].battle_texture
		enemy_positions[i].add_child(sprite)
