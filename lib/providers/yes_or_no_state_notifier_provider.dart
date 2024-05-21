import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_your_pod/enums/yes_or_no.dart';
import 'package:river_your_pod/models/yes_or_no_model.dart';
import 'package:river_your_pod/notifiers/yes_or_no_state_notifier.dart';
import 'package:river_your_pod/state/yes_or_no_state.dart';

final yesOrNofilterStateProvider = StateProvider<YesOrNo>((ref) => YesOrNo.all);

final filteredYesOrNosProvider = Provider<Iterable<YesOrNoModel>>((ref) {
  final yesOrNos = ref.watch(yesOrNoStateNotifierProvider).yesOrNos;
  final yesOrNoFilter = ref.watch(yesOrNofilterStateProvider);
  switch (yesOrNoFilter) {
    case YesOrNo.all:
      return yesOrNos;
    case YesOrNo.yes:
      return yesOrNos.where((element) => element.answer == YesOrNo.yes);
    case YesOrNo.no:
      return yesOrNos.where((element) => element.answer == YesOrNo.no);
  }
});

final yesOrNoStateNotifierProvider =
    StateNotifierProvider<YesOrNoStateNotifier, YesOrNoState>((ref) {
  return YesOrNoStateNotifier(ref);
});
