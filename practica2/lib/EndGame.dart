//#region imports
import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'dart:math';
import 'main.dart';
import 'ListaTest.dart';

//#endregion


//#region Variables
final ListaRanking = List<Partida>.filled(9, new Partida('', 0, 0));


//#endregion

//#region Init pantalla

/*void main(){
  runApp(EndGame(99,100));
}*/

void AddRanking(){
  ListaRanking.add(new Partida('IKER', 0, 78));
  ListaRanking.add(new Partida('ERIS', 1459, 12));
  ListaRanking.add(new Partida('ED', 69, 69));
  
}

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
                Navigator.push(context, MaterialPageRoute(builder: (context) => const MyApp()));
              },
            ),
          ),
          Container(
            child: IconButton(
              icon: Image.asset('assets/ranking.png'),
              iconSize: 150,
              onPressed: (){},
            ),
          ),
          Container(
            child: IconButton(
              icon: Image.asset('assets/boton_ajustes.png'),
              iconSize: 100,
              onPressed: (){},
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
