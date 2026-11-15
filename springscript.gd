extends Area2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D




func _on_body_entered(body: Node2D) -> void:
	
	if body.name =="Player":
		body.spring()
		animated_sprite_2d.play("bounce")


func _on_animated_sprite_2d_animation_finished() -> void:
	
	if animated_sprite_2d.animation == "bounce":
		animated_sprite_2d.play("idle")
