class ArtWorksModel {
  final String title;
  //final String timestamp;
  ArtWorksModel({
    required this.title,
    //required this.timestamp,
  });

  factory ArtWorksModel.fromMap(Map<String, dynamic> map) {
    return ArtWorksModel(
      title: map["title"],
    );
  }
}
