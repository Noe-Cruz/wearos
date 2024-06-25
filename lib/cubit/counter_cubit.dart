import 'package:bloc/bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void increment() => state < 10  ? 
                      emit(state + 1) : 
                      Fluttertoast.showToast(msg: "Límite mayor");
  void decrement() => state > -10 ? 
                      emit(state - 1) : 
                      Fluttertoast.showToast(msg: "Límite menor");
  void reset()     => emit(state * 0);
}