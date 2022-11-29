//#region Imports
import 'dart:convert';
import 'dart:async';
import 'dart:ui';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:practica2/EndGame.dart';
import 'package:practica2/ListaTest.dart';
import 'dart:math';
import 'main.dart';
import 'EndGame.dart';
import 'login.dart';
import 'user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dificultad.dart';

//#endregion

//#region Variables


var boxClosed = 'assets/open.png';
var boxOpened = 'assets/closed.png';

var random = Random();

int puntuacion = 0;
int tiempo = 0;
int vidas = 0;

List<int> boxList = List<int>.generate(numBoxes, (index) => 0, growable: false);

var boxHeight = 0.0;
var boxWidth = 0.0;

int numBoxes = 0;
int numCajas = 0;

bool stopTimer= false;
//#endregion

//#region Crear Escenario
  void CrearEscenario(){

    vidas = 3;
    puntuacion = 0;
    tiempo = 0;

    stopTimer = false;

    switch(dif){
      case 0:{
        boxHeight = 150.0;
        boxWidth = 150.0;
        numBoxes = 2*2;
        numCajas = 2;
        boxList = List<int>.generate(numBoxes, (index) => 0, growable: false);
      }
      break;
      case 1:{
        boxHeight = 120.0;
        boxWidth = 120.0;
        numBoxes = 3*3;
        numCajas = 3;
        boxList = List<int>.generate(numBoxes, (index) => 0, growable: false);
        boxList[0] = 2;
      }
      break;
      case 2:{
        boxHeight = 90.0;
        boxWidth = 90.0;
        numBoxes = 4*4;
        numCajas = 4;
        boxList = List<int>.generate(numBoxes, (index) => 0, growable: false);
      }
    }
  }
//#endregion

//#region Inicio Pantalla

void main() {
  runApp(PantallaJuego());


}

class PantallaJuego extends StatelessWidget {

  const PantallaJuego({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    CrearEscenario();
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

  late SharedPreferences sharedPreferences;
  /*var boxHeight = 0.0;
  var boxWidth = 0.0;

  int numBoxes = 0;
  int numCajas = 0;*/

//  List<int> boxList = List<int>.generate(1, (index) => 0, growable: false);
  List<int> boxIndexList = List<int>.generate(1, (index) => 0, growable: false);



  //#region Funciones Juego

    //#region Cargar Y Guardar Datos

  void cargarDatosIniciales() async{
    sharedPreferences = await SharedPreferences.getInstance();

    for(int i = 0 ; i < 8; i++){
      Map<String,dynamic> jsondatais = jsonDecode(sharedPreferences.getString(i.toString())!);

      user player = user.fromJson(jsondatais);
      if(jsondatais.isNotEmpty){
        ListaRanking[i] = player;
      }
    }
    ListaRanking.add(new user(finalUserName, puntuacion.toString(), tiempo.toString()));
    ListaRanking.sort((a,b) => int.parse(b.puntuacion).compareTo(int.parse(a.puntuacion)));
  }

  void guardarDatos() async{
    sharedPreferences = await SharedPreferences.getInstance();

    for(int i = 0; i < 8; i++){
      String userdata = jsonEncode(ListaRanking[i]);
      sharedPreferences.setString(i.toString(), userdata);
    }
  }

  //#endregion

    //#region Timer

    int aux = 0;
    int aux2 = 0;
    bool secondBox = false;

    @override
    void initState() {

      super.initState();
      player.play(AssetSource('gameplay.mp3'));
      Timer(Duration(seconds: 10),(){
        setState(() {
          secondBox = true;
        });
      });

      //#region Periodic Timer 1
      final periodicTimer = Timer.periodic(
        Duration(seconds: random.nextInt(3)),
            (Timer t) {
              setState(() {
                if(stopTimer) t.cancel();
                if(boxList[aux] == 1){
                  RestaVida();
                }
                boxList[aux] = 0;
                aux = random.nextInt(numBoxes);
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
      //#endregion

      //#region Periodic Timer 2
      final periodicTimer2 = Timer.periodic(
        Duration(seconds: random.nextInt(4)),
            (Timer t) {
          setState(() {
            if(stopTimer) t.cancel();
            if(secondBox){
              if(boxList[aux2] == 1){
                RestaVida();
              }
              boxList[aux2] = 0;
              aux2 = random.nextInt(numBoxes);
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
      //#endregion

      //#region Timer reloj
      final timerReloj = Timer.periodic(
        Duration(seconds: 1),
            (Timer t) {
          setState(() {
            if(stopTimer) t.cancel();
            tiempo++;
          });
        },
      );
      //#endregion
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
            ui.play(AssetSource('maullido.mp3'));
            puntuacion++;
            boxList[index] = 0;
          }
          break;
          case 2:{
            ui.play(AssetSource('perro.mp3'));
            RestaVida();
            boxList[index] = 0;
          }
          break;
          case 3:{
            ui.play(AssetSource('pez.mp3'));
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
      List<Widget> CreadorColumnas(int index){
        List<Widget> listColumnAux = List<Widget>.generate(1, (index) => Row(), growable: true);
        for(int i = 0; i < numCajas; i++){
          listColumnAux.add(BoxInit(index*numCajas+i));
        }
        return listColumnAux;
      }
    //endregion

    //#region Creador de Filas
      List<Widget> CreadorRows(){
        List<Widget> listRowAux = List<Widget>.generate(1, (index) => Row(), growable: true);
        for(int i = 0; i < numCajas; i++){
          listRowAux.add(new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: CreadorColumnas(i),
          ));
        }
        return listRowAux;
      }
    //#endregion

    //#region Estructura Filas
      Row CreadorFilas(){
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: CreadorRows(),
        );
      }
    //#endregion

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
      if(!stopTimer){
        stopTimer = true;
        cargarDatosIniciales();
        guardarDatos();
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return EndGame(puntuacion, tiempo);
        }));
      }
    } else {
      vidas--;
      if(vidas <= 0){
        if(!stopTimer){
          stopTimer = true;
          cargarDatosIniciales();
          guardarDatos();
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return EndGame(puntuacion, tiempo);
          }));
        }
      }
    }
  }
  //#endregion

    //#region Barra Botones Home y Ajustes
  SizedBox BotonesTopBar(){
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[/*
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
        */],
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

  //#endregion

  //#region Body y AppBar
  @override
  Widget build(BuildContext context) {
      //CrearEscenario();
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
                Expanded(child: CreadorFilas())
              ],
            )
        )
    );
  }
  //#endregion
}



//#endregion

