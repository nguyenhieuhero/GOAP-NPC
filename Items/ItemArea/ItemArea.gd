extends Area2D
class_name ItemArea
@export var itemRes: ItemResource
func get_item_name():
	return itemRes.name
func collect(inventory: InventoryResource):
	inventory.insert(itemRes)
	queue_free()
