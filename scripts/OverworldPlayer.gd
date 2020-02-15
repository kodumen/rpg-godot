extends KinematicBody2D

export (int) var speed = 100

var velocity = Vector2()
var active_item = null

func _physics_process(delta):
	_get_input()
	velocity = move_and_slide(velocity)
	
	_interact_with_item()
	
func _get_input():
	velocity = Vector2()
	if Input.is_action_pressed('right'):
		velocity.x += 1
	if Input.is_action_pressed('left'):
		velocity.x -= 1
	if Input.is_action_pressed('up'):
		velocity.y -= 1
	if Input.is_action_pressed('down'):
		velocity.y += 1
	velocity = velocity.normalized() * speed

func listen_to(node):
	for item in node.get_children():
		item.connect("player_entered", self, "_on_entered_item")
		item.connect("player_exited", self, "_on_exited_item")

func _on_exited_item(item, player):
	active_item = null

func _on_entered_item(item, player):
	active_item = item
	
func _interact_with_item():
	if active_item and Input.is_action_pressed("interact"):
		active_item.interact(self)

func addToInventory(item: Resource):
	$Inventory.add(item)


func _on_Monster_body_entered(body):
	if body != self:
		return
	
		
		
		
