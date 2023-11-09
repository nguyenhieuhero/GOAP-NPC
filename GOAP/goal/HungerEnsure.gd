extends GoapGoal

class_name HungerEnsure
func get_goal():
	return "HungerEnsureGoal"

func is_valid(state):
	return state.get('has_beaf',false)
	
func priority(state: Dictionary) -> int:
	return 20

func get_desired_state() -> Dictionary:
	return {
		"has_axe": true
	}
