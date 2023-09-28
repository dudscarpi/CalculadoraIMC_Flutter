import 'package:calculadora_imc/pages/login_page.dart';
import 'package:flutter/material.dart';

class CalculadoraImcPage extends StatefulWidget {
  const CalculadoraImcPage({Key? key}) : super(key: key);

  @override
  _CalculadoraImcPageState createState() => _CalculadoraImcPageState();
}

class _CalculadoraImcPageState extends State<CalculadoraImcPage> {
  TextEditingController nomeController = TextEditingController();
  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();
  double imcResult = 0.0;
  String classificacao = "";

  double calcularIMC(double peso, double altura) {
    if (altura <= 0) {
      _mostrarAlerta("Altura deve ser maior que zero.");
      return 0.0; // Retorna 0 como valor de IMC inválido
    }
    if (peso <= 0) {
      _mostrarAlerta("Peso deve ser maior que zero.");
      return 0.0; // Retorna 0 como valor de IMC inválido
    }
    return peso / (altura * altura);
  }

  String classificarIMC(double imc) {
    if (imc < 16) {
      return "Magreza grave";
    } else if (imc < 17) {
      return "Magreza moderada";
    } else if (imc < 18.5) {
      return "Magreza leve";
    } else if (imc < 25) {
      return "Saudável";
    } else if (imc < 30) {
      return "Sobrepeso";
    } else if (imc < 35) {
      return "Obesidade Grau I";
    } else if (imc < 40) {
      return "Obesidade Grau II (severa)";
    } else {
      return "Obesidade Grau III (mórbida)";
    }
  }

  void _mostrarAlerta(String mensagem) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Erro"),
          content: Text(mensagem),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora IMC"),
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
      backgroundColor: Color.fromARGB(255, 243, 243, 243),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 100,
                child: Image.network(
                  "https://p2.trrsf.com/image/fget/cf/1200/1200/middle/images.terra.com/2021/04/08/1593233994-imc.jpg",
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: nomeController,
                decoration: InputDecoration(labelText: 'Nome'),
                keyboardType: TextInputType.text,
              ),
              SizedBox(height: 10),
              TextField(
                controller: pesoController,
                decoration: InputDecoration(labelText: 'Peso (kg)'),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 10),
              TextField(
                controller: alturaController,
                decoration: InputDecoration(labelText: 'Altura (m)'),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  double peso = double.tryParse(pesoController.text) ?? 0;
                  double altura = double.tryParse(alturaController.text) ?? 0;

                  double imc = calcularIMC(peso, altura);
                  if (imc > 0) {
                    String classificacaoIMC = classificarIMC(imc);
                    setState(() {
                      imcResult = imc;
                      classificacao = classificacaoIMC;
                    });
                  }
                },
                child: Text('Calcular IMC'),
              ),
              SizedBox(height: 20),
              // Usando Visibility para ocultar esta parte até que haja um resultado válido
              Visibility(
                visible: imcResult > 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 20),
                    Text(
                      '${nomeController.text}, seu Resultado:',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'IMC: ${imcResult.toStringAsFixed(2)}',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Classificação: ${classificacao}',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
