import 'package:flutter/material.dart';

class mainMenu extends StatefulWidget{
  mainMenu({super.key});

  @override
  _mainMenuState createState() => _mainMenuState();
}

class _mainMenuState extends State<mainMenu>{
  @override
  Widget build(BuildContext context){
    return Scaffold(//estructura pantalla: AppBar y body
      body: body(),
      );
  }
}

Widget body(){
  return Container(
     decoration: BoxDecoration(
      image: DecorationImage(image: AssetImage('assets/fondomenuinicial.png'),
          fit: BoxFit.contain
      )
    ),
    child: Center(
      child: Column(
        children: [
          Image.asset('assets/play.png'),
          Image.asset('assets/exit.png')
        ],
      ),
    ),
  );
}