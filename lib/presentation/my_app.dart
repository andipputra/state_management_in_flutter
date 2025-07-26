import 'package:day_21_state_management/core/connection/dio_client.dart';
import 'package:day_21_state_management/data/repository/data_repository.dart';
import 'package:day_21_state_management/presentation/pages/home/home_page.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: DioClient.initiate()),
        RepositoryProvider(
          create: (context) => DataRepository(dio: context.read<Dio>()),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}
