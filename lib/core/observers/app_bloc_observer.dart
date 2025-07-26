import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    log('Bloc Created: ${bloc.runtimeType}');
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    log('Event Added: $event to ${bloc.runtimeType}', name: 'on event');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    log(
      'State Changed: ${change.currentState} to ${change.nextState} in ${bloc.runtimeType}',
      name: 'on change',
    );
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    log('Error in ${bloc.runtimeType}: $error', name: 'on error');
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    log('Bloc Closed: ${bloc.runtimeType}', name: 'on close');
  }
}
