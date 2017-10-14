extends Node

const SAVE_PATH = "res://inventory.json"


var items = {}

func Save():
	
	# Open the existing save file or create a new one in write mode
	var save_file = File.new()
	save_file.open(SAVE_PATH, File.WRITE)
		
	# converts to a JSON string. We store it in the save_file
	save_file.store_line(items.to_json())
	# The change is automatically saved, so we close the file
	save_file.close()
	print("Inventory saved.")

	
func Load():
	
	# When we load a file, we must check that it exists before we try to open it or it'll crash the game
	var load_file = File.new()
	if not load_file.file_exists(SAVE_PATH):
		print("The load file does not exist. Is created now.")
		self.Save();
		return
		
	load_file.open(SAVE_PATH, File.READ)
	items.parse_json(load_file.get_as_text())
	print("Inventory loaded.")
	
func Add(itemName,val):
	if !items.has(itemName):
		items[itemName]=val	
		
func Del(itemName):
	if items.has(itemName):
		items.erase(itemName)
		
func Set(itemName,val):
	items[itemName] = val