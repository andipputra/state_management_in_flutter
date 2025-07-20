import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';


part 'counter_provider.g.dart';

@riverpod
class CounterController extends _$CounterController {
  @override
  int build() {
    return 0;
  }

  void increment() {
    state++;
  }
}

class TestNotifier extends StateNotifier<int> {
  TestNotifier(): super(0);

  increment(){
    state++;
  }
}

final testNotifierProvider = StateNotifierProvider<TestNotifier, int>((ref) {
  return TestNotifier();
});

final dataChangeProvider = ChangeNotifierProvider<DataChangeNotifier>((ref) {
  return DataChangeNotifier();
});

class DataChangeNotifier extends ChangeNotifier {
  int counter = 0;

  void increment() {
    counter++;
    notifyListeners();
  }
}