import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_your_pod/enums/yes_or_no.dart';
import 'package:river_your_pod/providers/yes_or_no_state_notifier_provider.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'River your pod',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Yes or No'.toUpperCase()),
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final yesOrNos = ref.watch(filteredYesOrNosProvider);
          final yesOrNoFilter = ref.watch(yesOrNofilterStateProvider);
          return Column(
            children: [
              ChipsChoice<YesOrNo>.single(
                value: yesOrNoFilter,
                onChanged: (val) {
                  final currentFilter = ref.read(yesOrNofilterStateProvider);
                  if (val == currentFilter) {
                    return;
                  }
                  ref.read(yesOrNofilterStateProvider.notifier).state = val;
                },
                choiceItems: C2Choice.listFrom<YesOrNo, String>(
                  source:
                      YesOrNo.values.map((e) => e.name.toUpperCase()).toList(),
                  value: (i, v) => YesOrNo.values[i],
                  label: (i, v) => v,
                ),
              ),
              yesOrNos.isEmpty
                  ? const Center(
                      child: Text("There is no Yes or no start to random now!"),
                    )
                  : GridView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // 2 columns
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: yesOrNos.length,
                      itemBuilder: (context, index) {
                        final yesOrNo = yesOrNos.elementAt(index);
                        return GridTile(
                          child: Image.network(
                            yesOrNo.image,
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) {
                                return child;
                              } else {
                                return Center(
                                  child: CircularProgressIndicator(
                                    value: loadingProgress.expectedTotalBytes !=
                                            null
                                        ? loadingProgress
                                                .cumulativeBytesLoaded /
                                            loadingProgress.expectedTotalBytes!
                                        : null,
                                  ),
                                );
                              }
                            },
                          ),
                        );
                      },
                    ),
            ],
          );
        },
      ),
      floatingActionButton: Consumer(
        builder: (context, ref, child) {
          final isLoading = ref.watch(yesOrNoStateNotifierProvider).isLoading;

          return FloatingActionButton(
            onPressed: isLoading
                ? null
                : () {
                    ref
                        .read(yesOrNoStateNotifierProvider.notifier)
                        .randomYesOrNo();
                  },
            tooltip: 'Increment',
            child: isLoading
                ? const CircularProgressIndicator()
                : const Icon(Icons.youtube_searched_for_rounded),
          );
        },
      ),
    );
  }
}
