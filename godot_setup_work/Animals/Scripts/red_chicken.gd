extends CharacterBody2D

enum State { IDLE, FOLLOWING }

@export var follow_speed: float = 80.0
@export var follow_distance: float = 50.0  # how close before stopping

var state: State = State.IDLE
var follow_target: Node2D = null  # player or the animal ahead in the chain

@onready var red_chicken: AnimatedSprite2D = $RedChicken
@onready var detection_area: Area2D = $Area2D


func _ready() -> void:
	detection_area.body_entered.connect(_on_body_entered)
	play_idle()


func _physics_process(delta: float) -> void:
	if state == State.FOLLOWING and follow_target != null:
		var direction = global_position.direction_to(follow_target.global_position)
		var distance = global_position.distance_to(follow_target.global_position)

		if distance > follow_distance:
			velocity = direction * follow_speed
			# Flip sprite based on movement direction
			red_chicken.flip_h = velocity.x < 0
			play_walk()
		else:
			velocity = Vector2.ZERO
			play_idle()

		move_and_slide()


func start_following(target: Node2D) -> void:
	follow_target = target
	state = State.FOLLOWING


func play_idle() -> void:
	if red_chicken.animation != "idle":
		red_chicken.play("idle")


func play_walk() -> void:
	if red_chicken.animation != "walk":
		red_chicken.play("walk")


func _on_body_entered(body: Node) -> void:
	# Only react to the player the first time
	if state == State.IDLE and body.is_in_group("player"):
		body.add_animal_to_party(self)
