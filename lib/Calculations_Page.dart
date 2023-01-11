import 'dart:math';

class Calculations {
  final int height;
  final int weight;

  Calculations(this.height, this.weight);

  double _bmi = 18;

  String bmiresult() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String result() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String interpretation() {
    if (_bmi >= 25) {
      return 'You have a higher than normal body weight, You need to exercise more';
    } else if (_bmi > 18.5) {
      return 'You have a normal body weight, good Work. Keep it up !!';
    } else {
      return 'You have a weight less than normal, you should be looking to eat more';
    }
  }
}
