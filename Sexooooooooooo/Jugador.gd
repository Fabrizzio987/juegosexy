extends KinematicBody


export var rapidez=100
export var acce=5

export var gravedad=9.8
export var salto=200

var MOUSE_SENSITIVITY=0.20

onready var camara=$Camera
var velocidad=Vector3()



#Majenar movimiento
func _physics_process(delta):
	var mov=camara.get_global_transform().basis
	
	var dir=Vector3()
	
	if Input.is_action_pressed("mov_arriba"):
		dir-=mov.z
	elif Input.is_action_pressed("mov_abajo"):
		dir+=mov.z
	elif Input.is_action_pressed("mov_izquierda"):
		dir-=mov.x
	elif Input.is_action_pressed("mov_derecha"):
		dir+=mov.x
	
	dir=dir.normalized()
	velocidad=velocidad.linear_interpolate(dir*rapidez,acce*delta)
	velocidad=move_and_slide(velocidad,Vector3(0,1,0))
	velocidad.y-=gravedad
	
	if (is_on_floor()):
		if Input.is_action_pressed("saltar"):
			velocidad.y+=salto


#Manejar mira
func _input(event):
	#Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
	if event is InputEventMouseMotion:
		camara.rotate_x(deg2rad(event.relative.y * MOUSE_SENSITIVITY*-1))
		self.rotate_y(deg2rad(event.relative.x* MOUSE_SENSITIVITY * -1))

		var camera_rot = camara.rotation_degrees
		camera_rot.x = clamp(camera_rot.x, -70, 70)
		camara.rotation_degrees = camera_rot
