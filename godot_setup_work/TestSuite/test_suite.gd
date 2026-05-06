extends GutTest


 # creates a fake version of the animal.gd script with the most important parts needed for testing
class StubAnimal extends Node2D:
	enum State { IDLE, FOLLOWING }

	var following_target: Node2D = null
	var state: int = State.IDLE
	var cardinal_direction: Vector2 = Vector2.DOWN

	func start_following(target: Node2D) -> void:
		following_target = target
		state = State.FOLLOWING
		
	func _update_cardinal(dir: Vector2) -> void:
		var new_dir: Vector2 = cardinal_direction
		if abs(dir.x) > abs(dir.y):
			new_dir = Vector2.LEFT if dir.x < 0 else Vector2.RIGHT
		else:
			new_dir = Vector2.UP if dir.y < 0 else Vector2.DOWN
		if new_dir != cardinal_direction:
			cardinal_direction = new_dir

	func _anim_direction() -> String:
		if cardinal_direction == Vector2.DOWN:
			return "down"
		elif cardinal_direction == Vector2.UP:
			return "up"
		else:
			return "side"

 # creates a fake version of the player.gd script with the most important parts needed for testing
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



# every test can access these variables
var player: StubPlayer
var animal_a: StubAnimal
var animal_b: StubAnimal
var animal_c: StubAnimal

# this runs before each test, creating all the necessary nodes and children
# it creates a fresh set of variables, so nothing is left over from the previous tests.
func before_each() -> void:
	player = StubPlayer.new() # new instance of the player 
	animal_a = StubAnimal.new()
	animal_b = StubAnimal.new()
	animal_c = StubAnimal.new()
	add_child(player) # addes everything to a node tree
	add_child(animal_a)
	add_child(animal_b)
	add_child(animal_c)

# deletes the node after each test. Prevents memory leaks 
func after_each() -> void:
	player.queue_free()
	animal_a.queue_free()
	animal_b.queue_free()
	animal_c.queue_free()



# Test add_to_party

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


func test_party_empty_at_start() -> void:
	assert_eq(player.party.size(), 0,
		"Party should be empty before any interaction")

func test_all_five_animals_chain_correctly() -> void:
	# create the extra two animals needed for this test
	var animal_d := StubAnimal.new()
	var animal_e := StubAnimal.new()
	add_child(animal_d)
	add_child(animal_e)

	# recruit all five in order
	player.add_to_party(animal_a)
	player.add_to_party(animal_b)
	player.add_to_party(animal_c)
	player.add_to_party(animal_d)
	player.add_to_party(animal_e)

	# verify the chain
	assert_eq(animal_a.following_target, player,   "animal_a should follow player")
	assert_eq(animal_b.following_target, animal_a, "animal_b should follow animal_a")
	assert_eq(animal_c.following_target, animal_b, "animal_c should follow animal_b")
	assert_eq(animal_d.following_target, animal_c, "animal_d should follow animal_c")
	assert_eq(animal_e.following_target, animal_d, "animal_e should follow animal_d")

	# clean up the extras before after_each runs
	animal_d.queue_free()
	animal_e.queue_free()

func test_start_following_sets_target() -> void:
	animal_a.start_following(player)
	assert_eq(animal_a.get("following_target"), player,
		"follow_target should be the player after start_following")

func test_start_following_changes_state() -> void:
	animal_a.start_following(player)
	assert_eq(animal_a.get("state"), 1,  # 1 = State.FOLLOWING
		"State should be FOLLOWING after start_following")

func test_start_following_another_animal() -> void:
	animal_a.start_following(player)
	animal_b.start_following(animal_a)
	assert_eq(animal_b.get("following_target"), animal_a,
		"Animal b should follow animal a, not the player")

# Test _cardinal_property

func test_cardinal_prefers_horizontal_when_x_dominant() -> void:
	var dir := Vector2(0.9, 0.1).normalized()
	animal_a.call("_update_cardinal", dir)
	assert_eq(animal_a.get("cardinal_direction"), Vector2.RIGHT,
		"Should pick RIGHT when x dominates")

func test_cardinal_prefers_vertical_when_y_dominant() -> void:
	var dir := Vector2(0.1, 0.9).normalized()
	animal_a.call("_update_cardinal", dir)
	assert_eq(animal_a.get("cardinal_direction"), Vector2.DOWN,
		"Should pick DOWN when y dominates")

func test_cardinal_left_when_moving_left() -> void:
	animal_a.call("_update_cardinal", Vector2(-1.0, 0.0))
	assert_eq(animal_a.get("cardinal_direction"), Vector2.LEFT)

func test_cardinal_up_when_moving_up() -> void:
	animal_a.call("_update_cardinal", Vector2(0.0, -1.0))
	assert_eq(animal_a.get("cardinal_direction"), Vector2.UP)

func test_cardinal_does_not_change_if_same_direction() -> void:
	animal_a.call("_update_cardinal", Vector2(0.0, 1.0))
	assert_eq(animal_a.get("cardinal_direction"), Vector2.DOWN,
		"Cardinal should not change if direction is the same")
# Test SetState

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


# Test SetDirection
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


# Test AnimDirection

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


## SetState + Anim Direction Test
func test_walk_animation_name_is_correct() -> void:
	player.direction = Vector2.RIGHT
	player.SetState()
	player.SetDirection()
	var anim_name := player.state + "_" + player.AnimDirection()
	assert_eq(anim_name, "walk_side",
		"Moving right should produce walk_side animation name")

func test_idle_animation_name_is_correct() -> void:
	player.direction = Vector2.ZERO
	player.state = "walk"
	player.SetState()
	var anim_name := player.state + "_" + player.AnimDirection()
	assert_eq(anim_name, "idle_down",
		"Stopping while facing down should produce idle_down")
