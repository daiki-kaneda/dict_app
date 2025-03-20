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
  final bool maskOnlyAlphabetOnReset;
  final SpaceKeyAction spaceKeyAction;
  final bool showScrollBar;

  // PDF-related settings
  final bool appendAnswer;
  final bool appendWordList;
  final bool separateWordsWithParentheses;
  final bool connectUnderlinedParts;
  final bool showUnderlinedParts;
  final bool showPageNumbers;
  final bool hideOnlyAlphabet;

  // Translation settings
  final String translationTarget;

  // Font settings
  final int fontSize;
  final String englishFont;
  final String? nonEnglishFont;

  const Setting({
    required this.remainingTickets,
    this.textSize = 20,
    this.showTranslation = true,
    this.audioSpeed = 1.0,
    this.repeatAudio = false,
    this.maskOnlyAlphabetOnReset = true,
    this.spaceKeyAction = SpaceKeyAction.nextWord,
    this.showScrollBar = true,
    this.appendAnswer = true,
    this.appendWordList = false,
    this.separateWordsWithParentheses = true,
    this.connectUnderlinedParts = false,
    this.showUnderlinedParts = true,
    this.showPageNumbers = true,
    this.hideOnlyAlphabet = true,
    this.translationTarget = "ja",
    this.fontSize = 20,
    this.englishFont = "Helvetica",
    this.nonEnglishFont,
  });

  Setting copyWith({
    int? remainingTickets,
    int? textSize,
    bool? showTranslation,
    double? audioSpeed,
    bool? repeatAudio,
    bool? maskOnlyAlphabetOnReset,
    SpaceKeyAction? spaceKeyAction,
    bool? showScrollBar,
    bool? appendAnswer,
    bool? appendWordList,
    bool? separateWordsWithParentheses,
    bool? connectUnderlinedParts,
    bool? showUnderlinedParts,
    bool? showPageNumbers,
    bool? hideOnlyAlphabet,
    String? translationTarget,
    int? fontSize,
    String? englishFont,
    String? nonEnglishFont,
  }) {
    return Setting(
      remainingTickets: remainingTickets ?? this.remainingTickets,
      textSize: textSize ?? this.textSize,
      showTranslation: showTranslation ?? this.showTranslation,
      audioSpeed: audioSpeed ?? this.audioSpeed,
      repeatAudio: repeatAudio ?? this.repeatAudio,
      maskOnlyAlphabetOnReset:
          maskOnlyAlphabetOnReset ?? this.maskOnlyAlphabetOnReset,
      spaceKeyAction: spaceKeyAction ?? this.spaceKeyAction,
      showScrollBar: showScrollBar ?? this.showScrollBar,
      appendAnswer: appendAnswer ?? this.appendAnswer,
      appendWordList: appendWordList ?? this.appendWordList,
      separateWordsWithParentheses:
          separateWordsWithParentheses ?? this.separateWordsWithParentheses,
      connectUnderlinedParts:
          connectUnderlinedParts ?? this.connectUnderlinedParts,
      showUnderlinedParts: showUnderlinedParts ?? this.showUnderlinedParts,
      showPageNumbers: showPageNumbers ?? this.showPageNumbers,
      hideOnlyAlphabet: hideOnlyAlphabet ?? this.hideOnlyAlphabet,
      translationTarget: translationTarget ?? this.translationTarget,
      fontSize: fontSize ?? this.fontSize,
      englishFont: englishFont ?? this.englishFont,
      nonEnglishFont: nonEnglishFont ?? this.nonEnglishFont,
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

enum SpaceKeyAction {
  nextWord,
  nextSentence,
  showAnswer,
  changeAudioSpeed,
}
