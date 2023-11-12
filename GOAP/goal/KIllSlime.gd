extends GoapGoal

class_name KillSlimeGoal

func get_goal():
	return "Kill Slime"

func is_valid(state):
	return state.get('see_Slimes',false)
	
func priority(state: Dictionary) -> int:
	if state.get("is_day",false):
		return 50
	return 1

func get_desired_state() -> Dictionary:
	return {
		"see_Slimes": false
	}
