import 'package:equatable/equatable.dart';

sealed class Status extends Equatable {
  @override
  List<Object> get props => [];
} 

class MissingData extends Status {
  final bool isHeightMissing;
  final bool isWeightMissing;

  MissingData({required this.isHeightMissing, required this.isWeightMissing});

  @override
  List<Object> get props => [isHeightMissing, isWeightMissing];
}

class BmiData extends Status {
  final double height;
  final double weight;

  BmiData({required this.height, required this.weight});

  @override
  List<Object> get props => [height, weight];
}

class InvalidData extends Status {
  final bool isHeightInvalid;
  final bool isWeightInvalid;

  InvalidData({required this.isHeightInvalid, required this.isWeightInvalid});

  @override
  List<Object> get props => [isHeightInvalid, isWeightInvalid];
}

class ValidData extends BmiData {
  ValidData({required super.height, required super.weight});
  ValidData.fromBmiData(BmiData data) : super(height: data.height, weight: data.weight);
}

class CalculatedBmi extends Status {
  final double bmi;

  CalculatedBmi(this.bmi);
  
  @override
  List<Object> get props => [bmi];
}