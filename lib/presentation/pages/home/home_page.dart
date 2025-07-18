import 'package:day_21_state_management/presentation/inherited_widget/counter_inherited_widget.dart';
import 'package:day_21_state_management/presentation/pages/province/province_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final Widget child;
  const HomePage({super.key, required this.child});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CounterInheritedWidget(
      counter: _counter,
      increment: _incrementCounter,
      child: widget.child,
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    final counterWidget = CounterInheritedWidget.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '${counterWidget.counter}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: 48),
            ElevatedButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ProvincePage(child: ProvinceView()),
                ),
              ),
              child: const Text('Redirect to province page'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: counterWidget.increment,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
