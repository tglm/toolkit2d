extends ProgressBar

@onready var damage_bar: ProgressBar = $DamageBar
@onready var timer: Timer = $Timer

var health = 0: set  = _set_health

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _set_health(new_health):
	var prev_hp = health
	health = min(max_value, new_health)
	value = health
	
	if health <= 0:
		queue_free()
	if health < prev_hp:
		timer.start()
	else:
		damage_bar.value = health

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func init_health_bar(_health):
	health = _health
	value = health
	max_value = health
	damage_bar.value = health
	damage_bar.max_value = health


func _on_timer_timeout() -> void:
	damage_bar.value = health
	pass # Replace with function body.
