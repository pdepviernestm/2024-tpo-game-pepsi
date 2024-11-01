object lobo {
    var property position = game.at(10, 3)

    const sprites = [
        "correr1.png",
        "correr2.png",
        "correr3.png",
        "correr4.png",
        "correr5.png",
        "correr6.png",
        "correr7.png",
        "correr8.png",
        "correr9.png",
        "saltar1.png",
        "saltar2.png",
        "saltar3.png",
        "saltar4.png",
        "saltar5.png",
        "saltar5.png",
        "saltar6.png",
        "saltar6.png",
        "saltar7.png",
        "saltar7.png",
        "saltar8.png",
        "saltar8.png"
    ]

    var currentSpriteIndex = 0
    // Método que devuelve la ruta del sprite actual
    method image() = sprites.get(currentSpriteIndex)

    // Método para mover el personaje y actualizar el sprite
    
    method correr() {
        if(currentSpriteIndex>=8){
            currentSpriteIndex=0
        }
        else{
            currentSpriteIndex+=1
        }
        // Asigna la nueva imagen para que el juego la use
        self.image()
    }

    method saltar() {
        if(currentSpriteIndex <= 8){
            currentSpriteIndex = 9
            self.image()
            self.position(self.position().up(1))
            game.schedule(200, {self.position(self.position().up(1))})
            game.schedule(400, {self.position(self.position().down(1))})
            game.schedule(600, {self.position(self.position().down(1))})
            game.schedule(650, {currentSpriteIndex = 0})
        }
        else{
            currentSpriteIndex += 1
            self.image()
        }
        
    }

}


class Obstaculo{
    var property position
    const imagen
    method image() = imagen
    method avanzar(){
        if (self.position()!=game.at(0, self.position().y())){
            self.position(self.position().left(1))
        }
        else{
            self.position(game.at(80, self.position().y())) 
        }
        
    }
    method seChoco(){
        game.stop()
    }
}

object contador1 {

    const sprites = [
        "numero0.png",
        "numero1.png",
        "numero2.png",
        "numero3.png",
        "numero4.png",
        "numero5.png",
        "numero6.png",
        "numero7.png",
        "numero8.png",
        "numero9.png"
    ]

    //var currentSpriteIndex = 0
    // Método que devuelve la ruta del sprite actual
    method image() = sprites.get(puntaje)

    var property position = game.at(11,0)
    var puntaje = 0

    method aumentarPuntaje(){
        

    if(puntaje < 9)
    {
        puntaje += 1
        
        //contador2.image()
    }
    else
    {
        puntaje = 0
        contador2.aumentarPuntaje()
    }
    self.image()

    }
    
    //method image()= puntaje.toString() //+ ".png"

}

object contador2 {
    var property position = game.at(10,0)
    var puntaje = 0

const sprites = [
        "numero0.png",
        "numero1.png",
        "numero2.png",
        "numero3.png",
        "numero4.png",
        "numero5.png",
        "numero6.png",
        "numero7.png",
        "numero8.png",
        "numero9.png"
    ]

    // Método que devuelve la ruta del sprite actual
    method image() = sprites.get(puntaje)
    
    method aumentarPuntaje(){
        puntaje += 1
        self.image()
    
    }
    
    //method image()= puntaje.toString() //+ ".png"

}

object piso {
    var property position = game.at(0, 0)
    const imagen ="piso.png"
    method image() = imagen

}