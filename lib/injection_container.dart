import 'package:bmi_calculator/features/bmi_calculator/domain/usecases/get_calculated_bmi.dart';
import 'package:bmi_calculator/features/bmi_calculator/domain/util/bmi_calculator.dart';
import 'package:bmi_calculator/features/bmi_calculator/domain/util/parser.dart';
import 'package:bmi_calculator/features/bmi_calculator/domain/util/validator.dart';
import 'package:bmi_calculator/features/bmi_calculator/presentation/bloc/bmi_calculator_bloc.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  // BLoC
  getIt.registerFactory(
    () => BmiCalculatorBloc(getIt())
  );

  // Use cases
  getIt.registerLazySingleton(() => GetCalculatedBmi(
    calculator: getIt(), 
    parser: getIt(), 
    validator: getIt()
    )
  );

  // Utils
  getIt.registerLazySingleton<BmiDataParser>(() => BmiDataParserImpl());
  getIt.registerLazySingleton<BmiDataValidator>(() => BmiDataValidatorImpl());
  getIt.registerLazySingleton<BmiCalculator>(() => BmiCalculatorImpl());
}