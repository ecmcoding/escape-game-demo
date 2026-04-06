extends Area3D

@onready var wall = get_parent() as CSGShape3D

var triggered = false

func _on_body_entered(body):
	if triggered:
		return
	
	if body.is_in_group("player"):
		triggered = true
		print(wall)
		GameManager.startGame()
		await get_tree().create_timer(0.1).timeout
		wall.set_deferred("use_collision", true)
