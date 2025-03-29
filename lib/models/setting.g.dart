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
      appendAnswer: json['appendAnswer'] as bool? ?? true,
      appendTranslation: json['appendTranslation'] as bool? ?? true,
      separateWordsWithParentheses:
          json['separateWordsWithParentheses'] as bool? ?? true,
      connectUnderlinedParts: json['connectUnderlinedParts'] as bool? ?? false,
      showUnderlinedParts: json['showUnderlinedParts'] as bool? ?? true,
      showPageNumbers: json['showPageNumbers'] as bool? ?? true,
      hideOnlyAlphabet: json['hideOnlyAlphabet'] as bool? ?? true,
      translationTargetLanguageCode:
          json['translationTargetLanguageCode'] as String? ?? "ja",
    );

Map<String, dynamic> _$SettingToJson(Setting instance) => <String, dynamic>{
      'remainingTickets': instance.remainingTickets,
      'textSize': instance.textSize,
      'showTranslation': instance.showTranslation,
      'audioSpeed': instance.audioSpeed,
      'repeatAudio': instance.repeatAudio,
      'appendAnswer': instance.appendAnswer,
      'appendTranslation': instance.appendTranslation,
      'separateWordsWithParentheses': instance.separateWordsWithParentheses,
      'connectUnderlinedParts': instance.connectUnderlinedParts,
      'showUnderlinedParts': instance.showUnderlinedParts,
      'showPageNumbers': instance.showPageNumbers,
      'hideOnlyAlphabet': instance.hideOnlyAlphabet,
      'translationTargetLanguageCode': instance.translationTargetLanguageCode,
    };
