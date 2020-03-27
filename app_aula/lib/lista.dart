
// import 'package:app_aula/cadastro.dart';
import 'package:flutter/material.dart';
import 'package:app_aula/main.dart';
// import 'package:app_aula/cadastro.dart';
import 'package:flutter/rendering.dart';
// import 'package:url_launcher/url_launcher.dart';

import 'main.dart';



class Listahospitais extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       
      theme: ThemeData( 
      primaryColor: HexColor('#1F396E'), //! cor primaria
      secondaryHeaderColor:  Colors.white,
      fontFamily: 'Montserrat-ExtraLight',

      // brightness: Brightness.dark
      ),
  home : Scaffold(
        // resizeToAvoidBottomPadding: false,
        //!BARRA DO TOPO COM ICONE E MENU
    appBar: PreferredSize(                                  
        preferredSize: Size.fromHeight(50.0), // here the desired height           
          child: AppBar(   
            backgroundColor: HexColor('#45b6fe'),                   
            leading: Builder( // ADICIONANDO O LOGO IMG INSTACARES
            builder: (BuildContext context) {            
            return 
            Padding(
              padding: const EdgeInsets.all(1),
               child: Image.asset('imagens/osso.png',alignment: Alignment.topCenter,),
            ); 
            },
            ),
            actions: <Widget>[
               Padding(
               padding: const EdgeInsets.fromLTRB(0, 26, 19, 0),
              child: Text('Lista de hospitais', style: TextStyle(fontWeight: FontWeight.normal, 
                fontSize: 19.0, 
                color: Colors.white // SETANDO A COR
              ),
                textAlign: TextAlign.center,
                ),
              )
            ],
          ),
    ),
    
    
    
  body: Stack(
    children: <Widget>[
    Container(color: Colors.white,
     
      child:ListView(
      children:  <Widget>[
        Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            
           decoration: BoxDecoration(
            // color: Colors.amber, 
            color: HexColor('#8A2BE2'), 
           
            borderRadius: BorderRadius.circular(12),
           ),
            child:crialogohospital('hospital 1','imagens/001.png')
          ),
        ),

           Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            
           decoration: BoxDecoration(
            color: HexColor('#00BFFF'),  
           
            borderRadius: BorderRadius.circular(12),
           ),
            child:crialogohospital('hospital 2','imagens/002.png'),
          ),
        ),  

           Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            
           decoration: BoxDecoration(
            color: HexColor('#FF69B4'),   
           
            borderRadius: BorderRadius.circular(12),
           ),
            child: crialogohospital('hospital 3','imagens/003.png'),
          ),
        ),

           Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            
           decoration: BoxDecoration(
            color: HexColor('#FF6347'),   
           
            borderRadius: BorderRadius.circular(12),
           ),
            child: crialogohospital('hospital 4','imagens/004.png'),
          ),
        ),                  
          
           Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            
           decoration: BoxDecoration(
           color: HexColor('#7FFFD4'),  
           
            borderRadius: BorderRadius.circular(12),
           ),
            child: crialogohospital('hospital 5','imagens/005.png'),
          ),
        ),

           Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            
           decoration: BoxDecoration(
            color: HexColor('#2E8B57'),   
           
            borderRadius: BorderRadius.circular(12),
           ),
            child: crialogohospital('hospital 6','imagens/006.png'),
          ),
        ),

          Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            
           decoration: BoxDecoration(
           color: HexColor('#7CFC00'),   
           
            borderRadius: BorderRadius.circular(12),
           ),
            child: crialogohospital('hospital 7','imagens/007.png'),
          ),
        ),


          Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            
           decoration: BoxDecoration(
            color: HexColor('#DC143C'),   
           
            borderRadius: BorderRadius.circular(12),
           ),
            child: crialogohospital('hospital 8','imagens/008.png'),
          ),
        ),        
         
          
          
          
          
          
      ],
      ),
    )
    ],
  ),

   bottomNavigationBar: BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text('Home'),
        ),
    
        BottomNavigationBarItem(
          icon: Icon(Icons.list),
          title: Text('notas'),
        ),
      ],

    ),
  ),
  );
  }
}

Widget crialogohospital(String texto,imagem ){
return
 Padding(//alinhamento da linha toda
  padding: const EdgeInsets.all(5),
  //  padding: const EdgeInsets.fromLTRB(5, 14, 0, 0),
   child: Row(//linha principal onde esta o texto e o coraçao <3
   
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Column( //colunha do coraçao <3
        children: <Widget>[
          Row(
            children: <Widget>[
              Padding(//alinhamento do coraçao >3
                // padding: const EdgeInsets.fromLTRB(15, 3, 5, 1),
                padding: const EdgeInsets.all(1),
                child:
                SizedBox(//caixinha onde esta o coraçao para ajustar o tamanho
                height: 50,
                width: 50,
                child: Container(
                  alignment: Alignment(0.0, 0.0),
                  // margin: new EdgeInsets.symmetric(vertical: 20.0),
                  child: Image.asset(imagem))
                ,//imagem propriamente dita
              ),
              ),
           
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(texto,  //texto proprimente dito
            textAlign: TextAlign.start,
            style: TextStyle(
          color: HexColor('#474a51'),
            // fontFamily: 'Painterz',
            fontSize: 25,
            ),
            ),
          ),
            
            Padding(
              
              padding: const EdgeInsets.only(left: 50),
             
              child: Icon(Icons.location_on,
              // color: HexColor('#45b6fe'),
              color: Colors.black,
              size: 50,
              ),
            )
          


            ],
          )
          ],
          ),
         ],
         ),
 );
}
