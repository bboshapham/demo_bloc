import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/counter/cubit/counter_cubit.dart';

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text(
          'Demo BLOC',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.grey,
      ),
      body: BlocBuilder<CounterCubit, int>(
        //dùng BlocBuilder để lắng nghe các thay đổi từ CounterBloc
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  child: Center(
                      child: Text(
                'Num: $state',
                style: const TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              ))),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton.icon(
                      onPressed: () {
                        context.read<CounterCubit>().increment();
                      },
                      icon: const Icon(Icons.add),
                      label: const Text('Increment')),
                  const SizedBox(width: 10),
                  OutlinedButton.icon(
                      onPressed: () {
                        context.read<CounterCubit>().decrement();
                      },
                      icon: const Icon(Icons.remove),
                      label: const Text('Decrement'))
                ],
              ),
              const SizedBox(height: 10),
            ],
          );
        },
      ),
    ));
  }
}
