extends Node

func use_item(player, item : Item) -> void:
	match item.item_effect.effect_type:
		ItemEffectTypes.HEALTH_BOOST:
			player.battle_stats.health += item.item_effect.amount
			player.battle_stats.health = clamp(player.battle_stats.health, 0 , player.stats.health)
		ItemEffectTypes.DAMAGE_BOOST:
			player.battle_stats.damage += item.item_effect.amount
		ItemEffectTypes.ENERGY_BOOST:
			player.battle_stats.energy += item.item_effect.amount
		ItemEffectTypes.SPEED_BOOST:
			player.battle_stats.speed += item.item_effect.amount
