import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:app_aula/lista.dart';
// import 'package:app_aula/cadastro.dart';

// void main() => runApp(LoginApp());

class Cadastro extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Cadastro();
  }
}

class _Cadastro extends State<Cadastro> {
  String _username = "";
  String _password = "";
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                // width: MediaQuery.of(context).size.width,
                // height: MediaQuery.of(context).size.height / 2.5,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xFF6495ED), Color(0xFF4169E1)],
                    ),
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(90))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Spacer(),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                          height: 150,
                          width: 150,
                          child: Image.asset('imagens/drfofo.png',
                              alignment: Alignment.center)),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.only(right: 10, top: 10),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.end,
                    //     children: <Widget>[
                    //       Text('Crie uma conta'),
                    //     ],
                    //   ),
                    // ),
                    Spacer(),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  height: MediaQuery.of(context).size.height / 2,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(top: 62),
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width / 1.2,
                        height: 45,
                        padding: EdgeInsets.only(
                            top: 4, left: 16, right: 16, bottom: 4),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(color: Colors.black12, blurRadius: 5)
                            ]),
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(
                              //edit
                              Icons.account_circle,
                              color: Colors.grey,
                            ),
                            hintText: 'Escolha um nome de usuario',
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.2,
                        height: 45,
                        margin: EdgeInsets.only(top: 32),
                        padding: EdgeInsets.only(
                            top: 4, left: 16, right: 16, bottom: 4),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(color: Colors.black12, blurRadius: 5)
                            ]),
                        child: TextField(
                          //edit
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(
                              //edit
                              Icons.vpn_key,
                              color: Colors.grey,
                            ),
                            hintText: 'Digite a sua senha',
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.2,
                        height: 45,
                        margin: EdgeInsets.only(top: 32),
                        padding: EdgeInsets.only(
                            top: 4, left: 16, right: 16, bottom: 4),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(color: Colors.black12, blurRadius: 5)
                            ]),
                        child: TextField(
                          onChanged: (text) {
                            _username = text;
                            print("TextField: $text");
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(
                              //edit
                              Icons.vpn_key,
                              color: Colors.grey,
                            ),
                            hintText: 'Confirme a sua senha',
                          ),
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 40),
                        child: Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.fromLTRB(21, 28, 21, 0),
                          child: MaterialButton(
                            minWidth: double.infinity,
                            height: 48,
                            child: Text(
                              'Cadastrar',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontFamily: "Roboto"),
                            ),
                            color: HexColor('#4169E1'),
                            //!ON CLICK DO BOTÃO
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Listahospitais()),
                              );
                            },
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(40.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
