import 'package:day_21_state_management/core/observers/app_bloc_observer.dart';
import 'package:day_21_state_management/presentation/my_app.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  if (kDebugMode) Bloc.observer = AppBlocObserver();

  runApp(const MyApp());
}
