extends GoapGoal

class_name HealthyEnsure
func get_goal():
	return "HealthyEnsureGoal"

func is_valid(state):
	return true
	
func priority(state: Dictionary) -> int:
	if !state.get("is_healthy",false):
		return 150
	return 1

func get_desired_state() -> Dictionary:
	return {
		"is_healthy": true
	}
