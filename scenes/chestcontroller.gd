extends Area2D
var interactableinRange = []
@onready var chest_label: Label = $Label
var canInteract = true
func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed ("interact"):
		if interactableinRange.is_empty() == false && canInteract:
			canInteract = false
			chest_label.hide()
			await interactableinRange.back().interact()
			canInteract = true
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if interactableinRange.is_empty() == false && canInteract:

		chest_label.show()
	else:

		chest_label.hide()


func _on_area_entered(area: Area2D) -> void:
	interactableinRange.push_back(area)


func _on_area_exited(area: Area2D) -> void:
	interactableinRange.erase(area)
