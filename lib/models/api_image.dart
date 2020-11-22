class ApiImage {
  String id;
  String parentId;
  String caption;
  String url;
  bool isFinished;
  DateTime createdAt;

  ApiImage({
    this.id,
    this.parentId,
    this.caption,
    this.url,
    this.isFinished,
    this.createdAt,
  });

  factory ApiImage.fromJson(Map<String, dynamic> data) {
    return ApiImage(
      id: data['id'],
      parentId: data['parent_id'],
      caption: data['caption'],
      url: data['url'],
      isFinished: data['finished'],
      createdAt: data['created_at'],
    );
  }

  
}
