class NaveBasica {
	var velocidad = 100
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
		direccion = (direccion - 1).min(-10)
	}
}
