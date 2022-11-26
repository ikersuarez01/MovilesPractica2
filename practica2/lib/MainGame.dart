//#region Imports

import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'dart:math';
import 'main.dart';

//#endregion

//#region Variables
var boxHeight = 120.0;
var boxWidth = 120.0;

var boxClosed = 'assets/open.png';
var boxOpened = 'assets/closed.png';

int numBoxes = 9;

List<int> boxList = List<int>.generate(numBoxes, (index) => 0, growable: false);
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

    int aux = 0;
    int aux2 = 0;
    bool secondBox = false;
    void CajaRandom(int aux){

    }

    @override
    void initState() {
      super.initState();

      Timer(Duration(seconds: 10),(){
        setState(() {
          secondBox = true;
        });
      });
      final periodicTimer = Timer.periodic(
        Duration(seconds: random.nextInt(3)),
            (Timer t) {
              setState(() {
                if(boxList[aux] == 1){
                  RestaVida();
                }
                boxList[aux] = 0;
                aux = random.nextInt(9);
                int a = random.nextInt(100);
                if(boxList[aux] == 1){
                  return;
                }
                if(a <= 65){
                  boxList[aux] = 1;
                } else if(a <= 95){
                  boxList[aux] = 2;
                }else if(a <= 100){
                  boxList[aux] = 3;
                }
              });
        },
      );
      final periodicTimer2 = Timer.periodic(
        Duration(seconds: random.nextInt(4)),
            (Timer t) {
          setState(() {
            if(secondBox){
              if(boxList[aux2] == 1){
                RestaVida();
              }
              boxList[aux2] = 0;
              aux2 = random.nextInt(9);
              int a = random.nextInt(100);
              if(boxList[aux2] == 1){
                return;
              }
              if(a <= 65){
                boxList[aux2] = 1;
              } else if(a <= 95){
                boxList[aux2] = 2;
              }else if(a <= 100){
                boxList[aux2] = 3;
              }
            }
          });
        },
      );
    }

    //#endregion

    //#region Cambiar el sprite de la caja

    void ChangeBoxSprite(int index){
      setState(() {
        switch(boxList[index]){
          case 0: {

          }
          break;
          case 1: {
            puntuacion++;
            boxList[index] = 0;
          }
          break;
          case 2:{
            RestaVida();
            boxList[index] = 0;
          }
          break;
          case 3:{
            SumaVida();
            boxList[index]= 0;
          }
          break;
        }
      });
    }

    //#endregion

    //#region Poner imagen
    Widget setImage(int index){
      switch(boxList[index]){
        case 0:{
          return Image(
              image: AssetImage('assets/CajaCerrada.png'));
        }
        break;
        case 1:{
          return Image(
              image: AssetImage('assets/CajaAbierta.png'));
        }
        break;
        case 2:{
          return Image(
              image: AssetImage('assets/Perro.png'));
        }
        break;
        case 3:{
          return Image(
              image: AssetImage('assets/Pez.png'));
        }
        break;
      }
      return Image(
          image: AssetImage('assets/5.png'));

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
            child: setImage(boxIndex)
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

    //#region Sumar  y restar vidas

    void SumaVida(){
      if(vidas >= 3){
        return;
      } else {
        vidas++;
      }
    }

    void RestaVida(){
      if(vidas <= 0){
        print('HAS MUERTO');
      } else {
        vidas--;
      }
    }
    //#endregion

    //#region Cajas Gameplay
    Row CajasGameplay(){
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          ColumnInit(0, 3, 6),
          ColumnInit(1, 4, 7),
          ColumnInit(2, 5, 8)
        ],
      );
    }
    //#endregion

    //#region Barra Botones Home y Ajustes
    SizedBox BotonesTopBar(){
      return SizedBox(
        height: MediaQuery.of(context).size.height * 0.2,
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

    //#region Barra Puntuacion y vidas
    SizedBox ScoreBar(){
      return SizedBox(
          height: MediaQuery.of(context).size.height * 0.15,
          child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/scoreingame.png'),
                    fit:BoxFit.cover,
                  )
              ),
              child: Padding(
                  padding: EdgeInsets.only(top:20,left: MediaQuery.of(context).size.width * 0.1,right: MediaQuery.of(context).size.width * 0.1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Text(
                          '$vidas',
                          style: TextStyle(fontSize: 40, fontFamily: 'Courier New', fontWeight: FontWeight.bold)
                      ),
                      Text(
                          '$puntuacion',
                          style: TextStyle(fontSize: 40, fontFamily: 'Courier New', fontWeight: FontWeight.bold)
                      )

                    ],
                  )
              )
          )
      );
    }

    //#endregion

  //#endregion

  //#region Body y AppBar
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/gameplay2.png'),
              fit:BoxFit.cover,
            )
          ),
          child: Column(
              children: <Widget>[
                BotonesTopBar(),
                ScoreBar(),
                Expanded(child: CajasGameplay())
              ],
            )
        )
    );
  }
  //#endregion
}



//#endregion

