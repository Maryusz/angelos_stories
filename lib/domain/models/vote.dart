import 'package:freezed_annotation/freezed_annotation.dart';
part 'vote.freezed.dart';
part 'vote.g.dart';

@freezed
sealed class Vote with _$Vote {
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory Vote({@Default(0) int id, required int storyId, required double vote}) = _Vote;

  factory Vote.fromJson(Map<String, dynamic> json) => _$VoteFromJson(json);
}
