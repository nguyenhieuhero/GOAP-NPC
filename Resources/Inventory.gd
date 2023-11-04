extends Resource
class_name InventoryResource

signal updated
@export var slots: Array[InventorySlot]
@export var maxInSlot : int = 9

func isFullSlot():
	for slot in slots:
		if !slot.itemResource or slot.quanity < maxInSlot:
			return false
	return true
func insert(item: ItemResource):
	for slot in slots:
		if slot.itemResource == item and slot.quanity < maxInSlot:
			slot.quanity += 1
			updated.emit()
			return
	
	for i in range(slots.size()):
		if !slots[i].itemResource:
			slots[i].itemResource = item
			slots[i].quanity = 1
			updated.emit()
			return


func checkItemExist(itemName):
	for slot in slots:
		if(slot.itemResource && slot.itemResource.name == itemName):
			return true
	return false
