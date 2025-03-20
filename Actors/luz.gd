extends Area2D


func _process(delta):
	connect("body_entered", characterEnters(character))
	
func characterEnters(character){
	if character is Geist 
		
}
