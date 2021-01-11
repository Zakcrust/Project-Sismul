extends Node

var buff : Buff

func use_item(player, item : Item) -> void:
	match item.item_effect.effect_type:
		ItemEffectTypes.HEALTH_BOOST:
			player.battle_stats.health += item.item_effect.amount
			player.battle_stats.health = clamp(player.battle_stats.health, 0 , player.stats.health)
		ItemEffectTypes.ATTACK_BOOST:
			if item.item_effect.is_buff:
				buff = Buff.new(ItemEffectTypes.ATTACK_BOOST, item.item_effect.amount, item.item_effect.turn_length)
				player.battle_buff.damage_buff = buff
		ItemEffectTypes.ENERGY_BOOST:
			if item.item_effect.is_buff:
				buff = Buff.new(ItemEffectTypes.ENERGY_BOOST, item.item_effect.amount, item.item_effect.turn_length)
				player.battle_buff.energy_buff = buff
		ItemEffectTypes.SPEED_BOOST:
			if item.item_effect.is_buff:
				buff = Buff.new(ItemEffectTypes.SPEED_BOOST, item.item_effect.amount, item.item_effect.turn_length)
				player.battle_buff.speed_buff = buff
