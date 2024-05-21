// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:river_your_pod/enums/yes_or_no.dart';

YesOrNoModel yesOrNoModelFromJson(String str) =>
    YesOrNoModel.fromJson(json.decode(str));

String yesOrNoModelToJson(YesOrNoModel data) => json.encode(data.toJson());

class YesOrNoModel {
  YesOrNo answer;
  bool forced;
  String image;

  YesOrNoModel({
    required this.answer,
    required this.forced,
    required this.image,
  });

  factory YesOrNoModel.fromJson(Map<String, dynamic> json) {
    YesOrNo getYesOrNo(String answer) {
      if (answer == "yes") return YesOrNo.yes;
      return YesOrNo.no;
    }

    return YesOrNoModel(
      answer: getYesOrNo(json["answer"]),
      forced: json["forced"],
      image: json["image"],
    );
  }

  Map<String, dynamic> toJson() => {
        "answer": answer,
        "forced": forced,
        "image": image,
      };

  @override
  String toString() =>
      'YesOrNoModel(answer: $answer, forced: $forced, image: $image)';
}
