class NaveBasica{
	var velocidad = 0
	var direccion = 0
	var combustible = 0
	method velocidad() = velocidad
	method direccion() = direccion
	method combustible() = combustible
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
	method cargarCombustible(cantidad){combustible += cantidad}
	method descargarCombustible(cantidad){combustible -= cantidad}
	method prepararViaje(){
		self.cargarCombustible(30000)
		self.acelerar(5000)
	}
	method estaTranquila(){
		return combustible >= 4000 && velocidad < 12000
	}
	method escapar(){}
	method avisar(){}
	method recibirAmenaza(){
		self.escapar()
		self.avisar()
	}
	method estaDeRelajo(){
		return self.estaTranquila()
	}
}

class NaveBaliza inherits NaveBasica{
	var colorDeBaliza = "rojo"
	var primerColor = "rojo"
	method cambiarColorDeBaliza(colorNuevo){
		colorDeBaliza = colorNuevo
	}
	override method prepararViaje(){
		super()
		self.cambiarColorDeBaliza("verde")
		self.ponerseParaleloAlSol()
	}
	override method estaTranquila(){
		return super() && colorDeBaliza != "rojo"
	}
	override method escapar(){
		super()
		self.irHaciaElSol()
	}
	override method avisar(){
		super()
		self.cambiarColorDeBaliza("rojo")
	}
	override method estaDeRelajo(){
		return super() && colorDeBaliza == primerColor
	}
}

class NaveDePasajeros inherits NaveBasica{
	const pasajeros = 50
	var racionesDeComida = 300
	var racionesDeBebida = 300
	var comidaServida = 0
	method cargarRacionesDeComida(cantidad){
		racionesDeComida = racionesDeComida + cantidad
	}
	method descargarRacionesDeComida(cantidad){
		racionesDeComida = racionesDeComida - cantidad
	}
	method servirComida(cantidad){
		comidaServida += cantidad
		self.descargarRacionesDeComida(cantidad)
	}
	method cargarRacionesDeBebida(cantidad){
		racionesDeBebida = racionesDeBebida + cantidad
	}
	method descargarRacionesDeBebida(cantidad){
		racionesDeBebida = racionesDeBebida - cantidad
	}
	override method prepararViaje(){
		super()
		self.cargarRacionesDeComida(4 * pasajeros)
		self.cargarRacionesDeBebida(6 * pasajeros)
		self.acercarseUnPocoAlSol()
	}
	override method escapar(){
		super()
		self.acelerar(velocidad * 2)
	}
	override method avisar(){
		super()
		self.descargarRacionesDeComida(pasajeros)
		self.descargarRacionesDeBebida(pasajeros * 2)
	}
	override method estaDeRelajo(){
		return super() && comidaServida >= 50
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
	method emitirMensaje(mensaje){mensajesEmitidos.add(mensaje)}
	method mensajesEmitidos(){return mensajesEmitidos}
	method primerMensajeEmitido(){return mensajesEmitidos.first()}
	method ultimoMensajeEmitido(){return mensajesEmitidos.last()}
	method esEscueta(){
		return not mensajesEmitidos.any({m => m.size() >= 30})
	}
	method emitioMensaje(mensaje){
		return mensajesEmitidos.contains(mensaje)
	}
	override method prepararViaje(){
		self.ponerseInvisible()
		self.replegarMisiles()
		super()
		self.acelerar(15000)
		self.emitirMensaje("Saliendo en mision")
	}
	override method estaTranquila(){
		return super() && not misilesDesplegados 
	}
	override method escapar(){
		super()
		self.acercarseUnPocoAlSol()
		self.acercarseUnPocoAlSol()
	}
	override method avisar(){
		super()
		self.emitirMensaje("Amenaza recibida")
	}
	override method estaDeRelajo(){
		return super() && self.esEscueta()
	}
}

class NaveHospital inherits NaveDePasajeros{
	var quirofanosPreparados = true
	override method estaTranquila(){
		return super() && not quirofanosPreparados 
	}
	override method recibirAmenaza(){
		super()
		quirofanosPreparados = true
	}
}

class NaveDeCombateSigilosa inherits NaveDeCombate{
	override method estaTranquila(){
		return super() && not esInvisible
	}
	override method escapar(){
		super()
		self.desplegarMisiles()
		self.ponerseInvisible()
	}
}