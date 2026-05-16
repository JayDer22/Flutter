import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(

    ChangeNotifierProvider(
      create: (context) => CounterProvider(),

      child: const MyApp(),
    ),
  );
}

class CounterProvider extends ChangeNotifier {

  int count = 0;

  void increment() {
    count++;
    notifyListeners();
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: const CounterPage(),
    );
  }
}

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() =>
      _CounterPageState();
}

class _CounterPageState
    extends State<CounterPage> {

  @override
  Widget build(BuildContext context) {

    final provider =
    Provider.of<CounterProvider>(context);

    return Scaffold(

      appBar: AppBar(
        title: const Text("Counter App"),
      ),

      body: Center(
        child: Text(
          "${provider.count}",

          style: const TextStyle(
            fontSize: 35,
          ),
        ),
      ),

      floatingActionButton:
      FloatingActionButton(

        onPressed: () {
          provider.increment();
        },

        child: const Icon(Icons.add),
      ),
    );
  }
}