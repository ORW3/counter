import 'package:bloc/bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void increment() {
    if (state < 10) {
      emit(state + 1);
    } else {
      _showLimitReachedMessage();
    }
  }

  void decrement() {
    if (state > -10) {
      emit(state - 1);
    } else {
      _showLimitReachedMessage();
    }
  }

  void reset() => emit(0);

  void _showLimitReachedMessage() {
    Fluttertoast.showToast(
      msg: "Limite alcanzado",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
    );
  }
}
