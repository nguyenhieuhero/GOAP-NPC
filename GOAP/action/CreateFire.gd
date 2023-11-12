extends GoapAction
class_name CreateFire

func get_action():
	return "CreateFireAction"

func is_valid():
	return true

func get_cost(state: Dictionary):
	if state.has("position"):
		var closest_tree = WorldState.get_closest_element("LifePots", state)
		return int(closest_tree.position.distance_to(state.position) / 5)
	return 5

func get_preconditions() -> Dictionary:
	return {
		"has_log": true,
	}

func get_effects() -> Dictionary:
	return {
		"see_Fires": true
	}

func perform(actor: Actor,delta):
	actor.inventory.useItem('log')
	GlobalTileMap.addFire(actor.position+actor.velocity.normalized())
	return true
