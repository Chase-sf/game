extends CharacterBody2D

@onready var animation_player :=%AnimationPlayer

enum State {Idle, Dead, Jump, Land, Walk}

var state: State = State.Idle 

func _physics_process(delta):
	match state:
		State.Idle:
			_idle()
		State.Walk:
			_walking()

func _idle():
	print("idle")
	if Input.is_action_just_pressed("Walk"):
		state = State.Walk

func _walking():
	print("walk")
	if not Input.is_action_just_pressed("walk"):
		state = State.Idle

func set_state(new_state: int) -> void:
	if state == State.Idle:
		animation_player.play("Idle")
	elif state == State.Walk:
		animation_player.play("Walk")
