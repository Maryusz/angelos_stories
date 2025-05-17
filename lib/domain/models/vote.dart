class Vote {
  final int? id;
  final int storyId;
  final double vote;

  Vote({this.id, required this.storyId, required this.vote});

  factory Vote.fromJson(Map<String, dynamic> json) {
    return Vote(id: json['id'], storyId: json['story_id'], vote: json['vote']);
  }

  Map<String, dynamic> toJson() {
    if (id != null) {
      return {'id': id, 'story_id': storyId, 'vote': vote};
    }
    return {'story_id': storyId, 'vote': vote};
  }
}
