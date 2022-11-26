//#region imports
import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'dart:math';
//#endregion

//#region Init pantalla
void main(){
  runApp(EndGame());

}

class EndGame extends StatelessWidget {
  const EndGame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Puntuacion endgame",
      home: Inicio(),
    );
  }
}

class Inicio extends StatefulWidget {
  const Inicio({Key? key}) : super(key: key);

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
              onPressed: (){},
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

  SizedBox RelojBar(){
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.16,
      child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              child: Row(
                children: [
                  Image(image: AssetImage('assets/reloj.png')),
                  Text(
                      '0:22',
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
                      'x5',
                      style: TextStyle(fontSize: 30, fontFamily: 'Courier New', fontWeight: FontWeight.bold)
                  )
                ],
              ),
            )
          ],
        ),
      );
  }

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
}
//#endregion

