import 'package:bmi_calculator/features/bmi_calculator/presentation/bloc/bmi_calculator_bloc.dart';
import 'package:bmi_calculator/features/bmi_calculator/presentation/widgets/alert.dart';
import 'package:bmi_calculator/features/bmi_calculator/presentation/widgets/bmi_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BmiCalculatorPage extends StatelessWidget {
  final heightKey = GlobalKey<BmiInputState>();
  final weightKey = GlobalKey<BmiInputState>();

  BmiCalculatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator')
        ),
        body: _buildBody(context),
    );
  }

  BlocBuilder<BmiCalculatorBloc, BmiCalculatorState> _buildBody(BuildContext context) {
    return BlocBuilder(
      builder: (context, state) {
        return Center(
          child: Column(
            children: [
              BmiInput(text: 'Height:', key: heightKey,),
              const SizedBox(height: 20),
              BmiInput(text: 'Weight:', key: weightKey,),
              const SizedBox(height: 30),
              _alert(context, state),
              const SizedBox(height: 20,),
              FilledButton(
                onPressed: () {
                  final height = heightKey.currentState?.inputStr;
                  final weight = weightKey.currentState?.inputStr;

                  if (height != null && weight != null) {
                    context.read<BmiCalculatorBloc>().add(BmiCalculatorCalculatePressed(height: height, weight: weight));
                  }

                  // TODO: handle null currentState
                }, 
                child: const Text('Calculate BMI'),
              ),
            ],
          ),
        );
      }
    );
  }

  Alert _alert(BuildContext context, BmiCalculatorState state) {
    switch (state) {
      case BmiCalculatorInitial():
        return const Alert(
          text: '', 
          visible: false
          );
          
      case BmiCalculatorMissingData(): {
        final String text;

        if (state.isHeightMissing && !state.isWeightMissing) {
          text = 'Please, specify your height';
        }
        else if (!state.isHeightMissing && state.isWeightMissing) {
          text = 'Please, specify your weight';
        }
        else {
          text = 'Please, specify your height and weight';
        }

        return Alert(
          text: text, 
          visible: true
          );
      }    
      
      case BmiCalculatorInvalidData(): {
        final String text;

        if (state.isHeightInvalid && !state.isWeightInvalid) {
          text = 'Please, enter a correct height';
        }
        else if (!state.isHeightInvalid && state.isWeightInvalid) {
          text = 'Please, enter a correct weight';
        }
        else {
          text = 'Please, enter a correct height and weight';
        }

        return Alert(
          text: text, 
          visible: true
          );
      }    

      case BmiCalculatorCalculatedBmi():
        return Alert(
          text: 'Your BMI is ${state.bmi}', 
          visible: true
          );
    }
  }
}