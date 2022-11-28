

class user{
String nombre,puntuacion,tiempo;

user(this.nombre,this.puntuacion,this.tiempo);

//este es el constructor que convierte un json en una instancia de objeto
user.fromJson(Map<String, dynamic> json) :
      nombre = json['nombre'],
      puntuacion =json['puntuacion'],
      tiempo = json['tiempo'];
//Un metodo que convierte el objeto a un string json:
Map<String, dynamic> toJson()=>{
  'nombre':nombre,
  'puntuacion':puntuacion,
  'tiempo':tiempo
};




}