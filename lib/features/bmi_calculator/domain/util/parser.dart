import 'package:bmi_calculator/features/bmi_calculator/core/status.dart';

abstract class BmiDataParser {
  Status parse({
    required String height, required String weight
    });
}

class BmiDataParserImpl implements BmiDataParser {
  @override
  Status parse({required String height, required String weight}) {
    if (height.isEmpty || weight.isEmpty) { 
      return MissingData(
        isHeightMissing: height.isEmpty, 
        isWeightMissing: weight.isEmpty
        ); 
    }

    double? tHeight = double.tryParse(height);
    double? tWeight = double.tryParse(weight);
    bool isHeightInvalid = tHeight == null;
    bool isWeightInvalid = tWeight == null;

    if (isHeightInvalid || isWeightInvalid) {
      return InvalidData(isHeightInvalid: isHeightInvalid, isWeightInvalid: isWeightInvalid);
    }

    return BmiData(height: tHeight, weight: tWeight);
  }

}