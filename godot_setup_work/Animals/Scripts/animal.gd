extends CharacterBody2D

enum State { IDLE, FOLLOWING }

@export var follow_speed: float = 90.0
@export var follow_distance: float = 28.0

var state: State = State.IDLE
var follow_target: Node2D = null
var cardinal_direction: Vector2 = Vector2.DOWN

@onready var anim: AnimatedSprite2D = $Animal
@onready var detection_area: Area2D = $Area2D


func _ready() -> void:
	detection_area.body_entered.connect(_on_body_entered)
	anim.play("idle_down")


func _physics_process(_delta: float) -> void:
	if state != State.FOLLOWING or follow_target == null:
		return

	var distance := global_position.distance_to(follow_target.global_position)

	if distance > follow_distance:
		var dir := global_position.direction_to(follow_target.global_position)
		velocity = dir * follow_speed
		_update_cardinal(dir)
		_play_anim("walk")
	else:
		velocity = Vector2.ZERO
		_play_anim("idle")

	move_and_slide()


func start_following(target: Node2D) -> void:
	follow_target = target
	state = State.FOLLOWING


func _update_cardinal(dir: Vector2) -> void:
	var new_dir: Vector2 = cardinal_direction

	if abs(dir.x) > abs(dir.y):
		new_dir = Vector2.LEFT if dir.x < 0 else Vector2.RIGHT
	else:
		new_dir = Vector2.UP if dir.y < 0 else Vector2.DOWN

	if new_dir != cardinal_direction:
		cardinal_direction = new_dir
		# Mirror sprite for left/right just like your player does
		anim.scale.x = -1 if cardinal_direction == Vector2.LEFT else 1


func _anim_direction() -> String:
	if cardinal_direction == Vector2.DOWN:
		return "down"
	elif cardinal_direction == Vector2.UP:
		return "up"
	else:
		return "side"


func _play_anim(new_state: String) -> void:
	var anim_name := new_state + "_" + _anim_direction()
	if anim.animation != anim_name:
		anim.play(anim_name)


func _on_body_entered(body: Node) -> void:
	if state == State.IDLE and body.is_in_group("player"):
		body.add_to_party(self)
