import 'package:flutter/material.dart';
import 'package:practica2/MainGame.dart';
import 'package:practica2/dificultad.dart';

class mainMenu extends StatefulWidget{
  mainMenu({super.key});

  @override
  _mainMenuState createState() => _mainMenuState();
}

class _mainMenuState extends State<mainMenu>{
  @override
  Widget build(BuildContext context){
    return Scaffold(//estructura pantalla: AppBar y body
      body: body(context),
      );
  }
}

Widget body(BuildContext context){
  return Container(
     decoration: BoxDecoration(
      image: DecorationImage(image: AssetImage('assets/fondomenuinicial.png'),
          fit: BoxFit.cover
      )
    ),
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
              onPressed: () {
                /*Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MainGame()),
            );*/
              },
              child: Image.asset('assets/play.png'),
            ),
          TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PantallaJuego()),
            );
              },
              child: Image.asset('assets/exit.png'),
            ),
        ],
      ),
    ),
  );
}