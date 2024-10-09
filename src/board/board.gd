extends Node2D

var folder_path = "res://assets/cards/front/"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var vetorImgs = carregaImgs()
	vetorImgs = geraVetorAleatorioImgs(vetorImgs)
	carregaTexturaNasCartas(vetorImgs)
	


func _process(delta: float) -> void:
	#position = (get_viewport_rect().size - $Control.size)/2
	$Control.scale = (get_viewport_rect().size / $Control.size) * 0.99

func carregaImgs() -> Array:
	var saida = []
	var dir = DirAccess.open(folder_path)
	if dir:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if dir.current_is_dir() == false and not file_name.get_extension() in ["png", "jpg", "jpeg"]:
				file_name = dir.get_next()
				continue
			var image_path = folder_path + file_name
			var image = load(image_path)
			saida.append(image)
			file_name = dir.get_next()
			
		return saida
	return saida


func geraVetorAleatorioImgs(vetorImgs:Array) -> Array:
	var saida = []
	while not vetorImgs.is_empty():
		var img = vetorImgs.pick_random()
		saida.append(img)
		vetorImgs.erase(img)
	return saida

func carregaTexturaNasCartas(vetorImg:Array) -> void:
	for i in range(1, 5):  # 1 a 4
		var row = $Control.get_node("Row" + str(i))  
		for j in range(1, 11):  # 1 a 10
			var card = row.get_node("Card" + str(j))
			if vetorImg.is_empty():
				return
			card.sprite.set_texture(vetorImg.pop_front())
			card.ajustar_sprite_para_carta()
