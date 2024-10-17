part of 'bmi_calculator_bloc.dart';

sealed class BmiCalculatorState extends Equatable {
  const BmiCalculatorState();  

  @override
  List<Object> get props => [];
}

class BmiCalculatorInitial extends BmiCalculatorState {}

class BmiCalculatorMissingData extends BmiCalculatorState {
  final bool isHeightMissing;
  final bool isWeightMissing;

  const BmiCalculatorMissingData({required this.isHeightMissing, required this.isWeightMissing});

  @override
  List<Object> get props => [isHeightMissing, isWeightMissing];
}

class BmiCalculatorInvalidData extends BmiCalculatorState {
  final bool isHeightInvalid;
  final bool isWeightInvalid;

  const BmiCalculatorInvalidData({required this.isHeightInvalid, required this.isWeightInvalid});

  @override
  List<Object> get props => [isHeightInvalid, isWeightInvalid];
}

// class BmiCalculatorValidData extends BmiCalculatorState {}

class BmiCalculatorCalculatedBmi extends BmiCalculatorState {
  final double bmi;

  const BmiCalculatorCalculatedBmi(this.bmi);
  
  @override
  List<Object> get props => [bmi];
}