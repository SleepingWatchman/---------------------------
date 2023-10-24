extends Node

@export var sword_ability: PackedScene
var damage = 5

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Timer.timeout.connect(on_timer_timeout)

func on_timer_timeout():
	var player = get_tree().get_first_node_in_group("player") as Node2D
	if player == null:
		return
	
	var sword_instance = sword_ability.instantiate() as SwordAbility
	player.get_parent().add_child(sword_instance)
	#sword_instance.get_parent().add_child(sword_instance)
	sword_instance.hitbox_component.damage = damage
	if player.sprite_2d.flip_h == true:
		sword_instance.global_position = player.global_position 
		sword_instance.global_rotation_degrees = 180
		
	else:
		sword_instance.global_position = player.global_position
	
