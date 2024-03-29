class YoutubeModel {
  final String title;
  final String description;
  final String id;
  final String thumb;
  final String url;
  YoutubeModel(
      {required this.title,
      required this.description,
      required this.id,
      required this.thumb,
      required this.url});

  factory YoutubeModel.fromMap(Map<String, dynamic> map) {
    return YoutubeModel(
        title: map["title"],
        description: map["description"],
        id: map["id"],
        thumb: map["thumb"],
        url: map["url"]);
  }
}
