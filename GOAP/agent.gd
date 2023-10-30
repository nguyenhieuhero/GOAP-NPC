#
# This script integrates the actor (NPC) with goap.
# In your implementation you could have this logic
# inside your NPC script.
#
# As good practice, I suggest leaving it isolated like
# this, so it makes re-use easy and it doesn't get tied
# to unrelated implementation details (movement, collisions, etc)
extends Node2D

class_name GoapAgent

var goals
var current_goal
var current_plan
var current_plan_step = 0
var state: Dictionary = {}

var actor: Actor

func _process(delta):
#	var goal = _get_best_goal()
#	if current_goal == null or goal != current_goal:
	state = {
#			"position": actor.position,
		}
	for s in actor.inventory.getExistedItems():
		state['has_'+s] = true
	for s in WorldState.world_state:
		state[s] = WorldState.world_state[s]


func init(_actor, _goals: Array):
	actor = _actor
	goals = _goals

func get_state(state_name, default = null):
	return state.get(state_name, default)

func _get_best_goal():
	var highest_priority
	for goal in goals:
		if goal.is_valid() and (highest_priority == null or goal.priority() > highest_priority.priority()):
			highest_priority = goal

	return highest_priority


#
func _follow_plan(plan, delta):
	if plan.size() == 0:
		return

	var is_step_complete = plan[current_plan_step].perform(actor, delta)
	if is_step_complete and current_plan_step < plan.size() - 1:
		current_plan_step += 1
