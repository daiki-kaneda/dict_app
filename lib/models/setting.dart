import 'package:json_annotation/json_annotation.dart';
import 'package:intl/intl.dart';

part 'setting.g.dart';

@JsonSerializable()
class Setting {
  // Tickets settings
  final int remainingTickets;

  // General settings
  final int textSize;
  final bool showTranslation;
  final double audioSpeed;
  final bool repeatAudio;

  // PDF-related settings
  final bool appendAnswer;
  final bool appendTranslation;
  final bool separateWordsWithParentheses;
  final bool connectUnderlinedParts;
  final bool showUnderlinedParts;
  final bool showPageNumbers;
  final bool hideOnlyAlphabet;

  // Translation and font depends of this languageCode
  final String languageCode;

  const Setting({
    required this.remainingTickets,
    this.textSize = 20,
    this.showTranslation = true,
    this.audioSpeed = 1.0,
    this.repeatAudio = false,
    this.appendAnswer = true,
    this.appendTranslation=true,
    this.separateWordsWithParentheses = true,
    this.connectUnderlinedParts = false,
    this.showUnderlinedParts = true,
    this.showPageNumbers = true,
    this.hideOnlyAlphabet = true,
    this.languageCode = "ja",
  });

  Setting copyWith({
    int? remainingTickets,
    int? textSize,
    bool? showTranslation,
    double? audioSpeed,
    bool? repeatAudio,
    bool? appendAnswer,
    bool? appendTranslation,
    bool? separateWordsWithParentheses,
    bool? connectUnderlinedParts,
    bool? showUnderlinedParts,
    bool? showPageNumbers,
    bool? hideOnlyAlphabet,
    String? translationTarget,
  }) {
    return Setting(
      remainingTickets: remainingTickets ?? this.remainingTickets,
      textSize: textSize ?? this.textSize,
      showTranslation: showTranslation ?? this.showTranslation,
      audioSpeed: audioSpeed ?? this.audioSpeed,
      repeatAudio: repeatAudio ?? this.repeatAudio,
      appendTranslation: appendTranslation ?? this.appendTranslation,
      appendAnswer: appendAnswer ?? this.appendAnswer,
      separateWordsWithParentheses:
          separateWordsWithParentheses ?? this.separateWordsWithParentheses,
      connectUnderlinedParts:
          connectUnderlinedParts ?? this.connectUnderlinedParts,
      showUnderlinedParts: showUnderlinedParts ?? this.showUnderlinedParts,
      showPageNumbers: showPageNumbers ?? this.showPageNumbers,
      hideOnlyAlphabet: hideOnlyAlphabet ?? this.hideOnlyAlphabet,
      languageCode: translationTarget ?? this.languageCode,
    );
  }

  Setting consume({int amount = 1}) {
    return copyWith(
        remainingTickets:
            (remainingTickets - amount).clamp(0, remainingTickets));
  }

  Setting addTickets(int amount) {
    return copyWith(remainingTickets: remainingTickets + amount);
  }

  factory Setting.fromJson(Map<String, dynamic> json) =>
      _$SettingFromJson(json);

  Map<String, dynamic> toJson() => _$SettingToJson(this);
}
