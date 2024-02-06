extends Area2D

## 2d攻击盒，注意collision mask 覆盖受击盒所在层，主动发现受击盒，主动发射攻击信号和调用受击信号发射
class_name Hitbox2d

signal hit(hurtbox)



func _ready() -> void:
	add_to_group("hitbox")
	area_entered.connect(_on_area_entered.bind())


func _on_area_entered(hurtbox:Hurtbox2d):
	if hurtbox.is_in_group("hurtbox"):

		hit.emit(hurtbox)
		hurtbox.hurt.emit(self)
