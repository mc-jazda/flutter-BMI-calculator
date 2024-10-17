import 'package:bloc/bloc.dart';
import 'package:bmi_calculator/features/bmi_calculator/core/status.dart';
import 'package:bmi_calculator/features/bmi_calculator/domain/usecases/get_calculated_bmi.dart';
import 'package:equatable/equatable.dart';

part 'bmi_calculator_event.dart';
part 'bmi_calculator_state.dart';

class BmiCalculatorBloc extends Bloc<BmiCalculatorEvent, BmiCalculatorState> {
  final GetCalculatedBmi _getCalculatedBmi;

  BmiCalculatorBloc(this._getCalculatedBmi) : super(BmiCalculatorInitial()) {
    on<BmiCalculatorEvent>((event, emit) {
      switch (event) {
        case BmiCalculatorCalculatePressed(): {
          _emitState(_getCalculatedBmi(
            height: event.height, 
            weight: event.weight),
             emit);
        } 
      }
    });
  }

  void _emitState(Status status, Emitter<BmiCalculatorState> emit) {
    switch (status) {
      case MissingData():
        emit(BmiCalculatorMissingData(
          isHeightMissing: status.isHeightMissing,
          isWeightMissing: status.isWeightMissing)
          );
      case InvalidData():
        emit(BmiCalculatorInvalidData(
          isHeightInvalid: status.isHeightInvalid, 
          isWeightInvalid: status.isWeightInvalid
          ));
      case CalculatedBmi():
        emit(BmiCalculatorCalculatedBmi(status.bmi));
      case BmiData(): // impossible case
        return;
    }
  }
}
