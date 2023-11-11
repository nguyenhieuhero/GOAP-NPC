extends GoapAction
class_name HealingHunger

func get_action():
	return "HealingHungerAction"

func get_cost(state: Dictionary):
	return 1

func get_preconditions() -> Dictionary:
	return {
		"has_beaf": true,
	}

func get_effects() -> Dictionary:
	return {
		"is_hunger": true
	}

func perform(actor: Actor, delta):
	if actor.agent.get_state('is_hunger'):
		return true
	actor.set_idle()
	actor.animationPlayer.play('craft_axe');
	actor.inventory.useItem('beaf')
	actor.currentHunger += 10
