import 'package:freezed_annotation/freezed_annotation.dart';
part 'boomer_definition.freezed.dart';
part 'boomer_definition.g.dart';

@freezed
sealed class BoomerDefinition with _$BoomerDefinition {
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory BoomerDefinition({required String title, required String description, Uri? videoUrl}) = _BoomerDefinition;
  factory BoomerDefinition.fromJson(Map<String, dynamic> json) => _$BoomerDefinitionFromJson(json);
}
