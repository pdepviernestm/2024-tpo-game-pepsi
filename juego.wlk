object lobo {
    var property position = game.at(10, 3)

    var sprite = "correr"

    var currentSpriteIndex = 1
    // Método que devuelve la ruta del sprite actual
    method image() = sprite + (currentSpriteIndex).stringValue() + ".png"

    // Método para mover el personaje y actualizar el sprite
    
    method correr() {
        if (sprite!="correr"){
            sprite="correr"
        }
        if(currentSpriteIndex>8){
            currentSpriteIndex=1
        }
        else{
            currentSpriteIndex+=1
        }
        // Asigna la nueva imagen para que el juego la use
        self.image()
    }

    method saltar() {
        if (sprite!="saltar"){
            sprite = "saltar"
            currentSpriteIndex = 1
            self.image()
            self.position(self.position().up(1))
            game.schedule(200, {self.position(self.position().up(1))})
            game.schedule(400, {self.position(self.position().down(1))})
            game.schedule(600, {self.position(self.position().down(1))})
        }
        else{
            if (currentSpriteIndex<7){
                currentSpriteIndex += 1
            }
            self.image()
        }
        
    }

}

class Contador{
    var property position
    var puntaje
    var objetoCreado = false
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

    method image() = sprites.get(puntaje)

    method aumentarPuntaje(){
    if(puntaje < 9)
    {
        puntaje += 1
    }
    else if(!objetoCreado)
    {
        puntaje = 0
        const nuevaCifra = new Contador (position = game.at(self.position().x() - 1 ,10), puntaje = 1)
        objetoCreado = true
    }
    else
    {
        puntaje = 0
        //nuevaCifra.aumentarPuntaje()
    }
    self.image()
    }

}

class Obstaculo{
    var property position
    const imagen
    method image() = imagen
    method avanzar(){
        if (self.position() != game.at(0, self.position().y())){
            self.position(self.position().left(1))
        }
        else{
            self.position(game.at(80, self.position().y())) 
        }
        
    }
}
/*
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
        unidadContador.aumentarPuntaje()
    }
    self.image()

    }
    
    //method image()= puntaje.toString() //+ ".png"

}
*/

object fantasma inherits Obstaculo(position = game.at(100,3), imagen = "fantasma.png") {
    var movimientoAuxiliar = 0
    override method avanzar(){
        if (self.position() != game.at(0, self.position().y()) && movimientoAuxiliar != 4 && movimientoAuxiliar != 8){
            self.position(self.position().left(1))
            movimientoAuxiliar += 1
        }
        else if(movimientoAuxiliar == 4){
            self.position(self.position().left(1))
            self.position(self.position().up(1))
            movimientoAuxiliar += 1
        }else if(movimientoAuxiliar == 8){
            self.position(self.position().left(1))
            self.position(self.position().down(1))
            movimientoAuxiliar = 0
        }else {
            self.position(game.at(80, self.position().y()))
        }

    }
}

class Piso {
    var property position
    const imagen ="piso.png"

    method desplazar(){
        if (self.position()!=game.at(-39, self.position().y())){
            self.position(self.position().left(1))
        }
        else {
            self.position(game.at(39, self.position().y())) 
        }
    }

    method image() = imagen

}

object inicio {
    var property position = game.at(16, 8)
    method image() = "start.png"
    var iniciado = false
    method estaIniciado() = iniciado

    method iniciar() {
      iniciado=true
    }

    method finalizar(){
        iniciado=false;
    }
}