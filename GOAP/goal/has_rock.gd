extends GoapGoal

class_name HasRock

func get_goal():
	return "HasRockGoal"

func is_valid(state):
	return state.get('see_Rocks',false)
	
func priority(state: Dictionary) -> int:
	return 1

func get_desired_state() -> Dictionary:
	return {
		'has_rock':true
	}
