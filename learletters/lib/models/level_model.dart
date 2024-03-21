import 'package:learletters/models/user.dart';

class LevelModel {
  User? user;
  String? message;
  String? accessToken;

  LevelModel({this.user, this.message, this.accessToken});

  LevelModel.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    message = json['message'];
    accessToken = json['accessToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['message'] = this.message;
    data['accessToken'] = this.accessToken;
    return data;
  }
}
