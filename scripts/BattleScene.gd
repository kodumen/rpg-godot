extends Node2D

func set_monsters(monsters: Array):
	$Sprite.texture = monsters[0].battleTex
	$Sprite2.texture = monsters[1].battleTex
	$Sprite3.texture = monsters[2].battleTex
