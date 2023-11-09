extends GoapAction
class_name PickUpLifepot

func get_action():
	return "PickUpLifepotAction"

func get_cost(state: Dictionary):
	if state.has("position"):
		var closest_tree = WorldState.get_closest_element(state["position"],"LifePots")
		return int(closest_tree.position.distance_to(state.position) / 5)
	return 5

func get_preconditions() -> Dictionary:
	return {
		"see_LifePots": true,
		"has_lifepot": false
	}

func get_effects() -> Dictionary:
	return {
		"has_lifepot": true
	}

func perform(actor: Actor,delta):
	if actor.agent.get_state('has_lifepot'):
		return true
	var closest_tree = WorldState.get_closest_element(actor,'LifePots')
	if closest_tree:
		if WorldState.isNear(actor,closest_tree):
			actor.set_idle()
			actor.animation_tree.set("parameters/conditions/is_pick", true)
		else:
			actor.goTo('LifePots')
