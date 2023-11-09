extends GoapAction
class_name KillChicken

func get_action():
	return "KillChickenAction"

func get_cost(state: Dictionary):
	return 1

func get_preconditions() -> Dictionary:
	return {
		"has_axe": true,
		"see_Chickens": true,
	}

func get_effects() -> Dictionary:
	return {
		"see_Beafs": true
	}

func perform(actor: Actor, delta):
	var closest_smile = WorldState.get_closest_element(actor,'Chickens')
	if closest_smile:
		if WorldState.isNear(actor,closest_smile):
			actor.set_idle()
			actor.animation_tree.set("parameters/conditions/is_axe", true)
		else:
			actor.goTo('Chickens')
