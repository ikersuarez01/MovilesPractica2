//#region Imports

import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:math';

//#endregion

//#region Variables
var boxHeight = 100.0;
var boxWidth = 100.0;

var boxClosed = 'assets/open.png';
var boxOpened = 'assets/closed.png';

int numBoxes = 9;

List<bool> isClosed = List<bool>.generate(numBoxes, (index) => true, growable: false);
var random = Random();

int puntuacion = 0;

int vidas = 3;
//#endregion

//#region Inicio Pantalla

void main() {
  runApp(PantallaJuego());

}



class PantallaJuego extends StatelessWidget {
  const PantallaJuego({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "MICHIMATAGATOS",
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

//#region Creación pantalla

class _InicioState extends State<Inicio> {

  //#region Funciones Juego

    //#region Timer

    @override
    void initState() {
      super.initState();
      final periodicTimer = Timer.periodic(
        Duration(seconds: random.nextInt(3)),
            (Timer t) {
              setState(() {
                isClosed[random.nextInt(8)] = false;
              });
        },
      );
    }

    //#endregion

    //#region Cambiar el sprite de la caja

    void ChangeBoxSprite(int boolIndex){
      setState(() {
        if(!isClosed[boolIndex]) {
          isClosed[boolIndex] = true;
          puntuacion++;
        }
      });
    }

    //#endregion

    //#region Creador de cajas

    Widget BoxInit (int boxIndex){
      return GestureDetector(
        onTap: (){
          ChangeBoxSprite(boxIndex);
        },
        child: Container(
            height: boxHeight,
            width: boxWidth,
            child: isClosed[boxIndex]
                ?Image.asset('assets/closed.png')
                :Image.asset('assets/open.png')
        ),
      );
    }

    //#endregion

    //region Creador de Columnas

    Widget ColumnInit(int box_1, int box_2, int box_3){
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          BoxInit(box_1),
          BoxInit(box_2),
          BoxInit(box_3)
        ],
      );
    }

    //endregion

  //#endregion

  //#region Body y AppBar
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MATAGATOS"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
              child: Text('$puntuacion'),
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              ColumnInit(0, 3, 6),
              ColumnInit(1, 4, 7),
              ColumnInit(2, 5, 8)
            ],
          )
          ],
      )
    );
  }
  //#endregion

}

//#endregion

