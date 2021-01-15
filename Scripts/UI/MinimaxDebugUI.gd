extends CanvasLayer


func _ready():
	Minimax.connect("root_node", self, "set_root_node_ui")
	Minimax.connect("tree_depth", self , "set_tree_depth_ui")
	Minimax.connect("leaf_count", self , "set_leaf_count_ui")
	Minimax.connect("final_node", self, "set_final_node_ui")

func set_root_node_ui(node : MinimaxNode) -> void:
	var maximizer : String = "Maxizimer" if node.is_maximizer else "Minimizer"
	$Control/HBoxContainer/RootNode.text = "Root Node : (%s, %s, %s)" % [node.state, node.score, maximizer]


func set_tree_depth_ui(amount : int) -> void:
	$Control/HBoxContainer/TreeDepth.text = "Tree depth : %s" % amount


func set_leaf_count_ui(amount : int) -> void:
	$Control/HBoxContainer/Leaves.text = "Leaves Count : %s" % amount

func set_final_node_ui(node : MinimaxNode) -> void:
	var maximizer : String = "Maxizimer" if node.is_maximizer else "Minimizer"
	$Control/HBoxContainer/ResultNode.text = "Final Node : (%s, %s, %s)" % [node.state, node.score, maximizer]
