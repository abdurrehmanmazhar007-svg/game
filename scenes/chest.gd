extends Area2D
@onready var chest_srite_2D : AnimatedSprite2D = $AnimatedSprite2D
var isOpen = false
# Called when the node enters the scene tree for the first time.
func interact():
	if isOpen == false:
		chest_srite_2D.play("opening")
		await chest_srite_2D.animation_finished
		isOpen = true
	else :
		chest_srite_2D.play("closing")
		await chest_srite_2D.animation_finished
		isOpen = false
