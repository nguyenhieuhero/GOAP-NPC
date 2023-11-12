extends GoapAction
class_name HealingHealth

func get_action():
	return "HealingHealthAction"

func get_cost(state: Dictionary):
	return 1

func get_preconditions() -> Dictionary:
	return {
		"has_lifepot": true,
	}

func get_effects() -> Dictionary:
	return {
		"is_healthy": true
	}

func perform(actor: Actor, delta):
	if actor.agent.state.get("is_healthy",false):
		return true
	actor.inventory.useItem('lifepot')
	actor.currentHealth += 30
	actor.animationPlayer.play('craft_axe')
			
