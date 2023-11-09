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


@onready var planner: GoapPlanner = GoapPlanner.new()
var goals: Array[GoapGoal]
var current_goal: GoapGoal
var current_plan
var current_plan_step = 0
var state: Dictionary = {}

var actor: Actor

func _process(delta):
	update_agent_state()
	var goal = _get_best_goal()
	if current_goal == null or goal != current_goal:
		if goal:
			actor.isAction = false
			current_goal = goal
			current_plan = planner.get_plan(current_goal,state)
			current_plan_step = 0
		if current_goal:
			print(state)
			for _goal in goals:
				print("GOAL: ",_goal.get_goal()," ",_goal.priority(state))
			print("CURRENT GOAL: ",current_goal.get_goal())
			for _action in current_plan:
				print(_action.get_action())
			print("==========")
	else:
		_follow_plan(current_plan,delta)
func update_agent_state():
	state = {
#		"position": actor,
		"is_healthy":actor.currentHealth>80
	}
	for s in actor.inventory.getExistedItems():
		state['has_'+s] = true
	for s in WorldState.world_state:
		state[s] = WorldState.world_state[s]
func init(_actor, _goals: Array[GoapGoal],_actions:Array[GoapAction]):
	actor = _actor
	goals = _goals
	planner = GoapPlanner.set_actions(_actions)

func get_state(state_name, default = null):
	return state.get(state_name, default)

func _get_best_goal():
	var highest_priority: GoapGoal
	for goal in goals:
		if goal.is_valid(state) and (highest_priority == null or goal.priority(state) > highest_priority.priority(state)):
			highest_priority = goal
	return highest_priority

func _follow_plan(plan, delta):
	if plan.size() == 0:
		return
	var is_step_complete = plan[current_plan_step].perform(actor, delta)
	if is_step_complete and current_plan_step < plan.size() - 1:
		current_plan_step += 1

#func _follow_plan(plan, delta):
##	print(current_plan_step,plan.size())
#	if plan.size()==0:
#		actor.velocity = Vector2.ZERO
#		return
#	plan[0].perform(actor,delta)
##	if current_plan_step >= plan.size():
##		actor.velocity = Vector2.ZERO
##		return
##
##	var is_step_complete = plan[current_plan_step].perform(actor, delta)
##	if is_step_complete and current_plan_step < plan.size() - 1:
##		current_plan_step += 1

