@tool
extends Sprite2D
class_name UVMappedSprite2D


@export var display_texture:Texture
const MAPPING_SHADER = preload("res://systems/mapping/screen.gdshader")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	material = ShaderMaterial.new()
	material.shader = MAPPING_SHADER
	material.set_shader_parameter("contentSampler", display_texture)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
