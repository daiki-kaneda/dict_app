// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setting.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Setting _$SettingFromJson(Map<String, dynamic> json) => Setting(
      remainingTickets: (json['remainingTickets'] as num).toInt(),
      textSize: (json['textSize'] as num?)?.toInt() ?? 20,
      showTranslation: json['showTranslation'] as bool? ?? true,
      audioSpeed: (json['audioSpeed'] as num?)?.toDouble() ?? 1.0,
      repeatAudio: json['repeatAudio'] as bool? ?? false,
      maskOnlyAlphabetOnReset: json['maskOnlyAlphabetOnReset'] as bool? ?? true,
      spaceKeyAction: $enumDecodeNullable(
              _$SpaceKeyActionEnumMap, json['spaceKeyAction']) ??
          SpaceKeyAction.nextWord,
      showScrollBar: json['showScrollBar'] as bool? ?? true,
      appendAnswer: json['appendAnswer'] as bool? ?? true,
      appendWordList: json['appendWordList'] as bool? ?? false,
      separateWordsWithParentheses:
          json['separateWordsWithParentheses'] as bool? ?? true,
      connectUnderlinedParts: json['connectUnderlinedParts'] as bool? ?? false,
      showUnderlinedParts: json['showUnderlinedParts'] as bool? ?? true,
      showPageNumbers: json['showPageNumbers'] as bool? ?? true,
      hideOnlyAlphabet: json['hideOnlyAlphabet'] as bool? ?? true,
      translationTarget: json['translationTarget'] as String? ?? "ja",
      fontSize: (json['fontSize'] as num?)?.toInt() ?? 20,
      englishFont: json['englishFont'] as String? ?? "Helvetica",
      nonEnglishFont: json['nonEnglishFont'] as String?,
    );

Map<String, dynamic> _$SettingToJson(Setting instance) {
  final val = <String, dynamic>{
    'remainingTickets': instance.remainingTickets,
    'textSize': instance.textSize,
    'showTranslation': instance.showTranslation,
    'audioSpeed': instance.audioSpeed,
    'repeatAudio': instance.repeatAudio,
    'maskOnlyAlphabetOnReset': instance.maskOnlyAlphabetOnReset,
    'spaceKeyAction': _$SpaceKeyActionEnumMap[instance.spaceKeyAction]!,
    'showScrollBar': instance.showScrollBar,
    'appendAnswer': instance.appendAnswer,
    'appendWordList': instance.appendWordList,
    'separateWordsWithParentheses': instance.separateWordsWithParentheses,
    'connectUnderlinedParts': instance.connectUnderlinedParts,
    'showUnderlinedParts': instance.showUnderlinedParts,
    'showPageNumbers': instance.showPageNumbers,
    'hideOnlyAlphabet': instance.hideOnlyAlphabet,
    'translationTarget': instance.translationTarget,
    'fontSize': instance.fontSize,
    'englishFont': instance.englishFont,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('nonEnglishFont', instance.nonEnglishFont);
  return val;
}

const _$SpaceKeyActionEnumMap = {
  SpaceKeyAction.nextWord: 'nextWord',
  SpaceKeyAction.nextSentence: 'nextSentence',
  SpaceKeyAction.showAnswer: 'showAnswer',
  SpaceKeyAction.changeAudioSpeed: 'changeAudioSpeed',
};
