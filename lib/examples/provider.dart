import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final cityProvider = Provider((ref) => 'London');
final countryProvider = Provider((ref) => 'England');

class WhereWidget extends ConsumerWidget {
  const WhereWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final city = ref.read(cityProvider);
    final country = ref.read(countryProvider);
    return Column(
      children: [
        Text("City: $city"),
        Text("Country: $country"),
      ],
    );
  }
}

class WhereWidgetFul extends ConsumerStatefulWidget {
  const WhereWidgetFul({super.key});

  @override
  WhereWidgetFulState createState() => WhereWidgetFulState();
}

class WhereWidgetFulState extends ConsumerState<WhereWidgetFul> {
  @override
  Widget build(BuildContext context) {
    final city = ref.read(cityProvider);
    final country = ref.read(countryProvider);
    return Column(
      children: [
        Text("City: $city"),
        Text("Country: $country"),
      ],
    );
  }
}
