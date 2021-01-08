extends Node

var tree_root : MinimaxNode
var tree : MinimaxNode
var minimax_nodes : Array

var player_root_node : MinimaxNode

var states : Array = [MinimaxStates.ATTACK,MinimaxStates.DEFEND,MinimaxStates.BOOST]
var player_state : MinimaxState = MinimaxState.new(2,1,3)
var enemy_state : MinimaxState = MinimaxState.new(3,2,1)

func _ready():
	randomize()
#	var result : MinimaxNode = minimax(MinimaxNode.new(MinimaxStates.DEFEND, player_state.get_score(MinimaxStates.DEFEND), true), 3, 6)
#	print("Minimax Result")
#	print("State : %s" % result.state)
#	print("Score : %s" % result.score)
#	randomize()
#	tree = construct_tree(MinimaxNode.new(MinimaxStates.ATTACK, player_state.get_score(MinimaxStates.ATTACK), true), 3, 6)
#	add_child(tree)
#	minimax_nodes = get_all_children(tree)
#	traverse_from_leaves_to_root(minimax_nodes)
#	print("TREE STATE %s " % tree.state)
#	print("TREE SCORE %s" % tree.score)
#	print("FIRST CHILDREN FINAL VALUE")
#	for child in tree.get_children():
#		print("state :%s | score : %s" % [child.state, child.score])

func minimax(root : MinimaxNode ,children_amount : int , depth : int) -> MinimaxNode:
	var tree : MinimaxNode
	var leaves : Array
	tree = construct_tree(root, children_amount, depth)
	leaves = get_all_children(tree)

	return traverse_from_leaves_to_root(tree, leaves)
	

func traverse_from_leaves_to_root(tree : MinimaxNode,nodes : Array) -> MinimaxNode:
	print(nodes.size())
	var counter = 0
	var leaf : MinimaxNode
	for i in range(nodes.size() -1, 0, -1):
		counter += 1
		leaf = nodes[i]
		if leaf.get_parent() == null:
			pass
		if leaf.get_parent().is_maximizer:
			leaf.get_parent().score = leaf.score if leaf.score > leaf.get_parent().score else leaf.get_parent().score
		else:
			leaf.get_parent().score = leaf.score if leaf.score < leaf.get_parent().score else leaf.get_parent().score
		leaf.get_parent().state = leaf.state if leaf.score == leaf.get_parent().score else leaf.get_parent().state
	for child in tree.get_children():
		if tree.is_maximizer:
			tree.score = child.score if child.score > tree.score else tree.score
			tree.state = child.state if tree.score == child.score else tree.state
		else:
			tree.score = child.score if child.score < tree.score else tree.score
			tree.state = child.state if tree.score == child.score else tree.state
		
	print("Leaves count : %s" % counter )
	return tree

func get_all_children(root : MinimaxNode, children_nodes : Array = [], minimax_nodes : Array = []) -> Array:
	var children : Array
	if root != null:
		var first_children : Array = root.get_children()
		print("FIRST CHILDREN INIT VALUE")
		for child in first_children:
			print("state :%s | score : %s" % [child.state, child.score])
			minimax_nodes.append(child)
			if child.get_child_count() > 0:
				children.append(child)
		return get_all_children(null, children, minimax_nodes)
	else:
		if children_nodes.empty():
			return minimax_nodes
		else:
			for child in children_nodes:
				for grandchild in child.get_children():
					minimax_nodes.append(grandchild)
					if child.get_child_count() > 0:
						children.append(grandchild)
			return get_all_children(null, children, minimax_nodes)


func set_root(root : MinimaxNode) ->  void:
	tree_root = root

func start_minimax(root : MinimaxNode) -> void:
	set_root(root)

func construct_tree(root : MinimaxNode ,children_amount : int , depth : int, children_node : Array = []) ->  Node:
	if depth == 0:
		return root
	if not children_node.empty():
		var children_to_return : Array
		var arr : Array = states
		arr.shuffle()
		for child_node in children_node:
			for i in range (0, children_amount):
				var state = arr.front()
				arr.shuffle()
				var score : int
				if child_node.is_maximizer:
					score = enemy_state.get_score(state)
				else:
					score = player_state.get_score(state)
				var minimax_node = MinimaxNode.new(state, score, !child_node.is_maximizer)
				minimax_node.name = "BRANCH %s" % depth
				child_node.add_child(minimax_node)
				children_to_return.append(minimax_node)
		return construct_tree(root, children_amount, depth -1, children_to_return)
	else:
		for i in range (0, children_amount):
			var score : int
			if root.is_maximizer:
				score = enemy_state.get_score(states[i])
			else:
				score = player_state.get_score(states[i])
			var minimax_node = MinimaxNode.new(states[i], score, !root.is_maximizer)
			minimax_node.name = "BRANCH %s" %depth 
			root.add_child(minimax_node)
	return construct_tree(root, children_amount, depth - 1, root.get_children())
