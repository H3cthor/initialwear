import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weartest/widgets/counter_cubit.dart';

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
  State<CounterView> createState() => CounterViewState();
}

class CounterViewState extends State<CounterView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Counter', style: Theme.of(context).textTheme.headlineSmall),

            const SizedBox(
              height: 5,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (context.read<CounterCubit>().state <= 10 && context.read<CounterCubit>().state >= -10) {
                      context.read<CounterCubit>().increment();
                    }
                    else {
                      mostrarTostada(context);
                    }
                  },
                  child: const Icon(Icons.add),
                ),
                const SizedBox(width: 5),
                BlocBuilder<CounterCubit, int>(
                  builder: (context, count) {
                    return CounterText(count: count);
                  },
                ),
                const SizedBox(width: 5),
                ElevatedButton(
                  onPressed: () {
                    if (context.read<CounterCubit>().state <= 10 && context.read<CounterCubit>().state >= -10) {
                      context.read<CounterCubit>().decrement();
                    }
                    else {
                      mostrarTostada(context);
                    }
                  },
                  child: const Icon(Icons.remove),
                ),
              ],
            ),

            const SizedBox(
              height: 5,
            ),

            ElevatedButton(
              onPressed: () => context.read<CounterCubit>().reset(), 
              child: const Text('Resetear counter')
            )
            
          ],
        ),
      ),
    );
  }
}

mostrarTostada(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text('Ya no puedes incrementar o decrementar el contador.'),
      duration: Duration(seconds: 1),
    ),
  );
}

class CounterText extends StatelessWidget {
  final int count;
  const CounterText({super.key, this.count = 0});

  @override
  Widget build(BuildContext context) {
    return Text(count.toString());
  }
}
