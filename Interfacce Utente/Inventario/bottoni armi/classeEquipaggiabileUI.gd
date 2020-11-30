extends TouchScreenButton

class_name EquipableButton

var id = 0
var lvl = 1

const Weapon = -1
const BodyArmor = -2
var kind = Weapon

onready var parent = get_parent()
var oldParent 
var hasParent = true

func _process(delta):
	if is_pressed() :
		z_index = 100
		if hasParent == true:
			hasParent = false
			oldParent = get_parent()
		self.global_position = get_global_mouse_position() - Vector2(50,50)
	if hasParent == false and is_pressed() == false:
		z_index= 10
		hasParent = true
		if parent!= null:
			if parent.child != null and parent != oldParent:
				get_parent().child = parent.child
				parent.remove_child(parent.child)
				get_parent().add_child(parent.child)
				parent.child.global_position = get_parent().getPos()
			get_parent().remove_child(self)
			parent.add_child(self)
			parent.child = self
			self.global_position = parent.getPos()
		else: 
			self.global_position = oldParent.getPos() 





#func touched():
#	oldParent = parent
#	hasParent = false
#	self.global_position = get_global_mouse_position()
#
#func wentOver(touchedSlot):
#	parent = touchedSlot
#
#func laid():
#	if parent != null and (parent.numeroSlot > 0 or parent.numeroSlot == kind):
#		oldParent.add_child(parent.child)
#		oldParent.child = parent.child
#		parent.add_child(self)
#	else:
#		parent = oldParent
#		self.global_position = parent.global_position
#	pass
#

