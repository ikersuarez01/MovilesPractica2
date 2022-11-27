



import 'package:flutter/material.dart';
import 'package:practica2/main.dart';
import 'package:practica2/mainMenu.dart';
import 'package:flutter/services.dart';
import 'package:practica2/login.dart';
bool a=false;
final TextEditingController _userController = TextEditingController();
String finalUserName="";
List<int> boxList = List<int>.generate(5, (index) => 0, growable: false);

class login extends StatefulWidget{


  login({super.key});

  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login>{


  @override
  Widget build(BuildContext context){

  return Scaffold(//estructura pantalla: AppBar y body

    body: body(context),

  );





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
/*Widget username(){
      return Container(

        child: Text("Inicia Sesión",
          style: TextStyle(
              color: Colors.black,
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
  ),
  ),
  );

}*/

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

Widget setImage2(int index){
  switch(boxList[index]) {
    case 0:
      {
        return Image(
            image: AssetImage('assets/CajaCerrada.png'));
      }
      break;
    case 1:
      {
        return Image(
            image: AssetImage('assets/CajaAbierta.png'));
      }
      break;


  }
  return Image(
      image: AssetImage('assets/5.png')
  );
}

