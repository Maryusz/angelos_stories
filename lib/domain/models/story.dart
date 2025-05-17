import 'package:freezed_annotation/freezed_annotation.dart';
part 'story.freezed.dart';
part 'story.g.dart';

@freezed
sealed class Story with _$Story {
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory Story({@Default(0) int id, required String title, required String story}) = _Story;

  factory Story.fromJson(Map<String, dynamic> json) => _$StoryFromJson(json);
}
