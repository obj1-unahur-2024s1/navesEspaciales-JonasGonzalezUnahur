class NaveBasica{
	var velocidad = 0
	var direccion = 0
	method velocidad() = velocidad
	method direccion() = direccion
	method acelerar(cuanto){
		velocidad = (velocidad + cuanto).min(100000)
	}
	method desacelerar(cuanto){
		velocidad = (velocidad - cuanto).max(0)
	}
	method irHaciaElSol(){
		direccion = 10
	}
	method escaparDelSol(){
		direccion = -10
	}
	method ponerseParaleloAlSol(){
		direccion = 0
	}
	method acercarseUnPocoAlSol(){
		direccion = (direccion + 1).min(10)
	}
	method alejarseUnPocoDelSol(){
		direccion = (direccion - 1).max(-10)
	}
}

class NaveBaliza inherits NaveBasica{
	var colorDeBaliza = "azul"
	method cambiarColorDeBaliza(colorNuevo){
		colorDeBaliza = colorNuevo
	}
}

class NaveDePasajeros inherits NaveBasica{
	const pasajeros = 50
	var racionesDeComida = 300
	var racionesDeBebida = 300
	method cargarRacionesDeComida(cantidad){
		racionesDeComida = racionesDeComida + cantidad
	}
	method descargarRacionesDeComida(cantidad){
		racionesDeComida = racionesDeComida - cantidad
	}
	method cargarRacionesDeBebida(cantidad){
		racionesDeBebida = racionesDeBebida + cantidad
	}
	method descargarRacionesDeBebida(cantidad){
		racionesDeBebida = racionesDeBebida - cantidad
	}
}

class NaveDeCombate inherits NaveBasica{
	var esInvisible = false
	var misilesDesplegados = false
	const mensajesEmitidos = []
	method ponerseVisible(){esInvisible = false}
	method ponerseInvisible(){esInvisible = true}
	method estaInvisible(){return esInvisible}
	method desplegarMisiles(){misilesDesplegados = true}
	method replegarMisiles(){misilesDesplegados = false}
	method misilesDesplegados(){return misilesDesplegados}
	method emitirMensaje(mensaje){
		mensajesEmitidos.add(mensaje)
		return mensaje
	}
	method mensajesEmitidos(){return mensajesEmitidos}
	method primerMensajeEmitido(){return mensajesEmitidos.first()}
	method ultimoMensajeEmitido(){return mensajesEmitidos.last()}
	method esEscueta(){
		return not mensajesEmitidos.any({m => m.size() >= 30})
	}
	method emitioMensaje(mensaje){
		return mensajesEmitidos.contains(mensaje)
	}
}