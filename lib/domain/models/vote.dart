// class Vote {
//   final int? id;
//   final int storyId;
//   final double vote;

//   Vote({this.id, required this.storyId, required this.vote});

//   factory Vote.fromJson(Map<String, dynamic> json) {
//     return Vote(id: json['id'], storyId: json['story_id'], vote: json['vote']);
//   }

//   Map<String, dynamic> toJson() {
//     if (id != null) {
//       return {'id': id, 'story_id': storyId, 'vote': vote};
//     }
//     return {'story_id': storyId, 'vote': vote};
//   }
// }

import 'package:freezed_annotation/freezed_annotation.dart';
part 'vote.freezed.dart';
part 'vote.g.dart';

@freezed
sealed class Vote with _$Vote {
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory Vote({@Default(0) int id, required int storyId, required double vote}) = _Vote;

  factory Vote.fromJson(Map<String, dynamic> json) => _$VoteFromJson(json);
}
