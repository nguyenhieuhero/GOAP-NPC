extends GoapGoal

class_name KILLSLIME

func get_goal():
	return "KILL SLIME IN DAY"

func is_valid(state):
	return state.get('see_Slimes',false)
	
func priority(state: Dictionary) -> int:
	if state.get("is_day",false):
		return 10
	return 0.5

func get_desired_state() -> Dictionary:
	return {
		"see_Slimes": false
	}
