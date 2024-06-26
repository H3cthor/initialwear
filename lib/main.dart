
import 'package:flutter/material.dart';
import 'package:wear/wear.dart';
import 'package:weartest/widgets/counter_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "SmartWatch Counter",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.compact,
      ),
      home: const WatchScreen(),
    );
  }
}

class WatchScreen extends StatelessWidget {
  const WatchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WatchShape(
      builder: (context, shape, child) {
        return AmbientMode(
          builder: (context, mode, child) {
            return const CounterPage();
          },
        );
      },
    );
  }
}

class Counter extends StatefulWidget {
  final WearMode mode;
  const Counter(this.mode, {super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.mode == WearMode.active ? Colors.white : Colors.black,
      body: const SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlutterLogo(),
            SizedBox(height: 10,),
            Center(
              child: Text('Hola mundo wear'),
            )
          ],
        ),
      )
    );
  }
}
