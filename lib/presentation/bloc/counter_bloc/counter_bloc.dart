import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_event.dart';

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    on<CounterEvent>(_eventStream);
  }

  _eventStream(CounterEvent event, Emitter<int> emit) {
    if (event is CounterIncrement) _increment(emit);

    if (event is CounterDecrement) {
      emit(state - 1);
    }
  }

  _increment(Emitter<int> emit) {
    emit(state + 1);
  }
}
