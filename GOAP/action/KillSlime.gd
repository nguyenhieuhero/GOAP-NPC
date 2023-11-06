extends GoapAction
class_name KillSlime

func get_action():
	return "KillSlimeAction"

func get_cost(state: Dictionary):
	return 1

func get_preconditions() -> Dictionary:
	return {
		"has_axe": true,
		"has_lifepot": true,
		"see_Slimes": true,
	}

func get_effects() -> Dictionary:
	return {
		"see_Slimes": false
	}

func perform(actor: Actor, delta):
	var closest_smile = WorldState.get_closest_element(actor,'Slimes')
	if closest_smile:
		if WorldState.isNear(actor,closest_smile):
			actor.set_idle()
			actor.animation_tree.set("parameters/conditions/is_axe", true)
		else:
			actor.goTo('Slimes')
