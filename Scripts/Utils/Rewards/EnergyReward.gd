extends StatReward

export (int) var amount

func _init().(StatType.ENERGY, 1):
	pass

func _ready():
	reward.amount = amount
