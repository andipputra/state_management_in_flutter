import 'package:day_21_state_management/presentation/my_app.dart';
import 'package:day_21_state_management/presentation/provider/counter_provider.dart';
import 'package:day_21_state_management/presentation/provider/province_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CounterProvider()),
        ChangeNotifierProvider(create: (_) => ProvinceProvider()),
      ],
      child: const MyApp(),
    ),
  );
}
