



import 'package:flutter/material.dart';
import 'package:practica2/main.dart';
import 'package:practica2/mainMenu.dart';
import 'package:flutter/services.dart';
import 'package:practica2/login.dart';
import 'dart:async';
import 'dart:math';
import 'package:shared_preferences/shared_preferences.dart';


bool a=false;
TextEditingController _userController = TextEditingController();
String finalUserName="";
bool changeCat=false;
//List<int> boxList = List<int>.generate(5, (index) => 0, growable: false);
List<String> players= List<String>.empty();
List<int> time= List<int>.empty();
List<int> pp= List<int>.empty();

class login extends StatefulWidget{


  login({super.key});

  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login>{

  TextEditingController _nombre = TextEditingController();
  TextEditingController _puntuacion = TextEditingController();
  TextEditingController _tiempo = TextEditingController();
  @override


void initState(){
    super.initState(); //sin esto no funciona la persistencia, no se actualiza el estado al entrar
 setState(() {
   cargarDatosIniciales();
 });

  }


 // }
  @override
  Widget build(BuildContext context){
   /* if(changeCat)
    {*/

      return Scaffold(//estructura pantalla: AppBar y body

        body: body(context),

      );

    }







 void cargarDatosIniciales() async{
    SharedPreferences a = await SharedPreferences.getInstance();
    //_changeList(players.first, time.first, pp.first);
  //  Partida(players.first,time.first,pp.first);
  }
}






Widget body(BuildContext context){

    return  Container(

      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/Mesa de trabajo 1.png'),
            fit: BoxFit.cover,
          )
      ),



      child: Center(

        child: Column(

          mainAxisAlignment :MainAxisAlignment.start,

          children: <Widget>[

            Row(

                children: [

                  botonHome(context),
                  botonOpciones(context),


                ]
            ),

            usernameSpace(context),
            botonContinuar(context),
            messageText(),





          ],

        ),
      ),


    );

  }



Widget usernameSpace(BuildContext context){
  return Container(
padding: EdgeInsets.only(left: 90,right: 90,top:345),
      child: TextFormField(
        controller: _userController,
        textAlign: TextAlign.start,
       // textInputAction: TextInputAction.values.,
          keyboardType: TextInputType.name,


    style: TextStyle(
      fontFamily: 'Counter new'
    ),
          maxLength: 10,

          decoration: InputDecoration(

              hintText: "Usuario *",
              fillColor: Colors.black,
              filled: false
          )

      ),
  );

}

Widget botonContinuar(BuildContext context){

  return Container(

padding: EdgeInsets.only(top:0,left: 300),

    child: Column(
      children: <Widget> [
        IconButton(
          icon: Image.asset('assets/flecha_login.png'),
          iconSize: 150.0,
          onPressed: () {
            


            if(_userController.text.length>=3){
            a=false;
              finalUserName=_userController.text;
              _userController.text="";

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => mainMenu()),

              );
            a=false;
            }else{
             a=true;

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => login()),

              );

            }

          },


            )


      ],






      ),




    );



}

Widget messageText(){
  if(a){

    return Text('PLEASE ENTER AT LEAST 3 CHARACTERS',
      selectionColor: Colors.pink,
      textScaleFactor: 1.5,
      textAlign: TextAlign.center,

    );

  }else{
    return Text('');
  }

}




Widget botonOpciones(BuildContext context){

  return Container(

    padding: EdgeInsets.only(top:0,left: 100),

    child: Column(
      children: <Widget> [
        IconButton(
          icon: Image.asset('assets/botonajustes.png'),
          iconSize: 80.0,
          onPressed: () {



              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => mainMenu()),
              );
            },




        ),


      ],






    ),




  );



}
Widget botonHome(BuildContext context){

  return Container(

    padding: EdgeInsets.only(top:0,right: 100),

    child: Column(
      children: <Widget> [
        IconButton(
          icon: Image.asset('assets/flechamainmenu.png'),
          iconSize: 80.0,
          onPressed: () {
          _userController.text="";

            a=false;
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyApp()),
            );
          },



        ),


      ],






    ),




  );



}





void _changeList(String player, int time, int pp) async{
  SharedPreferences prefs = await SharedPreferences.getInstance(); //para activar la persistencia

  prefs.setInt("time", time); //almacenar en tiempo de ejecucion datos persistencia
  prefs.setInt("pp", pp); //almacenar en tiempo de ejecucion datos persistencia
  prefs.setString("player", player); //almacenar...
}