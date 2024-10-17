import 'package:bmi_calculator/features/bmi_calculator/core/status.dart';

abstract class BmiCalculator {
  double calculateBmi(ValidData data);
}

class BmiCalculatorImpl implements BmiCalculator {
  @override
  double calculateBmi(ValidData data) {
    return data.weight / (data.height * data.height);
  }
}