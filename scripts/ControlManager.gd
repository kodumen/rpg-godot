extends Node

var curr_node: Node = null
var prev_node: Node = null


func focus_on(node: Node):
	prev_node = curr_node
	curr_node = node


func is_focused(node: Node):
	return curr_node == node
