import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'listener_state.dart';

class ListenerCubit extends Cubit<ListenerState> {
  ListenerCubit() : super(ListenerInitial());

  static ListenerCubit get(context) => BlocProvider.of(context);

  var myName = ["Ahmad"];

  void changeMyName({required name}) {
    emit(ListenerChangeMyNameSuccess());
    myName.add(name);
    Future.delayed(Duration(seconds: 10)).then((value) {
      print(value);

      emit(ListenerChangeMyNameLoading());
    });
  }
}
