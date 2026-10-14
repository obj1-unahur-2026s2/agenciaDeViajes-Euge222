
class Pack {
  const property duracion
  const property precioBase
  const property coordinador
  const property beneficios = []

  method beneficiosVigentes() = beneficios.filter({ beneficio => beneficio.estaVigente() })
  method costoDeBeneficios() = self.beneficiosVigentes().sum({ beneficio => beneficio.costo() })
  method precioFinal() = precioBase + self.costosDeBeneficios()
}

class PackNacional inherits Pack {
  const property destino
  const property actividades = []

  method esPremium() = duracion>20 && coordinador.esAltamenteCalificado()
}
class PackProvincial inherits PackNacional{

}

class PackInternacional inherits Pack {
  const property pais
  const property cantidadEscalas
  const property lugarDeInteres
}


class Coordinador {
  const property viajesRealizados
  const property estaMotivado
  const property añosDeExperiencia
  var property rol
  
  method cambiarRol(unRol) {
    if(!rolesValidos.esRolValido(unRol)){
      self.error("El rol asignado no es válido")
    }
    rol = unRol
  }
}
object rolesValidos {
  const property roles = ["guía", "asistenteLogístico", "acompañante"]
  method esRolValido(unRol) = roles.contains(unRol)
}
class Beneficio {
  const property tipo
  const property costo
  const property estaVigente
}