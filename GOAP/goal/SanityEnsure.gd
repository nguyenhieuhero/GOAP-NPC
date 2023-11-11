extends GoapGoal

class_name SanityEnsure
func get_goal():
	return "SanityEnsureGoal"

func is_valid(state):
	return state.get('see_Fires',false)
	
func priority(state: Dictionary) -> int:
	return 20

func get_desired_state() -> Dictionary:
	return {
		"is_sanity": true
	}
