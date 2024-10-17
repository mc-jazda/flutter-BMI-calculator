part of 'bmi_calculator_bloc.dart';

sealed class BmiCalculatorEvent extends Equatable {
  const BmiCalculatorEvent();

  @override
  List<Object> get props => [];
}

class BmiCalculatorCalculatePressed extends BmiCalculatorEvent {
  final String height;
  final String weight;

  const BmiCalculatorCalculatePressed({required this.height, required this.weight});

  @override
  List<Object> get props => [height, weight];
}