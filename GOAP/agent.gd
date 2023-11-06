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

var goals: Array[GoapGoal]
var current_goal
var current_plan
var current_plan_step = 0
var state: Dictionary = {}

var actor: Actor


func _process(delta):
	state = {
#			"position": actor,
			
		}
	for s in actor.inventory.getExistedItems():
		state['has_'+s] = true
	for s in WorldState.world_state:
		state[s] = WorldState.world_state[s]
#	print(state)


func init(_actor, _goals: Array[GoapGoal]):
	actor = _actor
	goals = _goals

func get_state(state_name, default = null):
	return state.get(state_name, default)

func _get_best_goal():
	var highest_priority: GoapGoal
	for goal in goals:
		if goal.is_valid(state) and (highest_priority == null or goal.priority(state) > highest_priority.priority(state)):
			highest_priority = goal
	return highest_priority


func _follow_plan(plan, delta):
#	print(current_plan_step,plan.size())
	if plan.size()==0:
		actor.velocity = Vector2.ZERO
		return
	plan[0].perform(actor,delta)
#	if current_plan_step >= plan.size():
#		actor.velocity = Vector2.ZERO
#		return
#
#	var is_step_complete = plan[current_plan_step].perform(actor, delta)
#	if is_step_complete and current_plan_step < plan.size() - 1:
#		current_plan_step += 1

