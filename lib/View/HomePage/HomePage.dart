import 'package:app/Model/Calc.dart';
import 'package:app/Model/Components/DefaultContainer.dart';
import 'package:app/Model/Components/SexoContainer.dart';
import 'package:app/Model/Styles.dart';
import 'package:app/Model/Components/DefaultButton.dart';
import 'package:app/View/Result/Result.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

final Color corSecundaria = Color.fromARGB(255, 217, 217, 217);
final Color corSecundariaInativa = Color.fromARGB(255, 242, 242, 242);

enum Sexo { masculino, feminino }

int altura = 180;
int peso = 70;
int idade = 18;

class _HomePageState extends State<HomePage> {
  Sexo? sexoSelecionado;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          Container(
            child: Column(
              children: [
                Text('Calculim', style: kFirtsText),
                Text(
                  'Calcule Seu IMC',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        sexoSelecionado = Sexo.masculino;
                      });
                    },
                    child: SexoContainer(
                      cor: sexoSelecionado == Sexo.masculino
                          ? corSecundaria
                          : corSecundariaInativa,
                      childContainer: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FaIcon(FontAwesomeIcons.mars),
                          Text('Masculino'),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        sexoSelecionado = Sexo.feminino;
                      });
                    },
                    child: DefaultContainer(
                      cor: sexoSelecionado == Sexo.feminino
                          ? corSecundaria
                          : corSecundariaInativa,
                      childContainer: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FaIcon(FontAwesomeIcons.venus),
                          Text('Feminino'),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: DefaultContainer(
            cor: Color.fromARGB(0, 255, 255, 255),
            childContainer: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Altura'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.ideographic,
                  children: [
                    Text(
                      altura.toString(),
                      style: kSecoundText,
                    ),
                    Text('cm'),
                  ],
                ),
                Slider(
                  value: altura.toDouble(),
                  min: 100.0,
                  max: 220.0,
                  autofocus: true,
                  onChanged: (double novoValor) {
                    setState(() {
                      altura = novoValor.round();
                    });
                  },
                  activeColor: Colors.black87,
                  inactiveColor: Colors.grey,
                )
              ],
            ),
          )),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: DefaultContainer(
                    cor: corSecundaria,
                    childContainer: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        DeafaultButton(
                          tap: () {
                            setState(() {
                              peso--;
                            });
                          },
                          icon: Icon(
                            Icons.arrow_left,
                            size: 40,
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Peso'),
                            Text(peso.toString(), style: kSecoundText),
                          ],
                        ),
                        DeafaultButton(
                          tap: () {
                            setState(() {
                              peso++;
                            });
                          },
                          icon: Icon(
                            Icons.arrow_right,
                            size: 40,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: DefaultContainer(
                    cor: corSecundaria,
                    childContainer: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        DeafaultButton(
                          tap: () {
                            setState(() {
                              idade--;
                            });
                          },
                          icon: Icon(
                            Icons.arrow_drop_up,
                            size: 40,
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Idade'),
                            Text(
                              idade.toString(),
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        DeafaultButton(
                          tap: () {
                            setState(() {
                              idade++;
                            });
                          },
                          icon: Icon(
                            Icons.arrow_drop_down,
                            size: 40,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: ElevatedButton(
                  onPressed: () {
                    CalculadoraIMC calc =
                        CalculadoraIMC(peso: peso, altura: altura);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Result(
                          imcCalculate: calc.imcCalculate(),
                          getResult: calc.getResult(),
                          getInterpretation: calc.getInterpretation(),
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 10),
                    child: Text('Calcular'),
                  ),
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
