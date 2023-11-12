extends GoapGoal

class_name HungerEnsure
func get_goal():
	return "HungerEnsureGoal"

func is_valid(state):
	return true
	
func priority(state: Dictionary) -> int:
	if !state.get("is_hunger",false):
		return 100
	return 1

func get_desired_state() -> Dictionary:
	return {
		"is_hunger": true
	}
