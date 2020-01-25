extends Node2D

var item;

func _ready():
	$GUI.listenTo($Items)
