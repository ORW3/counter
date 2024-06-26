import '../cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterCubit(),
      child: const CounterView(),
    );
  }
}

class CounterView extends StatefulWidget {
  const CounterView({super.key});

  @override
  State<CounterView> createState() => _CounterViewState();
}

class _CounterViewState extends State<CounterView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Counter',
              style: TextStyle(fontSize: 10),
            ),
            const SizedBox(
              height: 2,
            ),
            ElevatedButton(
                onPressed: () => context.read<CounterCubit>().increment(),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(3, 1),
                ),
                child: const Icon(Icons.add)),
            const SizedBox(
              height: 2,
            ),
            const CounterText(),
            const SizedBox(
              height: 2,
            ),
            ElevatedButton(
              onPressed: () => context.read<CounterCubit>().decrement(),
              child: const Icon(Icons.remove),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(3, 1),
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            ElevatedButton(
              onPressed: () => context.read<CounterCubit>().reset(),
              child: const Text('Reset'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(3, 1),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CounterText extends StatelessWidget {
  const CounterText({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final count = context.select((CounterCubit cubit) => cubit.state);
    return Text('$count', style: theme.textTheme.displaySmall);
  }
}
