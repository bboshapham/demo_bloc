import 'package:flutter_bloc/flutter_bloc.dart';

class CounterObserver extends BlocObserver {
  const CounterObserver(); //tao constructor

  @override
  //override ham onchange để theo dõi thay đổi trạng thái
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
  }
}
