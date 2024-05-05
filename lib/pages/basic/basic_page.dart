// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'basic_provider.dart';

class BasicPageController {
  String name;
  int age;

  BasicPageController({
    required this.name,
    required this.age,
  });

  int counter = 0;

  void incrementCounter() {
    counter++;
  }
}

final basicPageControllerProvider = Provider<BasicPageController>((ref) {
  return BasicPageController(
    name: ,
    age: ,
  );
});

class BasicPage extends ConsumerWidget {
  BasicPage({
    required String name,
    required int age,
    super.key,
  }) : controller = BasicPageController(
          name: name,
          age: age,
        );

  final BasicPageController controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final string = ref.watch(ageProvider);
    final string = 'Hi!';
    // final name = ref.read(nameProvider);
    // print(name);

    return Scaffold(
      appBar: AppBar(
        title: const Text('StateProvider'),
      ),
      body: Center(
        child: Text(
          string,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('onPressed');
          final value = ref.read(counterProvider.notifier);
          value.state++;
          final name = ref.read(nameProvider);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
