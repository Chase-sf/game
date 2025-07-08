# persistent_state.gd
extends CharacterBody2D

class_name PersistentState

var state
var state_factory

var Velocity = Vector2()

func _ready():
	state_factory = StateFactory.new()
	change_state("idle")

func _process(delta: float) -> void:
	if Input.is_action_pressed("move_left"):
		move_left()
	elif Input.is_action_pressed("move_right"):
		move_right()

func move_left():
	state.move_left()

func move_right():
	state.move_right()

func change_state(new_state_name):
	if state != null:
		state.queue_free()
	state = state_factory.get_state(new_state_name).new()
	state.setup(Callable(self, "change_state"), $AnimatedSprite2D, self)
	state.name = "current_state"
	add_child(state)
