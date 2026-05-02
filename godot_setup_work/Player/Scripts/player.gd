extends CharacterBody2D

var cardinal_direction: Vector2 = Vector2.DOWN
var direction : Vector2= Vector2.ZERO
var state: String = "idle"
var speed: float = 100.0

@onready var animation_player: AnimatedSprite2D = $AnimatedSprite2D



func _process(delta: float) -> void:
	direction.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	direction.y = Input.get_action_strength("down") - Input.get_action_strength("up")
	
	velocity = direction * speed
	if SetState() == true || SetDirection() == true:
		UpdateAnimation()
	
func _physics_process(delta):
	move_and_slide()

func SetDirection() -> bool : 
	var new_dir : Vector2 = cardinal_direction
	if direction == Vector2.ZERO:
		return false
	
	if direction.y == 0:
		new_dir = Vector2.LEFT if direction.x < 0 else Vector2.RIGHT
	elif direction.x == 0:
		new_dir = Vector2.UP if direction.y < 0 else Vector2.DOWN
		
	if new_dir == cardinal_direction:
		return false
	else:
		cardinal_direction = new_dir
		animation_player.scale.x = -1 if cardinal_direction == Vector2.LEFT else 1
		return true
	
	
func SetState()-> bool:
	var new_state: String = "idle" if direction == Vector2.ZERO else "walk"
	if new_state == state:
		return false
	else: 
		state = new_state
		return true 
	
func UpdateAnimation():
	animation_player.play( state + "_" + AnimDirection() )
	
func AnimDirection(): 
	if cardinal_direction == Vector2.DOWN:
		return "down"
	elif cardinal_direction == Vector2.UP:
		return "up"
	else:
		return "side"
