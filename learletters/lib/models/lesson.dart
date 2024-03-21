class Lesson {
  int? id;
  int? lessonId;
  String? content;
  String? description;
  String? type;
  String? createdAt;
  String? updatedAt;

  Lesson(
      {this.id,
      this.lessonId,
      this.content,
      this.description,
      this.type,
      this.createdAt,
      this.updatedAt});

  Lesson.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    lessonId = json['lesson_id'];
    content = json['content'];
    description = json['description'];
    type = json['type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['lesson_id'] = this.lessonId;
    data['content'] = this.content;
    data['description'] = this.description;
    data['type'] = this.type;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
