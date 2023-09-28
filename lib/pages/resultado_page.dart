import 'package:calculadora_imc/pages/login_page.dart';
import 'package:flutter/material.dart';

class ResultadoPage extends StatefulWidget {
  const ResultadoPage({super.key});

  @override
  State<ResultadoPage> createState() => _ResultadoPageState();
}

class _ResultadoPageState extends State<ResultadoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Acompanhamento IMC"),
        leading: InkWell(
          child: Icon(Icons.arrow_back),
          onTap: () {
            showDialog(
                context: context,
                builder: (BuildContext bc) {
                  return AlertDialog(
                    alignment: Alignment.centerLeft,
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    title: Text("Meu App",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    content: Wrap(children: [
                      Text("Deseja realmente sair da Calculadora?"),
                    ]),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("Não")),
                      TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()));
                          },
                          child: Text("Sim"))
                    ],
                  );
                });
          },
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text("Resultado: "),
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Classificação: "),
                Text("05/08"),
              ],
            ),
            trailing: PopupMenuButton<String>(
              onSelected: (menu) {
                print(menu);
                if (menu == "opcao1") {}
              },
              itemBuilder: (BuildContext bc) {
                return <PopupMenuEntry<String>>[
                  PopupMenuItem(value: "opcao1", child: Text("Apagar")),
                ];
              },
            ),
          ),
        ],
      ),
    );
  }
}
