import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'counter_observer.dart';

//khai báo danh sách các events
enum CounterEvent { increment, decrement }

void main() {
  Bloc.observer =
      const CounterObserver(); //khởi tạo biến quan sát các thay đổi trạng thái của CounterObserver
  runApp(const MyApp());
}

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
        create: (context) => CounterBloc(), //tạo ra một đối tượng CounterBloc
        child:
            const MyWidGet(), //gán 1 widget cho BlocProvider để cập nhật lại widget này khi có thay đổi từ CounterBloc
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyWidGet extends StatelessWidget {
  const MyWidGet({super.key});

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
      body: BlocBuilder<CounterBloc, int>(
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
                        BlocProvider.of<CounterBloc>(context)
                            .add(CounterEvent.increment);
                      },
                      icon: const Icon(Icons.add),
                      label: const Text('Increment')),
                  const SizedBox(width: 10),
                  OutlinedButton.icon(
                      onPressed: () {
                        BlocProvider.of<CounterBloc>(context)
                            .add(CounterEvent.decrement);
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

// Tạo Bloc để quản lý trạng thái của biến đếm

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0);

  Stream<int> mapEventToState(CounterEvent event) async* {
    switch (event) {
      case CounterEvent.increment:
        var newState = state + 1;
        yield newState;
        break;
      case CounterEvent.decrement:
        var newState = state - 1;
        yield newState;
        break;
    }
  }
}
