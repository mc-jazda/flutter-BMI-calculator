import 'package:bmi_calculator/features/bmi_calculator/presentation/bloc/bmi_calculator_bloc.dart';
import 'package:bmi_calculator/features/bmi_calculator/presentation/pages/bmi_calculator_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bmi_calculator/injection_container.dart' as di;

void main() {
  di.setup();
  runApp(const BmiCalculatorApp());
}

class BmiCalculatorApp extends StatelessWidget {
  const BmiCalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (BuildContext context) => di.getIt<BmiCalculatorBloc>(),
        child: BmiCalculatorPage(),
      )
    );
  }
}
