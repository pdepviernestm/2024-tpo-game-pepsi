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
        self.position(self.position().left(1))
    }
    method seChoco(){
        game.stop()
    }
}
object score{
    var property position = game.at(19,35)

    const imagen = "score.png"
    method image() = imagen
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

    var currentSpriteIndex = 0
    // Método que devuelve la ruta del sprite actual
    method image() = sprites.get(currentSpriteIndex)

    var property position = game.at(17,36)
    var puntaje = 0

    method aumentarPuntaje(){
        puntaje += 1

    if(puntaje % 10)
    {
        currentSpriteIndex += 1
        self.image()
        contador2.image()
    }
    else
    {
        currentSpriteIndex = 0
        contador2.aumentarPuntaje()
    }
    }
    
    //method image()= puntaje.toString() //+ ".png"

}

object contador2 {
    var property position = game.at(16,36)
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

    var currentSpriteIndex = 0
    // Método que devuelve la ruta del sprite actual
    method image() = sprites.get(currentSpriteIndex)
    
    method aumentarPuntaje(){
        puntaje += 1
        currentSpriteIndex += 1
        self.image()
    }
    
    //method image()= puntaje.toString() //+ ".png"

}

object piso {
    var property position = game.at(0, 0)
    const imagen ="piso.png"
    method image() = imagen

}