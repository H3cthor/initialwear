import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
            const Text(
              'Counter',
              style: TextStyle(fontSize: 15),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          WidgetStateProperty.all<Color>(Colors.black)),
                  onPressed: () {
                    if (context.read<CounterCubit>().state < 10) {
                      context.read<CounterCubit>().increment();
                    } else {
                      mostrarTostada(context);
                    }
                  },
                  child: Icon(Icons.add),
                ),
                const SizedBox(width: 5),
                BlocBuilder<CounterCubit, int>(
                  builder: (context, count) {
                    return CounterText(count: count);
                  },
                ),
                const SizedBox(width: 5),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          WidgetStateProperty.all<Color>(Colors.black)),
                  onPressed: () {
                    if (context.read<CounterCubit>().state > -10) {
                      context.read<CounterCubit>().decrement();
                    } else {
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
                style: ButtonStyle(
                    backgroundColor:
                        WidgetStateProperty.all<Color>(Colors.black)),
                onPressed: () => context.read<CounterCubit>().reset(),
                child: const Text('Resetear'))
          ],
        ),
      ),
    );
  }
}

mostrarTostada(BuildContext context) {
  Fluttertoast.showToast(
    msg: "Limite alcanzado",
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.black,
    textColor: Colors.white,
    fontSize: 16.0,
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
