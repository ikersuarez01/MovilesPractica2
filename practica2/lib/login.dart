

import 'package:flutter/material.dart';

class login extends StatefulWidget{
  login({super.key});

  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login>{
  @override
  Widget build(BuildContext context){
    return Scaffold(//estructura pantalla: AppBar y body
      body: body(),

      );

  }
}

Widget body(){
  return  Container(
    decoration: BoxDecoration(
      image: DecorationImage(image: AssetImage('assets/fondo_1.png'),
          fit: BoxFit.cover, repeat:


      )
    ),

      child: Center(
        child: Column(
          mainAxisAlignment :MainAxisAlignment.spaceBetween,

          children: <Widget>[
            Image.asset('assets/login_gato_pensativo.png'),
            usernameSpace(),
            botonContinuar(),
          ],

      ),
      ),


  );

}

Widget username(){
      return Container(

        child: Text("Inicia Sesión",
          style: TextStyle(
              color: Colors.black,
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
  ),
  ),
  );

}

Widget usernameSpace(){
  return Container(
padding: EdgeInsets.only(left: 20,right: 20,bottom:0),
      child: TextField(
        textAlign: TextAlign.center,
          decoration: InputDecoration(
              hintText: "Usuario",
              fillColor: Colors.white30,
              filled: false
          )
      ),
  );

}

Widget botonContinuar(){

  return Container(

padding: EdgeInsets.only(top:0,left: 250),
    child: IconButton(
      icon:  Image.asset('assets/flecha_login.png'),
      iconSize: 100.0,
      onPressed: () {

        //Navigator.push(
        // context,
        //   MaterialPageRoute(builder: (context) => login()),
        // );
      },

      ),




    );



}








