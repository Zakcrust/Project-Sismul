extends Node

class_name SceneGateway

var gateways : Array setget , get_gateways 

func _init(gateway_init : Array) -> void:
	gateways = gateway_init

func get_gateways() -> Array:
	return gateways
