// ignore_for_file: avoid_print

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'basic_provider.g.dart';

final nameProvider = Provider<String>((ref) {
  ref.onDispose(() {
    print('[nameProvider] disposed');
  });
  ref.watch(counterProvider);
  DateTime now =DateTime.now();
  bool isEven =now.millisecond % 2 ==0;
  print(now.millisecond);

  return isEven ? 'John' : 'Jane';
});

final counterProvider = StateProvider<int>((ref) {
  ref.onDispose(() {
    print('[counterProvider] disposed');
  });
  return 0;
});

@Riverpod(keepAlive: true)
String age(AgeRef ref) {
// ignore: avoid_manual_providers_as_generated_provider_dependency
  final age = ref.watch(counterProvider);
  ref.onDispose(() {
    print('[ageProvider] disposed');
  });
  return 'Hi! I am $age years old.';
}
