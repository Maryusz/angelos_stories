// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vote.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Vote {

 int get id; int get storyId; double get vote;
/// Create a copy of Vote
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VoteCopyWith<Vote> get copyWith => _$VoteCopyWithImpl<Vote>(this as Vote, _$identity);

  /// Serializes this Vote to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Vote&&(identical(other.id, id) || other.id == id)&&(identical(other.storyId, storyId) || other.storyId == storyId)&&(identical(other.vote, vote) || other.vote == vote));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,storyId,vote);

@override
String toString() {
  return 'Vote(id: $id, storyId: $storyId, vote: $vote)';
}


}

/// @nodoc
abstract mixin class $VoteCopyWith<$Res>  {
  factory $VoteCopyWith(Vote value, $Res Function(Vote) _then) = _$VoteCopyWithImpl;
@useResult
$Res call({
 int id, int storyId, double vote
});




}
/// @nodoc
class _$VoteCopyWithImpl<$Res>
    implements $VoteCopyWith<$Res> {
  _$VoteCopyWithImpl(this._self, this._then);

  final Vote _self;
  final $Res Function(Vote) _then;

/// Create a copy of Vote
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? storyId = null,Object? vote = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,storyId: null == storyId ? _self.storyId : storyId // ignore: cast_nullable_to_non_nullable
as int,vote: null == vote ? _self.vote : vote // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _Vote implements Vote {
   _Vote({this.id = 0, required this.storyId, required this.vote});
  factory _Vote.fromJson(Map<String, dynamic> json) => _$VoteFromJson(json);

@override@JsonKey() final  int id;
@override final  int storyId;
@override final  double vote;

/// Create a copy of Vote
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VoteCopyWith<_Vote> get copyWith => __$VoteCopyWithImpl<_Vote>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VoteToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Vote&&(identical(other.id, id) || other.id == id)&&(identical(other.storyId, storyId) || other.storyId == storyId)&&(identical(other.vote, vote) || other.vote == vote));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,storyId,vote);

@override
String toString() {
  return 'Vote(id: $id, storyId: $storyId, vote: $vote)';
}


}

/// @nodoc
abstract mixin class _$VoteCopyWith<$Res> implements $VoteCopyWith<$Res> {
  factory _$VoteCopyWith(_Vote value, $Res Function(_Vote) _then) = __$VoteCopyWithImpl;
@override @useResult
$Res call({
 int id, int storyId, double vote
});




}
/// @nodoc
class __$VoteCopyWithImpl<$Res>
    implements _$VoteCopyWith<$Res> {
  __$VoteCopyWithImpl(this._self, this._then);

  final _Vote _self;
  final $Res Function(_Vote) _then;

/// Create a copy of Vote
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? storyId = null,Object? vote = null,}) {
  return _then(_Vote(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,storyId: null == storyId ? _self.storyId : storyId // ignore: cast_nullable_to_non_nullable
as int,vote: null == vote ? _self.vote : vote // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
