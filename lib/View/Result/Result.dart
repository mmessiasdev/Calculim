import 'package:app/Model/Components/DefaultCard.dart';
import 'package:app/Model/Components/DefaultContainer.dart';
import 'package:app/Model/Styles.dart';
import 'package:app/View/HomePage/HomePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Result extends StatelessWidget {
  Result({
    required this.imcCalculate,
    required this.getResult,
    required this.getInterpretation,
  });

  final String imcCalculate;
  final String getResult;
  final String getInterpretation;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final size = mediaQuery.size;
    return SafeArea(
        child: Scaffold(
            body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Container(
            alignment: Alignment.centerLeft,
            height: 70,
            child: Text(
              'Resultado',
              style: kFirtsText,
            ),
          ),
        ),
        Container(
          child: Text(
            getResult,
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: DefaultContainer(
                  cor: corSecundaria,
                  childContainer: Container(
                    height: size.height * 0.55,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          Container(
                            height: size.height * 0.20,
                            child: Text(
                              'IMC',
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Center(
                            child: Text(
                              imcCalculate,
                              style: TextStyle(
                                  fontSize: 50, fontWeight: FontWeight.w900),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: DefaultContainer(
                  cor: corSecundariaInativa,
                  childContainer: Container(
                    height: size.height * 0.55,
                    child: DefaultContainer(
                      cor: corSecundariaInativa,
                      childContainer: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          DefaultCard(
                            title: "Altura",
                            subTitle: altura.toString(),
                          ),
                          DefaultCard(
                            title: "Peso",
                            subTitle: peso.toString(),
                          ),
                          DefaultCard(
                            title: "Idade",
                            subTitle: idade.toString(),
                          ),
                        ],
                      ),
                    ),
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
                  Navigator.pushNamed(context, '/HomePage');
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                  child: Text(getInterpretation),
                ),
              ),
            ),
          ),
        ),
      ],
    )));
  }
}
