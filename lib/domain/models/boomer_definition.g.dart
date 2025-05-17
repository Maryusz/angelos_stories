// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'boomer_definition.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BoomerDefinition _$BoomerDefinitionFromJson(Map<String, dynamic> json) =>
    _BoomerDefinition(
      title: json['title'] as String,
      description: json['description'] as String,
      videoUrl:
          json['video_url'] == null
              ? null
              : Uri.parse(json['video_url'] as String),
    );

Map<String, dynamic> _$BoomerDefinitionToJson(_BoomerDefinition instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'video_url': instance.videoUrl?.toString(),
    };
