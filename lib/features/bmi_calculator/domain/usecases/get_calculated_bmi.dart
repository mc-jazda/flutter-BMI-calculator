import 'package:bmi_calculator/features/bmi_calculator/core/status.dart';
import 'package:bmi_calculator/features/bmi_calculator/domain/util/bmi_calculator.dart';
import 'package:bmi_calculator/features/bmi_calculator/domain/util/parser.dart';
import 'package:bmi_calculator/features/bmi_calculator/domain/util/validator.dart';

class GetCalculatedBmi {
  final BmiCalculator _calculator;
  final BmiDataParser _parser;
  final BmiDataValidator _validator;

  GetCalculatedBmi({
    required BmiCalculator calculator, 
    required BmiDataParser parser, 
    required BmiDataValidator validator}) 
    : _calculator = calculator, _parser = parser, _validator = validator;

  Status call({required String height, required String weight}) {
    var status = _parser.parse(height: height, weight: weight);
    if (status is MissingData || status is InvalidData) {
      return status;
    }

    status = _validator.validate(status as BmiData);
    if (status is InvalidData) {
      return status;
    }

    return CalculatedBmi(_calculator.calculateBmi(status as ValidData));
  }
}