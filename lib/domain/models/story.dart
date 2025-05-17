class Story {
  int id = 0;
  final String title;
  final String story;

  Story({required this.id, required this.title, required this.story});

  factory Story.fromJson(Map<String, dynamic> json) {
    return Story(id: json['id'] as int, title: json['title'] as String, story: json['story'] as String);
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'title': title, 'story': story};
  }
}
