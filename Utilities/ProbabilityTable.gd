class_name ProbabilityTable

var _table := []

var total_weight: int :
	get:
		var w = 0
		for item in _table:
			w += item[0]
		return w

func add_item(weight : int, item) -> void:
	_table.push_back([weight, item])

func pick(searched_value):
	var current_weight = 0
	for item in _table:
		if current_weight + item[0] > searched_value:
			if item[1] is ProbabilityTable:
				return item[1].pick_random()
			return item[1]
		else:
			current_weight += item[0]

func pick_random():
	return pick(randi_range(0, total_weight-1))
