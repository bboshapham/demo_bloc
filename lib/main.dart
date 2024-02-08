import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/app.dart';
import 'counter_observer.dart';

void main() {
  Bloc.observer =
      const CounterObserver(); //khởi tạo biến quan sát các thay đổi trạng thái của CounterObserver
  runApp(const MyApp());
}
