extends Area2D
@export var itemRes: ItemResource

func collect(inventory: InventoryResource):
	inventory.insert(itemRes)
	queue_free()
