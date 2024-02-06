
extends Area2D

## 2d受击盒，由攻击盒进行检测，由攻击盒调用发射受击信号
class_name Hurtbox2d
var hurt_area: Node2D

signal hurt(hitbox)


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_to_group("hurtbox")
