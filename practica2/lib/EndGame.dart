//#region imports
import 'dart:async';
import 'dart:ui';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:practica2/ajustes.dart';
import 'dart:math';
import 'main.dart';
import 'ListaTest.dart';
import 'user.dart';
import 'Ranking.dart';
import 'ajustes.dart';

//#endregion


//#region Variables
List <user> ListaRanking = List<user>.generate(9, (index) => new user('', '0', '0'),growable: true );


//#endregion

//#region Init pantalla

/*void main(){
  runApp(EndGame(99,100));
}*/

class EndGame extends StatelessWidget {
  int puntuacion;
  int tiempo;
  EndGame(this.puntuacion, this.tiempo);
  
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Puntuacion endgame",
      home: Inicio(puntuacion,tiempo),
    );
  }
}

class Inicio extends StatefulWidget {
  int puntuacion;
  int tiempo;
  Inicio(this.puntuacion, this.tiempo);

  @override
  State<Inicio> createState() => _InicioState();
}

//#endregion

//#region Creacion Pantalla
class _InicioState extends State<Inicio> {


  //#region Barra Botones Home , Ajustes, Ranking
  SizedBox BotonesTopBar(){
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.13,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            child: IconButton(
              icon: Image.asset('assets/home.png'),
              iconSize: 100,
              onPressed: (){
                ui.play(AssetSource('botones.mp3'));
                Navigator.push(context, MaterialPageRoute(builder: (context) => const MyApp()));
              },
            ),
          ),
          Container(
            child: IconButton(
              icon: Image.asset('assets/ranking.png'),
              iconSize: 150,
              onPressed: (){
                ui.play(AssetSource('botones.mp3'));
                player.play(AssetSource('music.mp3'));
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Ranking()));
              },
            ),
          ),
          Container(
            child: IconButton(
              icon: Image.asset('assets/boton_ajustes.png'),
              iconSize: 100,
              onPressed: (){
                ui.play(AssetSource('botones.mp3'));
                Navigator.push(context,MaterialPageRoute(builder: (context) => ajustes()));
                },
            ),
          )
        ],
      ),
    );
  }
  //#endregion

  //#region Reloj y Puntuacion
  SizedBox RelojBar(){
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.16,
      width: MediaQuery.of(context).size.width * 0.70,
      child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              alignment: Alignment.center,
              child: Row(
                children: [
                  Image(image: AssetImage('assets/reloj.png')),
                  Text(
                      (widget.tiempo/60).floor().toString() + ':' + (widget.tiempo-(widget.tiempo/60).floor()*60).toString(),
                      style: TextStyle(fontSize: 30, fontFamily: 'Courier New', fontWeight: FontWeight.bold)
                  )
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Row(
                children: [
                  Image(
                      image: AssetImage('assets/numerogatos.png')
                  ),
                  Text(
                      widget.puntuacion.toString(),
                      style: TextStyle(fontSize: 30, fontFamily: 'Courier New', fontWeight: FontWeight.bold)
                  )
                ],
              ),
            )
          ],
        ),
      );
  }
  //endregion

  //#region Gato Sprite
  Container GatoWin(){
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/GatoWin.png'),
              fit:BoxFit.contain,
            )
        )
    );
  }
  //#endregion

  //#region BUILD
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/fondo_1_claro.png'),
                fit:BoxFit.fill,
              )
          ),
        child: Column(
          children: <Widget>[
            BotonesTopBar(),
            RelojBar(),
            Expanded(child: GatoWin())
          ],
        )
      )
    );
  }
  //endregion
}
//#endregion

