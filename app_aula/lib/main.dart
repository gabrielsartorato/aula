import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:app_aula/lista.dart';
import 'package:app_aula/cadastro.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(LoginApp());

class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MEU MEDICO',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  final _ctrlLogin = TextEditingController();
  final _ctrlSenha = TextEditingController();
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.5,
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
                  Spacer(),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(top: 62),
              child: Column(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width / 1.2,
                    height: 45,
                    padding:
                        EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(color: Colors.black12, blurRadius: 5)
                        ]),
                    child: _textFormField("Login", "",
                        controller: _ctrlLogin, validator: _validaLogin),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.2,
                    height: 45,
                    margin: EdgeInsets.only(top: 32),
                    padding:
                        EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(color: Colors.black12, blurRadius: 5)
                        ]),
                    child: _textFormField("Senha", "",
                        controller: _ctrlSenha, validator: _validaSenha),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: FlatButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Cadastro()),
                          );
                        },
                        child: Text(
                          'Não tem uma conta?',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.fromLTRB(21, 28, 21, 0),
                    child: MaterialButton(
                      minWidth: double.infinity,
                      height: 48,
                      child: Text(
                        'Entrar',
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontFamily: "Roboto"),
                      ),
                      color: HexColor('#4169E1'),
                      //!ON CLICK DO BOTÃO
                      onPressed: () async {
                        Map<String, String> headers = new Map<String, String>();
                        headers["Content-type"] = "application/json";
                        headers["Accept"] = "application/json";

                        String str = '{"estados" : "true"}';
                        var resp = await http.post(
                            'https://meumedico-67271.firebaseio.com/usuarios.json',
                            headers: headers,
                            body: str);
                        print(str);

                        Map mapResponse =
                            json.decode(resp.body); //!'decodificando' o retorno
                        //? PEGANDO OS VALORES DO JSON (RETORNO DA API)
                        // print(resp.body);
                        List jsonretorno = mapResponse["nome"]["senha"];
                        print(jsonretorno);
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
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

String _validaLogin(String texto) {
  if (texto.isEmpty) {
    return "Digite o Login";
  }
  return null;
}

String _validaSenha(String texto) {
  if (texto.isEmpty) {
    return "Digite a Senha";
  }
  return null;
}

_textFormField(
  String label,
  String hint, {
  bool senha = false,
  TextEditingController controller,
  FormFieldValidator<String> validator,
}) {
  return TextFormField(
    controller: controller,
    validator: validator,
    obscureText: senha,
    decoration: InputDecoration(labelText: label, hintText: hint),
  );
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
