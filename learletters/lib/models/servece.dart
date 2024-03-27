import 'dart:convert';
import 'package:learletters/main.dart';
import 'package:http/http.dart' as http;
import 'lesson_model.dart';

String? Word;
String? description;

fetchUserData(String pName) async {
  var url = Uri.parse(
      "https://arabic.coderteam.net/api/auth/login?username='$pName'&current_level=1&current_lesson=1&score=4&level_id=1&gender=female");

  var result = await http.post(url);
  var respone = jsonDecode(result.body);
  // levelModel.accessToken = respone["accessToken"];
}

fetchLevelData() async {
  var url = Uri.parse("https://arabic.coderteam.net/api/user/level/1");
  final headers = {
    'Authorization': 'Bearer ${sharedPreferences.getString("token")}',
  };
  var result = await http.get(url, headers: headers);
  print(jsonDecode(result.body));
}

fetchLessonData() async {
  var url = Uri.parse("https://arabic.coderteam.net/api/user/lesson/1");
  final headers = {
    'Authorization': 'Bearer ${sharedPreferences.getString("token")}',
  };
  var result = await http.get(url, headers: headers);

  var respone = jsonDecode(result.body);
  var example = respone["example"];
  List<LessonsModel> lessonList = [];
  for (var element in example) {
    LessonsModel lessonsModel = LessonsModel(
      content: element["content"].toString(),
      createdAt: element["created_at"],
      description: element["description"],
      id: element["id"],
      lessonId: element["lesson_id"],
      type: element["type"],
      updatedAt: element["updated_at"],
    );
    lessonList.add(lessonsModel);
  }
  Word = example[0]['content'];
  description = example[0]['description'];
}
