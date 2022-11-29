//#region imports
import 'dart:async';
import 'dart:ui';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'main.dart';
import 'ListaTest.dart';
import 'EndGame.dart';

//#endregion

//#region Variables

double fontTitleSize = 22;
double fontTableSize = 25;
double fontTableNameSize = 18;

//#endregion

//#region INIT APP
void main(){
  runApp(Ranking());
}

class Ranking extends StatelessWidget {
  const Ranking({Key? key}) : super(key: key);

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

//#region BODY APP

class _InicioState extends State<Inicio> {

  //#region Barra Botones Home , Ajustes, Ranking
  SizedBox BotonesTopBar(){
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.23,
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
              icon: Image.asset('assets/boton_ajustes.png'),
              iconSize: 100,
              onPressed: (){
                ui.play(AssetSource('botones.mp3'));
              },
            ),
          )
        ],
      ),
    );
  }
  //#endregion

  //#region TABLA RANKING
  Table TablaRanking(){
    return Table(
     defaultVerticalAlignment: TableCellVerticalAlignment.middle,
     border: TableBorder.all(
       color: const Color(0XFF000000),
       width: 3,
       style: BorderStyle.solid, 
       borderRadius: BorderRadius.all(Radius.circular(10)),
     ),
     columnWidths: {
       0: FractionColumnWidth(0.5)
     },
     children: [
       TableRow(
         decoration: BoxDecoration(
           color: const Color(0xFF3D1308)
         ),
         children: [
           Container(
             height: MediaQuery.of(context).size.height*0.1,
            alignment: Alignment.center,
            child: Text(
                'NAME',
                style: TextStyle(fontSize: fontTitleSize, fontFamily: 'Courier New', fontWeight: FontWeight.bold, color: const Color(0xFFFBB06D))
            ),
           ),
           Container(
             alignment: Alignment.center,
             child: Text(
               'SCORE',
                style: TextStyle(fontSize: fontTitleSize, fontFamily: 'Courier New', fontWeight: FontWeight.bold, color: const Color(0xFFFBB06D))
             ),
           ),
           Container(
             alignment: Alignment.center,
             child: Text(
                 'TIME',
                 style: TextStyle(fontSize: fontTitleSize, fontFamily: 'Courier New', fontWeight: FontWeight.bold, color: const Color(0xFFFBB06D))
             ),
           )
         ]
       ),
       FilaTabla(0),
       FilaTabla(1),
       FilaTabla(2),
       FilaTabla(3),
       FilaTabla(4),
       FilaTabla(5),
       FilaTabla(6),
       FilaTabla(7),
       FilaTabla(8),
     ],
    );
  }
  //#endregion

  //#region FILA TABLA

  TableRow FilaTabla(int listaIndex){
    //if(ListaRanking[listaIndex] == null) ListaRanking[listaIndex] = new Partida('', 0, 0);
    return TableRow(
        decoration: BoxDecoration(
            color: const Color(0xFFFBB06D)
        ),
      children: [
        Container(
          height: MediaQuery.of(context).size.height*0.06,
          alignment: Alignment.center,
          child: Text(
              ListaRanking[listaIndex].nombre,
              style: TextStyle(fontSize: fontTableNameSize, fontFamily: 'Courier New', fontWeight: FontWeight.bold)
          ),
        ),
        Container(
          alignment: Alignment.center,
          child: Text(
              ListaRanking[listaIndex].puntuacion,
              style: TextStyle(fontSize: fontTableSize, fontFamily: 'Courier New', fontWeight: FontWeight.bold)
          ),
        ),
        Container(
          alignment: Alignment.center,
          child: Text(
              ListaRanking[listaIndex].tiempo,
              style: TextStyle(fontSize: fontTableSize, fontFamily: 'Courier New', fontWeight: FontWeight.bold)
          ),
        )
      ]
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
                Expanded(
                    child: Container(
                        padding: EdgeInsets.only(
                            left:MediaQuery.of(context).size.width * 0.06,
                            right: MediaQuery.of(context).size.width * 0.06
                        ),
                      child: TablaRanking(),

                    ))

              ],
            )
        )
    );
  }
  //#endregion
}

//endregion
