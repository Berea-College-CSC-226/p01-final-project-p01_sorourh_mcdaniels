extends CharacterBody2D
## A class to store the animation and the logic of the player character
## it has the array the stores the party 
## 


## creating 2D vectors to store the direction
var cardinal_direction: Vector2 = Vector2.DOWN
var direction : Vector2= Vector2.ZERO


var state: String = "idle" # the starting state of the player
var speed: float = 100.0  # speed of the player

## the array that stors the different animals in your party
var party: Array[Node2D] = []

## loads the AnimatedSprite2D that stores the sprtie texture and animation.
@onready var animation_player: AnimatedSprite2D = $Player


func _process(_delta: float) -> void:
	## get the x and y coordinate of the player 
	direction.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	direction.y = Input.get_action_strength("down") - Input.get_action_strength("up")
	
	# getting the velocity of the player 
	velocity = direction * speed
	
	# only update if there is any change in the direction
	if SetState() == true || SetDirection() == true:
		UpdateAnimation()

	# If all 10 animals are collected, load the winning scene
	if len(party) == 10:
		get_tree().change_scene_to_file("res://WinMenu/WinMenu.tscn")

	# creates the movement of the player and handle collisions
func _physics_process(_delta):
	move_and_slide()

	## checks if the cardinal direction changes based on the input 
	## returns truw if there is a change in direction, otherwise, returns false
func SetDirection() -> bool : 
	var new_dir : Vector2 = cardinal_direction
	
	# if no movement then no updates
	if direction == Vector2.ZERO:
		return false
	
	# update the new_dir based on which input is active
	if direction.y == 0:
		new_dir = Vector2.LEFT if direction.x < 0 else Vector2.RIGHT
	elif direction.x == 0:
		new_dir = Vector2.UP if direction.y < 0 else Vector2.DOWN
	
		# direction didn't change so skip
	if new_dir == cardinal_direction:
		return false
	else:
		cardinal_direction = new_dir
		animation_player.scale.x = -1 if cardinal_direction == Vector2.LEFT else 1 # mirror the animation from right to left
		return true
	
	## checks whether the state has chanhed or not
	## returns truw if there is a change in state, otherwise, returns false
func SetState()-> bool:
	var new_state: String = "idle" if direction == Vector2.ZERO else "walk"
	# if no change then skip updating
	if new_state == state:
		return false
	else: 
		state = new_state
		return true 
	
	## get the animation scene name necessary based on the state and direction 
func UpdateAnimation():
	animation_player.play( state + "_" + AnimDirection() )

	## returns the direction of the player to help load the correct animation scene
func AnimDirection(): 
	if cardinal_direction == Vector2.DOWN:
		return "down"
	elif cardinal_direction == Vector2.UP:
		return "up"
	else:
		return "side"

	## when the player hits the Area2D of an animal, add to party.
	## First animal added to the party array follows the player, otherwise, the new animal follows the animal that joined right before it.
func add_to_party(animal: Node2D) -> void:
	# no animal gets added twice
	if animal in party:
		return
	if party.is_empty():
		animal.start_following(self) # first animal follows player
	else:
		animal.start_following(party.back()) # each subsequesnt animal follows the animal that joined before it
	party.append(animal)
