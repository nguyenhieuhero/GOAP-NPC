extends GoapAction
class_name HealingSanity

func get_action():
	return "HealingSanityAction"

func get_cost(state: Dictionary):
	return 1

func get_preconditions() -> Dictionary:
	return {
		"is_sanity": false,
		"see_Fires": true,
	}

func get_effects() -> Dictionary:
	return {
		"is_sanity": true
	}

func perform(actor: Actor, delta):
	var closest_smile = WorldState.get_closest_element(actor,'Fires')
	if closest_smile:
		if WorldState.isNear(actor,closest_smile,40):
			actor.set_idle()
			actor.currentSanity = 80
			return true
		else:
			actor.goTo('Fires')
			
