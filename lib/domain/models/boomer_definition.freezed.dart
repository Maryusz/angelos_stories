// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'boomer_definition.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BoomerDefinition {

 String get title; String get description; Uri? get videoUrl;
/// Create a copy of BoomerDefinition
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BoomerDefinitionCopyWith<BoomerDefinition> get copyWith => _$BoomerDefinitionCopyWithImpl<BoomerDefinition>(this as BoomerDefinition, _$identity);

  /// Serializes this BoomerDefinition to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BoomerDefinition&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.videoUrl, videoUrl) || other.videoUrl == videoUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,description,videoUrl);

@override
String toString() {
  return 'BoomerDefinition(title: $title, description: $description, videoUrl: $videoUrl)';
}


}

/// @nodoc
abstract mixin class $BoomerDefinitionCopyWith<$Res>  {
  factory $BoomerDefinitionCopyWith(BoomerDefinition value, $Res Function(BoomerDefinition) _then) = _$BoomerDefinitionCopyWithImpl;
@useResult
$Res call({
 String title, String description, Uri? videoUrl
});




}
/// @nodoc
class _$BoomerDefinitionCopyWithImpl<$Res>
    implements $BoomerDefinitionCopyWith<$Res> {
  _$BoomerDefinitionCopyWithImpl(this._self, this._then);

  final BoomerDefinition _self;
  final $Res Function(BoomerDefinition) _then;

/// Create a copy of BoomerDefinition
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? description = null,Object? videoUrl = freezed,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,videoUrl: freezed == videoUrl ? _self.videoUrl : videoUrl // ignore: cast_nullable_to_non_nullable
as Uri?,
  ));
}

}


/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _BoomerDefinition implements BoomerDefinition {
   _BoomerDefinition({required this.title, required this.description, this.videoUrl});
  factory _BoomerDefinition.fromJson(Map<String, dynamic> json) => _$BoomerDefinitionFromJson(json);

@override final  String title;
@override final  String description;
@override final  Uri? videoUrl;

/// Create a copy of BoomerDefinition
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BoomerDefinitionCopyWith<_BoomerDefinition> get copyWith => __$BoomerDefinitionCopyWithImpl<_BoomerDefinition>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BoomerDefinitionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BoomerDefinition&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.videoUrl, videoUrl) || other.videoUrl == videoUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,description,videoUrl);

@override
String toString() {
  return 'BoomerDefinition(title: $title, description: $description, videoUrl: $videoUrl)';
}


}

/// @nodoc
abstract mixin class _$BoomerDefinitionCopyWith<$Res> implements $BoomerDefinitionCopyWith<$Res> {
  factory _$BoomerDefinitionCopyWith(_BoomerDefinition value, $Res Function(_BoomerDefinition) _then) = __$BoomerDefinitionCopyWithImpl;
@override @useResult
$Res call({
 String title, String description, Uri? videoUrl
});




}
/// @nodoc
class __$BoomerDefinitionCopyWithImpl<$Res>
    implements _$BoomerDefinitionCopyWith<$Res> {
  __$BoomerDefinitionCopyWithImpl(this._self, this._then);

  final _BoomerDefinition _self;
  final $Res Function(_BoomerDefinition) _then;

/// Create a copy of BoomerDefinition
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? description = null,Object? videoUrl = freezed,}) {
  return _then(_BoomerDefinition(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,videoUrl: freezed == videoUrl ? _self.videoUrl : videoUrl // ignore: cast_nullable_to_non_nullable
as Uri?,
  ));
}


}

// dart format on
