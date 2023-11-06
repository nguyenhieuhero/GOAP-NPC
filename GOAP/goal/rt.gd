extends GoapGoal

class_name KILLSLIME

func get_goal():
	return "TEST GOAL"

func is_valid(state):
	return state.get('see_Slimes',false)
	
func priority(state: Dictionary) -> int:
	return 1

func get_desired_state() -> Dictionary:
	return {
		"see_Slimes": false
	}
