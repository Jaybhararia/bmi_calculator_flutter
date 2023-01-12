import 'dart:math';

class Calculations {
  final int height;
  final int weight;

  Calculations(this.height, this.weight);

  // double? _bmi;

  String bmiresult() {
    double _bmi1 = weight / pow(height / 100, 2);
    // _bmi = _bmi1;
    return _bmi1.toStringAsFixed(1);
  }

  double bmifun() {
    return weight / pow(height / 100, 2);
  }

  String result() {
    if (bmifun() >= 25) {
      return 'Overweight';
    } else if (bmifun() > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String interpretation() {
    if (bmifun() >= 25) {
      return 'You have a higher than normal body weight, You need to exercise more';
    } else if (bmifun() > 18.5) {
      return 'You have a normal body weight, good Work. Keep it up !!';
    } else {
      return 'You have a weight less than normal, you should be looking to eat more';
    }
  }
}
