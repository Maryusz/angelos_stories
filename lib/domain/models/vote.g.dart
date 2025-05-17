// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vote.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Vote _$VoteFromJson(Map<String, dynamic> json) => _Vote(
  id: (json['id'] as num?)?.toInt() ?? 0,
  storyId: (json['story_id'] as num).toInt(),
  vote: (json['vote'] as num).toDouble(),
);

Map<String, dynamic> _$VoteToJson(_Vote instance) => <String, dynamic>{
  'id': instance.id,
  'story_id': instance.storyId,
  'vote': instance.vote,
};
