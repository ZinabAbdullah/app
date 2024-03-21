class LessonsModel {
  int? id;
  int? lessonId;
  String? content;
  String? description;
  String? type;
  String? createdAt;
  String? updatedAt;

  LessonsModel(
      {required this.id,
      required this.lessonId,
      required this.content,
      required this.description,
      required this.type,
      required this.createdAt,
      required this.updatedAt});

  LessonsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    lessonId = json['lesson_id'];
    content = json['content'];
    description = json['description'];
    type = json['type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = id;
    data['lesson_id'] = lessonId;
    data['content'] = content;
    data['description'] = description;
    data['type'] = type;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
