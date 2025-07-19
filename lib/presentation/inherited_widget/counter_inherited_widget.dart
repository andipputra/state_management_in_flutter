import 'package:flutter/material.dart';

class CounterInheritedWidget extends InheritedWidget {
  final int counter;
  final VoidCallback increment;
  final void Function(String) changeTitle;
  final String title;

  const CounterInheritedWidget({
    super.key,
    required super.child,
    required this.counter,
    required this.increment,
    required this.title,
    required this.changeTitle,
  });

  static CounterInheritedWidget? of(BuildContext context) {
    final CounterInheritedWidget? result = context
        .dependOnInheritedWidgetOfExactType<CounterInheritedWidget>();
    return result;
  }

  @override
  bool updateShouldNotify(CounterInheritedWidget oldWidget) =>
      counter != oldWidget.counter || title != oldWidget.title;
}