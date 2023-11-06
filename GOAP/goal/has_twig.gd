extends GoapGoal

class_name HasTwig

func get_goal():
	return "HasTwigGoal"

func is_valid(state):
	return state.get('see_Twigs',false)
	
func priority(state: Dictionary) -> int:
	return 1

func get_desired_state() -> Dictionary:
	return {
		'has_twig':true
	}
