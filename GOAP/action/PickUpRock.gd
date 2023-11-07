extends GoapAction
class_name PickUpRock

func get_action():
	return "PickUpRockAction"

func get_cost(state: Dictionary):
	if state.has("position"):
		var closest_tree = WorldState.get_closest_element("LifePots", state)
		return int(closest_tree.position.distance_to(state.position) / 5)
	return 5

func get_preconditions() -> Dictionary:
	return {
		"see_Rocks": true,
		"has_rock": false
	}

func get_effects() -> Dictionary:
	return {
		"has_rock": true
	}

func perform(actor: Actor,delta):
	if actor.agent.get_state('has_rock'):
		return true
	var closest_tree = WorldState.get_closest_element(actor,'Rocks')
	if closest_tree:
		if WorldState.isNear(actor,closest_tree):
			actor.set_idle()
			actor.animation_tree.set("parameters/conditions/is_pick", true)
		else:
			actor.goTo('Rocks')
