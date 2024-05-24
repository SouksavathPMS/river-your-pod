import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final numbersStreamProvider = StreamProvider<int>((ref) {
  return Stream<int>.periodic(
    const Duration(seconds: 1),
    (count) => count,
  );
});

class SinkingNumber extends ConsumerWidget {
  const SinkingNumber({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sinkingNumber = ref.watch(numbersStreamProvider);

    return switch (sinkingNumber) {
      AsyncData(:final value) => Text(value.toString()),
      AsyncError(:final error) => Text('Error: $error'),
      _ => const CircularProgressIndicator(),
    };
  }
}
