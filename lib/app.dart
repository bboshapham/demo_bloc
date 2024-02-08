import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/counter/cubit/counter_cubit.dart';
import '/counter/view/counter_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo BLOC',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (context) => CounterCubit(), //tạo ra một đối tượng CounterBloc
        child:
            const CounterView(), //gán 1 widget cho BlocProvider để cập nhật lại widget này khi có thay đổi từ CounterBloc
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
