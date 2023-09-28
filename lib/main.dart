import 'package:calculadora_imc/pages/calculadora_imc_page.dart';
import 'package:calculadora_imc/pages/login_page.dart';
import 'package:calculadora_imc/pages/resultado_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: LoginPage(),
  ));
}

class _MainPageState extends State<MainPage> {
  int posicaoPagina = 0;
  PageController controller = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: PageView(
                  controller: controller,
                  onPageChanged: (value) {
                    setState(() {
                      posicaoPagina = value;
                    });
                  },
                  children: const [CalculadoraImcPage(), ResultadoPage()]),
            ),
            BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                onTap: (value) {
                  controller.jumpToPage(value);
                },
                currentIndex: posicaoPagina,
                items: [
                  BottomNavigationBarItem(
                      label: "Calculadora", icon: Icon(Icons.calculate)),
                  BottomNavigationBarItem(
                      label: "Lista de IMC", icon: Icon(Icons.list)),
                ])
          ],
        ),
      ),
    );
  }
}
