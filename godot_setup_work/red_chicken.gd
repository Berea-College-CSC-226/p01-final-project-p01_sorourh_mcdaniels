extends CharacterBody2D

@onready var red_chicken: AnimatedSprite2D =  $RedChicken
@export var target: Player

var cardinal_direction: Vector2 = Vector2.DOWN
var direction : Vector2= Vector2.ZERO
var state: String = "idle"

var speed: float = 100.0


func _calculate_velocity():
	var distanceToTarget = 3
	var targetPosition = target.position - Vector2(0,0)
	
	if position.distance_to(targetPosition) > distanceToTarget:
		var direction = (targetPosition - position).normalized()
		velocity = direction * speed 
	elif position.y - targetPosition.y < -1 || position.y - targetPosition.y > 1:
		velocity.x = 0
	elif position.x - targetPosition.y < -1 || position.x - targetPosition.y > 1:
		velocity.y = 0
	else:
		velocity = Vector2.ZERO
	

func _process(delta: float) -> void:
	direction.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	direction.y = Input.get_action_strength("down") - Input.get_action_strength("up")
	
	velocity = direction * speed
	if SetState() == true || SetDirection() == true:
		UpdateAnimation()

func _physics_process(delta: float) -> void:
	_calculate_velocity()
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
		red_chicken.scale.x = 1 if cardinal_direction == Vector2.LEFT else -1
		return true
	
	
func SetState()-> bool:
	var new_state: String = "idle" if direction == Vector2.ZERO else "walk"
	if new_state == state:
		return false
	else: 
		state = new_state
		return true 
	
func UpdateAnimation():
	red_chicken.play( state + "_" + AnimDirection() )
	
func AnimDirection(): 
	if cardinal_direction == Vector2.DOWN:
		return "down"
	elif cardinal_direction == Vector2.UP:
		return "up"
	else:
		return "side"
