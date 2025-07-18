import 'package:flutter/material.dart';

class CounterInheritedWidget extends InheritedWidget {
  final int counter;
  final VoidCallback increment;

  const CounterInheritedWidget({
    super.key,
    required super.child,
    required this.counter,
    required this.increment,
  });

  static CounterInheritedWidget of(BuildContext context) {
    final CounterInheritedWidget? result = context
        .dependOnInheritedWidgetOfExactType<CounterInheritedWidget>();
    assert(result != null, 'No CounterInheritedWidget found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(CounterInheritedWidget oldWidget) =>
      counter != oldWidget.counter;
}