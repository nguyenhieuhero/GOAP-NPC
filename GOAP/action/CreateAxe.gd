extends GoapAction
class_name CreateAxe

func get_cost(state: Dictionary):
	return 1

func get_preconditions() -> Dictionary:
	return {
		"has_rock": true,
		"has_twig":true
	}

func get_effects() -> Dictionary:
	return {
		"has_axe": true
	}

func perform(actor: Actor, delta):
	var closest_tree = WorldState.get_closest_element(actor,'Trees')
	if closest_tree:
		if WorldState.isNear(actor,closest_tree):
			actor.set_idle()
			actor.animation_tree.set("parameters/conditions/is_axe", true)
		else:
			actor.goTo('Trees')
