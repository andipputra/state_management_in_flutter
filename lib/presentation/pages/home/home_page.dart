import 'package:day_21_state_management/presentation/bloc/counter_bloc/counter_bloc.dart';
import 'package:day_21_state_management/presentation/bloc/counter_cubit/counter_cubit.dart';
import 'package:day_21_state_management/presentation/pages/province/province_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CounterBloc>(create: (context) => CounterBloc()),
        BlocProvider<CounterCubit>(create: (context) => CounterCubit()),
      ],
      child: MyHomePageView(title: title),
    );
  }
}

class MyHomePageView extends StatelessWidget {
  const MyHomePageView({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
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
            BlocBuilder<CounterBloc, int>(
              builder: (context, counter) {
                return Text(
                  '$counter',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
            // BlocSelector<CounterBloc, int, int>(
            //   selector: (state) => state % 2 == 0 ? state ~/ 2 : state,
            //   builder: (context, state) => Text(
            //     '$state',
            //     style: Theme.of(context).textTheme.headlineMedium,
            //   ),
            // ),
            Text(
                '${context.watch<CounterCubit>().state}',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            SizedBox(height: 48),
            ElevatedButton(
              onPressed: () => Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (context) => ProvincePage())),
              child: const Text('Redirect to province page'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<CounterBloc>().add(CounterIncrement());
          context.read<CounterCubit>().increment();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
