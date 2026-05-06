extends CharacterBody2D
## A class node that encapsulates the animal sprites and creates a party animation
##

# the two states the animal is going to be in, either idle before getting picked up or following the player
enum State { IDLE, FOLLOWING }

@export var follow_speed: float = 97.0 # the speed by which the animal is following
@export var follow_distance: float = 20.0 # the distance between the animals

var state: State = State.IDLE # starting state
var follow_target: Node2D = null # the node the animal is chansing, it is either the player if it is the first animal or another animal 
var cardinal_direction: Vector2 = Vector2.DOWN # direction animal is facing

#setup the nodes and the collision 
@onready var anim: AnimatedSprite2D = $Animal
@onready var detection_area: Area2D = $Area2D

func _ready() -> void:
	## detecting the area to pass through and play idle animation before the player pickes them up 
	detection_area.body_entered.connect(_on_body_entered)
	anim.play("idle_side")

## the physics layer that updates ever
func _physics_process(_delta: float) -> void:
	## if animal isn't following anything and is in IDLE state
	if state != State.FOLLOWING or follow_target == null:
		return
	
	## global_positoin is used because it is a child of a node. 
	var distance := global_position.distance_to(follow_target.global_position)

	## move towards target, otherwise stop and stay idle
	if distance > follow_distance:
		var dir := global_position.direction_to(follow_target.global_position)
		velocity = dir * follow_speed  # calculates the velocity of the animal using the direction and the follow_speed
		_update_cardinal(dir)
		_play_anim("walk")
	else:
		velocity = Vector2.ZERO
		_play_anim("idle")

	move_and_slide()

## 
func start_following(target: Node2D) -> void:
	## called by the player node to join the party
	follow_target = target
	state = State.FOLLOWING

	## determienes which direction (up,down,left,right) the animal is moving towards
func _update_cardinal(dir: Vector2) -> void:
	var new_dir: Vector2 = cardinal_direction

	if abs(dir.x) > abs(dir.y):
		new_dir = Vector2.LEFT if dir.x < 0 else Vector2.RIGHT
	else:
		new_dir = Vector2.UP if dir.y < 0 else Vector2.DOWN

	## only update when the animal actually changes direction
	if new_dir != cardinal_direction:
		cardinal_direction = new_dir
		# Mirrors right and left opposite the player
		anim.scale.x = 1 if cardinal_direction == Vector2.LEFT else -1

	## return the animal direction
func _anim_direction() -> String:
	## to get the direction used to call the proper animation 
	if cardinal_direction == Vector2.DOWN:
		return "down"
	elif cardinal_direction == Vector2.UP:
		return "up"
	else:
		return "side"

	## get the animations of the player and play it
func _play_anim(new_state: String) -> void:
	var anim_name := new_state + "_" + _anim_direction() ## build the animation name as it is saved in the AnimationSprite2D 
	
	if anim.animation != anim_name: ## play it only if it changes
		anim.play(anim_name)

	## adding the animal to the party whenever the player touches the animal
func _on_body_entered(body: Node) -> void: # body is whatever object enters the Area2D
	if state == State.IDLE and body.is_in_group("player"): # makes sure that the only animals that can join the party are new ones and ignores anything that isn't the player
		body.add_to_party(self) # passing the current animal, to the r
