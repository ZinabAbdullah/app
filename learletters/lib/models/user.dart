class User {
  String? username;
  String? ipAddress;
  String? levelId;
  String? currentLevel;
  String? currentLesson;
  String? score;

  User({
    this.username,
    this.ipAddress,
    this.levelId,
    this.currentLevel,
    this.currentLesson,
    this.score,
  });

  User.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    levelId = json['level_id'];
    currentLevel = json['current_level'];
    currentLesson = json['current_lesson'];
    score = json['score'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['ip_address'] = this.ipAddress;
    data['level_id'] = this.levelId;
    data['current_level'] = this.currentLevel;
    data['current_lesson'] = this.currentLesson;
    data['score'] = this.score;
    return data;
  }
}
