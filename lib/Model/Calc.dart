import 'dart:math';

class CalculadoraIMC {
  CalculadoraIMC({required this.peso, required this.altura});

  final int peso;
  final int altura;
  late double _imc;

  String imcCalculate() {
    _imc = peso / pow(altura / 100, 2);
    return _imc.toStringAsFixed(2);
  }

  String getResult() {
    if (_imc >= 25) {
      return "Alto";
    } else if (_imc > 18.5) {
      return "Bom";
    } else {
      return "Baixo";
    }
  }

  String getInterpretation() {
    if (_imc >= 25) {
      return "Seu está acima do normal. Regule sua alimentação.";
    } else if (_imc > 18.5) {
      return "Seu peso está bom!";
    } else {
      return "Seu peso está baixo. Se alimente melhor para ganhar massa.";
    }
  }
}
