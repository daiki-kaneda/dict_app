import 'package:json_annotation/json_annotation.dart';

part 'setting.g.dart';

@JsonSerializable()
class Setting {
  final int remainingTickets;

  Setting({required this.remainingTickets});

  Setting consume({int amount=1}) {
    return copyWith(remainingTickets: (remainingTickets - amount).clamp(0, remainingTickets));
  }

  Setting addTickets(int amount) {
    return copyWith(remainingTickets: remainingTickets + amount);
  }

  Setting copyWith({int? remainingTickets}) {
    return Setting(
      remainingTickets: remainingTickets ?? this.remainingTickets,
    );
  }

  factory Setting.fromJson(Map<String, dynamic> json) =>
      _$SettingFromJson(json);

  Map<String, dynamic> toJson() => _$SettingToJson(this);
}
