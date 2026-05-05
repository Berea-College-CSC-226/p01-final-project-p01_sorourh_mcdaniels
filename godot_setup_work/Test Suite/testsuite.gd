extends GutTest

# ─────────────────────────────────────────────
# Minimal stubs so tests run without full scenes
# ─────────────────────────────────────────────

class StubAnimal extends Node2D:
	var following_target: Node2D = null
	var state: String = "idle"

	func start_following(target: Node2D) -> void:
		following_target = target
		state = "following"


class StubPlayer extends Node2D:
	var party: Array[Node2D] = []

	func add_to_party(animal: Node2D) -> void:
		if animal in party:
			return
		if party.is_empty():
			animal.start_following(self)
		else:
			animal.start_following(party.back())
		party.append(animal)

	# Mirrors your player helpers for direction/state testing
	var cardinal_direction: Vector2 = Vector2.DOWN
	var direction: Vector2 = Vector2.ZERO
	var state: String = "idle"

	func SetState() -> bool:
		var new_state: String = "idle" if direction == Vector2.ZERO else "walk"
		if new_state == state:
			return false
		state = new_state
		return true

	func SetDirection() -> bool:
		var new_dir: Vector2 = cardinal_direction
		if direction == Vector2.ZERO:
			return false
		if direction.y == 0:
			new_dir = Vector2.LEFT if direction.x < 0 else Vector2.RIGHT
		elif direction.x == 0:
			new_dir = Vector2.UP if direction.y < 0 else Vector2.DOWN
		if new_dir == cardinal_direction:
			return false
		cardinal_direction = new_dir
		return true

	func AnimDirection() -> String:
		if cardinal_direction == Vector2.DOWN:
			return "down"
		elif cardinal_direction == Vector2.UP:
			return "up"
		else:
			return "side"


# ─────────────────────────────────────────────
# Shared instances
# ─────────────────────────────────────────────

var player: StubPlayer
var animal_a: StubAnimal
var animal_b: StubAnimal
var animal_c: StubAnimal


func before_each() -> void:
	player = StubPlayer.new()
	animal_a = StubAnimal.new()
	animal_b = StubAnimal.new()
	animal_c = StubAnimal.new()
	add_child(player)
	add_child(animal_a)
	add_child(animal_b)
	add_child(animal_c)


func after_each() -> void:
	player.queue_free()
	animal_a.queue_free()
	animal_b.queue_free()
	animal_c.queue_free()


# ─────────────────────────────────────────────
# add_to_party
# ─────────────────────────────────────────────

func test_first_animal_follows_player() -> void:
	player.add_to_party(animal_a)
	assert_eq(animal_a.following_target, player,
		"First animal should follow the player directly")


func test_second_animal_follows_first() -> void:
	player.add_to_party(animal_a)
	player.add_to_party(animal_b)
	assert_eq(animal_b.following_target, animal_a,
		"Second animal should follow the first animal")


func test_third_animal_follows_second() -> void:
	player.add_to_party(animal_a)
	player.add_to_party(animal_b)
	player.add_to_party(animal_c)
	assert_eq(animal_c.following_target, animal_b,
		"Third animal should follow the second animal")


func test_duplicate_animal_not_added() -> void:
	player.add_to_party(animal_a)
	player.add_to_party(animal_a)
	assert_eq(player.party.size(), 1,
		"Same animal should not be added to the party twice")


func test_party_size_grows_correctly() -> void:
	player.add_to_party(animal_a)
	player.add_to_party(animal_b)
	player.add_to_party(animal_c)
	assert_eq(player.party.size(), 3,
		"Party should contain exactly 3 animals")


func test_party_order_matches_join_order() -> void:
	player.add_to_party(animal_a)
	player.add_to_party(animal_b)
	player.add_to_party(animal_c)
	assert_eq(player.party[0], animal_a, "Slot 0 should be animal_a")
	assert_eq(player.party[1], animal_b, "Slot 1 should be animal_b")
	assert_eq(player.party[2], animal_c, "Slot 2 should be animal_c")


func test_animal_state_changes_to_following() -> void:
	player.add_to_party(animal_a)
	assert_eq(animal_a.state, "following",
		"Animal state should change to following after being recruited")


func test_animal_idle_before_recruited() -> void:
	assert_eq(animal_a.state, "idle",
		"Animal should start in idle state before being recruited")


# ─────────────────────────────────────────────
# SetState
# ─────────────────────────────────────────────

func test_set_state_idle_when_no_direction() -> void:
	player.direction = Vector2.ZERO
	player.state = "walk"
	var changed := player.SetState()
	assert_true(changed, "SetState should return true when state changes")
	assert_eq(player.state, "idle", "State should be idle when not moving")


func test_set_state_walk_when_moving() -> void:
	player.direction = Vector2.RIGHT
	var changed := player.SetState()
	assert_true(changed, "SetState should return true when state changes")
	assert_eq(player.state, "walk", "State should be walk when moving")


func test_set_state_returns_false_when_unchanged() -> void:
	player.direction = Vector2.ZERO
	player.state = "idle"
	var changed := player.SetState()
	assert_false(changed, "SetState should return false when state does not change")


# ─────────────────────────────────────────────
# SetDirection
# ─────────────────────────────────────────────

func test_set_direction_right() -> void:
	player.direction = Vector2.RIGHT
	player.SetDirection()
	assert_eq(player.cardinal_direction, Vector2.RIGHT,
		"Cardinal direction should be RIGHT")


func test_set_direction_left() -> void:
	player.direction = Vector2.LEFT
	player.cardinal_direction = Vector2.RIGHT
	player.SetDirection()
	assert_eq(player.cardinal_direction, Vector2.LEFT,
		"Cardinal direction should be LEFT")


func test_set_direction_up() -> void:
	player.direction = Vector2.UP
	player.SetDirection()
	assert_eq(player.cardinal_direction, Vector2.UP,
		"Cardinal direction should be UP")


func test_set_direction_down() -> void:
	player.direction = Vector2.DOWN
	player.cardinal_direction = Vector2.UP
	player.SetDirection()
	assert_eq(player.cardinal_direction, Vector2.DOWN,
		"Cardinal direction should be DOWN")


func test_set_direction_returns_false_when_zero() -> void:
	player.direction = Vector2.ZERO
	var changed := player.SetDirection()
	assert_false(changed, "SetDirection should return false when direction is zero")


func test_set_direction_returns_false_when_unchanged() -> void:
	player.direction = Vector2.DOWN
	player.cardinal_direction = Vector2.DOWN
	var changed := player.SetDirection()
	assert_false(changed, "SetDirection should return false when direction hasn't changed")


# ─────────────────────────────────────────────
# AnimDirection
# ─────────────────────────────────────────────

func test_anim_direction_down() -> void:
	player.cardinal_direction = Vector2.DOWN
	assert_eq(player.AnimDirection(), "down")


func test_anim_direction_up() -> void:
	player.cardinal_direction = Vector2.UP
	assert_eq(player.AnimDirection(), "up")


func test_anim_direction_left_returns_side() -> void:
	player.cardinal_direction = Vector2.LEFT
	assert_eq(player.AnimDirection(), "side")


func test_anim_direction_right_returns_side() -> void:
	player.cardinal_direction = Vector2.RIGHT
	assert_eq(player.AnimDirection(), "side")
