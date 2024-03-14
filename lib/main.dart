import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test3/counter.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(title: 'Test'),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.title});

  final String? title;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title?.toUpperCase() ?? 'Test',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvider('123'));

    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Demo App')),
      body: Center(
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Text('${index}');
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          var counterNotifier = ref.read(counterProvider('test').notifier);
          counterNotifier.state += 1;
        },
      ),
    );
  }
}
