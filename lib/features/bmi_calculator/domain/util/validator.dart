
import 'package:bmi_calculator/features/bmi_calculator/core/status.dart';

abstract class BmiDataValidator {
  Status validate(BmiData data);
}

class BmiDataValidatorImpl implements BmiDataValidator {
  @override
  Status validate(BmiData data) {
    bool isHeightInvalid = data.height <= 0;
    bool isWeightInvalid = data.weight <= 0;
    
    if (isWeightInvalid || isWeightInvalid) {
      return InvalidData(isHeightInvalid: isHeightInvalid, isWeightInvalid: isWeightInvalid);
    }

    return ValidData(height: data.height, weight: data.weight);
  }
}