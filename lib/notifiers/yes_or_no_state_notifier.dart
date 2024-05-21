import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_your_pod/models/yes_or_no_model.dart';
import 'package:river_your_pod/state/yes_or_no_state.dart';

class YesOrNoStateNotifier extends StateNotifier<YesOrNoState> {
  final Ref ref;
  YesOrNoStateNotifier(this.ref) : super(YesOrNoState.initial()) {
    // What to do in initialization

    log(">>> YesOrNoStateNotifier has been initialized!");
  }

  final Dio _dio = Dio();

  Future<void> randomYesOrNo() async {
    state = state.copyWithLoading(true);
    try {
      final response = await _dio.get("https://yesno.wtf/api");
      final ourNewYesOrNo = YesOrNoModel.fromJson(response.data);
      state = state.copyWith(yesOrNos: [ourNewYesOrNo, ...state.yesOrNos]);
    } catch (e) {
      state = state.copyWith(errorText: e.toString());
    } finally {
      state = state.copyWithLoading(false);
    }
  }
}
