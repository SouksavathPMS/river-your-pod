import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../enums/yes_or_no.dart';
import '../models/yes_or_no_model.dart';
import '../notifiers/yes_or_no_state_notifier.dart';
import '../state/yes_or_no_state.dart';

final filterStateProvider = StateProvider<YesOrNo>((ref) => YesOrNo.all);

final filteredYesOrNosProvider = Provider<Iterable<YesOrNoModel>>((ref) {
  final yesOrNos = ref.watch(yesOrNoStateNotifierProvider).yesOrNos;
  final yesOrNoFilter = ref.watch(filterStateProvider);
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
