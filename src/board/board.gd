extends Node2D

var folder_path = "res://assets/cards/front/"
var timer 
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var vetorImgs = carregaImgs()
	vetorImgs = geraVetorAleatorioImgs(vetorImgs)
	carregaTexturaNasCartas(vetorImgs)
	
	timer = Timer.new()  # Cria um novo Timer
	add_child(timer)  # Adiciona o Timer como filho
	timer.wait_time = 1  # Define o tempo de espera
	timer.one_shot = true  # O Timer será disparado apenas uma vez


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
			
			var index
			if "_" in file_name:
				index = file_name.find("_")
			else:
				index = file_name.find(".")
			file_name = file_name.substr(0, index)
			
			saida.append([image,file_name])
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
			var elemento = vetorImg.pop_front()
			card.sprite.set_texture(elemento[0])
			card.id = elemento[1]
			card.ajustar_sprite_para_carta()

func verificaCartasViradas():
	var cartasViradas = []
	for row in $Control.get_children():  
		for card in row.get_children():  
			if card.nodeFront.visible:
				cartasViradas.append(card)
	return cartasViradas

func verificaParCartas(cartasViradas:Array):
	if cartasViradas.size() == 2:
		if cartasViradas[0].id == cartasViradas[1].id:
			timer.start() 
			await timer.timeout  
			cartasViradas[0].queue_free()
			cartasViradas[1].queue_free()
			return []
	return cartasViradas


func desviraCartas(cartasViradas:Array):
	if cartasViradas.size() == 2:
		timer.start() 
		await timer.timeout  
		cartasViradas[0].nodeFront.visible = false
		cartasViradas[1].nodeFront.visible = false


func _on_control_gui_input(event: InputEvent) -> void:
	get_tree().paused = true
	var cartasViradas = verificaCartasViradas()
	cartasViradas = await verificaParCartas(cartasViradas)
	await desviraCartas(cartasViradas)
	get_tree().paused = false
	
