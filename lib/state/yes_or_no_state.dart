// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:river_your_pod/models/yes_or_no_model.dart';

class YesOrNoState {
  final bool isLoading;
  final String? errorText;
  final Iterable<YesOrNoModel> yesOrNos;

  YesOrNoState({
    required this.isLoading,
    this.errorText,
    required this.yesOrNos,
  });

  YesOrNoState.initial()
      : isLoading = false,
        errorText = null,
        yesOrNos = [];

  YesOrNoState copyWithLoading(bool loading) {
    return YesOrNoState(
      isLoading: loading,
      errorText: null,
      yesOrNos: yesOrNos,
    );
  }

  YesOrNoState copyWith({
    bool? isLoading,
    String? errorText,
    Iterable<YesOrNoModel>? yesOrNos,
  }) {
    return YesOrNoState(
      isLoading: isLoading ?? this.isLoading,
      errorText: errorText ?? this.errorText,
      yesOrNos: yesOrNos ?? this.yesOrNos,
    );
  }

  @override
  String toString() =>
      'YesOrNoState(isLoading: $isLoading, errorText: $errorText, yesOrNos: $yesOrNos)';
}
