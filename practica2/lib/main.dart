import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:practica2/login.dart';
import 'package:practica2/mainMenu.dart';
import 'package:soundpool/soundpool.dart';


//PANTALLA DE INICIO
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) { //widget es la view en flutter
    return MaterialApp(
      title: 'Michial', //titulo de la app
      home: Inicio(), //el widget que va a mostrar
      );
  }
}

class Inicio extends StatefulWidget{
  Inicio({super.key});

  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio>{

  @override
  Widget build(BuildContext context){
    return Scaffold(//estructura pantalla: AppBar y body
      body: Center(
          child: portada(context)),
    );
  }
}

Widget portada(BuildContext context){

    return Container(
    decoration: BoxDecoration(
      image: DecorationImage(image: AssetImage('assets/fondoinicio.png'), //aquí va la imagen de fondo
      fit: BoxFit.cover)),
    //child: AssetImage('assets/fondoinicio.png'),
    child: 
      Center(
        child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                _sound("assets/botones.mp3");
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => login()),
            );
              },
              child: Image.asset('assets/logo.png'),
            ),
            TextButton(
              onPressed: () {

                /*Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => mainMenu()),
            );*/
              },
              child: Text("Pantalla de Inicio"),
            )
          ],
        )
         ),
         );


      }
      
      Future<void> _sound(ruta) async {
        Soundpool pool = Soundpool(streamType: StreamType.notification);

    int soundId = await rootBundle.load(ruta).then((ByteData soundData) {
                  return pool.load(soundData);
                });
    int streamId = await pool.play(soundId);
    print("sonido");
      }

/*TextButton(
          onPressed: (){
            //aquí lo que ocurra al pulsar
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => login()),
            );
            const Text("AplastaMichis");
          },
        child: Image.asset("assets/logo.png")
        ,


        )*/