extends GoapGoal

class_name SanityEnsure
func get_goal():
	return "SanityEnsureGoal"

func is_valid(state):
	return true
	
func priority(state: Dictionary) -> int:
	if !state.get("is_sanity",false):
		return 100
	return 1

func get_desired_state() -> Dictionary:
	return {
		"is_sanity": true
	}
